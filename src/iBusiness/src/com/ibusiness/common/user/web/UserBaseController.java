package com.ibusiness.common.user.web;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ibusiness.bridge.user.UserCache;
import com.ibusiness.bridge.user.UserDTO;
import com.ibusiness.common.group.dao.JobInfoDao;
import com.ibusiness.common.page.Page;
import com.ibusiness.common.page.PropertyFilter;
import com.ibusiness.common.user.dao.UserBaseDao;
import com.ibusiness.common.user.dao.UserRepoDao;
import com.ibusiness.common.user.entity.UserBase;
import com.ibusiness.common.user.entity.UserRepo;
import com.ibusiness.common.user.service.UserService;
import com.ibusiness.common.user.support.UserBaseWrapper;
import com.ibusiness.core.mapper.BeanMapper;
import com.ibusiness.core.spring.MessageHelper;
import com.ibusiness.core.util.ServletUtils;
import com.ibusiness.security.api.scope.ScopeHolder;
import com.ibusiness.security.util.SimplePasswordEncoder;

/**
 * 用户管理
 * 
 * @author JiangBo
 * 
 */
@Controller
@RequestMapping("user")
public class UserBaseController {
    private UserBaseDao userBaseDao;
    private UserRepoDao userRepoDao;
    private UserCache userCache;
    private MessageHelper messageHelper;
    private BeanMapper beanMapper = new BeanMapper();
    private SimplePasswordEncoder simplePasswordEncoder;
    private UserService userService;
    // 职务管理表DAO
    private JobInfoDao jobInfoDao;

    /**
     * 查看
     * 
     * @param page
     * @param parameterMap
     * @param model
     * @return
     */
    @RequestMapping("user-base-list")
    public String list(@ModelAttribute
    Page page, @RequestParam
    Map<String, Object> parameterMap, Model model) {
        List<PropertyFilter> propertyFilters = PropertyFilter.buildFromMap(parameterMap);
        UserRepo userRepo = userRepoDao.findUniqueBy("code", ScopeHolder.getScopeCode());
        propertyFilters.add(new PropertyFilter("EQL_userRepo.id", Long.toString(userRepo.getId())));
        page = userBaseDao.pagedQuery(page, propertyFilters);
        List<UserBase> userBases = (List<UserBase>) page.getResult();
        List<UserBaseWrapper> userBaseWrappers = new ArrayList<UserBaseWrapper>();

        for (UserBase userBase : userBases) {
            userBaseWrappers.add(new UserBaseWrapper(userBase));
        }

        page.setResult(userBaseWrappers);
        model.addAttribute("page", page);

        return "common/user/user-base-list.jsp";
    }

    /**
     * 插入页面
     * 
     * @param id
     * @param model
     * @return
     */
    @RequestMapping("user-base-input")
    public String input(@RequestParam(value = "id", required = false) Long id, Model model) {
        UserBase userBase = null;

        if (id != null) {
            userBase = userBaseDao.get(id);
        } else {
            userBase = new UserBase();

            UserRepo userRepo = userRepoDao.findUniqueBy("code", ScopeHolder.getScopeCode());
            userBase.setUserRepo(userRepo);
        }

        UserBaseWrapper userBaseWrapper = new UserBaseWrapper(userBase);
        model.addAttribute("model", userBase);
        model.addAttribute("userBaseWrapper", userBaseWrapper);
        // 设置职务管理下拉数据
        model.addAttribute("jobInfos", jobInfoDao.getAll());

        return "common/user/user-base-input.jsp";
    }

    /**
     * 保存
     * 
     * @param userBase
     * @param confirmPassword
     * @param userRepoId
     * @param parameterMap
     * @param redirectAttributes
     * @return
     * @throws Exception
     */
    @RequestMapping("user-base-save")
    public String save(@ModelAttribute UserBase userBase, @RequestParam(value = "confirmPassword", required = false)
    String confirmPassword, @RequestParam("userRepoId") Long userRepoId, @RequestParam("jobId") long jobId,
    @RequestParam Map<String, Object> parameterMap, RedirectAttributes redirectAttributes) throws Exception {
        // 先进行校验
        if (userBase.getPassword() != null) {
            if (!userBase.getPassword().equals(confirmPassword)) {
                messageHelper.addFlashMessage(redirectAttributes, "user.user.input.passwordnotequals", "两次输入密码不符");

                // TODO: 还要填充schema
                return "user/user-base-input";
            }

            if (simplePasswordEncoder != null) {
                userBase.setPassword(simplePasswordEncoder.encode(userBase.getPassword()));
            }
        }

        Map<String, Object> parameters = ServletUtils.getParametersStartingWith(parameterMap, "_user_attr_");

        // 再进行数据复制
        UserBase dest = null;
        Long id = userBase.getId();

        if (id != null) {
            dest = userBaseDao.get(id);
            dest.setStatus(0);
            beanMapper.copy(userBase, dest);
            dest.setJobInfo(jobInfoDao.get(jobId));
            userService.updateUser(dest, userRepoId, parameters);
        } else {
            dest = userBase;
            dest.setJobInfo(jobInfoDao.get(jobId));
            userService.insertUser(dest, userRepoId, parameters);
        }

        messageHelper.addFlashMessage(redirectAttributes, "core.success.save", "保存成功");

        UserDTO userDto = new UserDTO();
        userDto.setId(Long.toString(dest.getId()));
        userDto.setUsername(dest.getUsername());
        userDto.setRef(dest.getRef());
        userDto.setUserRepoRef(Long.toString(userRepoId));
        userCache.removeUser(userDto);

        return "redirect:/user/user-base-list.do";
    }

    /**
     * 删除
     * 
     * @param selectedItem
     * @param redirectAttributes
     * @return
     */
    @RequestMapping("user-base-remove")
    public String remove(@RequestParam("selectedItem")
    List<Long> selectedItem, RedirectAttributes redirectAttributes) {
        List<UserBase> userBases = userBaseDao.findByIds(selectedItem);

        for (UserBase userBase : userBases) {
            userService.removeUser(userBase);

            UserDTO userDto = new UserDTO();
            userDto.setId(Long.toString(userBase.getId()));
            userDto.setUsername(userBase.getUsername());
            userDto.setRef(userBase.getRef());
            userDto.setUserRepoRef(Long.toString(userBase.getUserRepo().getId()));
            userCache.removeUser(userDto);
        }

        messageHelper.addFlashMessage(redirectAttributes, "core.success.delete", "删除成功");

        return "redirect:/user/user-base-list.do";
    }

    /**
     * 查询功能
     * 
     * @param page
     * @param model
     * @return
     */
    @RequestMapping("user-base-search")
    public String search(@ModelAttribute
    Page page, Model model) {
        StringBuilder buff = new StringBuilder("select ub from UserBase ub");

        Map<String, Object> params = new HashMap<String, Object>();

        if (!params.isEmpty()) {
            page = userBaseDao.pagedQuery(buff.toString(), page.getPageNo(), page.getPageSize(), params);

            List<UserBase> userBases = (List<UserBase>) page.getResult();
            List<UserBaseWrapper> userBaseWrappers = new ArrayList<UserBaseWrapper>();

            for (UserBase userBase : userBases) {
                userBaseWrappers.add(new UserBaseWrapper(userBase));
            }

            page.setResult(userBaseWrappers);
            model.addAttribute("page", page);
        }

        return "common/user/user-base-search.jsp";
    }

    /**
     * check
     * 
     * @param username
     * @param id
     * @return
     * @throws Exception
     */
    @RequestMapping("user-base-checkUsername")
    @ResponseBody
    public boolean checkUsername(@RequestParam("username")
    String username, @RequestParam(value = "id", required = false)
    Long id) throws Exception {
        String hql = "from UserBase where username=?";
        Object[] params = {
            username };

        if (id != null) {
            hql = "from UserBase where username=? and id<>?";
            params = new Object[] {
                    username, id };
        }

        boolean result = userBaseDao.findUnique(hql, params) == null;

        return result;
    }

    // ~ ======================================================================
    @Resource
    public void setUserBaseDao(UserBaseDao userBaseDao) {
        this.userBaseDao = userBaseDao;
    }

    @Resource
    public void setUserRepoDao(UserRepoDao userRepoDao) {
        this.userRepoDao = userRepoDao;
    }

    @Resource
    public void setUserCache(UserCache userCache) {
        this.userCache = userCache;
    }

    @Resource
    public void setMessageHelper(MessageHelper messageHelper) {
        this.messageHelper = messageHelper;
    }

    @Resource
    public void setSimplePasswordEncoder(SimplePasswordEncoder simplePasswordEncoder) {
        this.simplePasswordEncoder = simplePasswordEncoder;
    }

    @Resource
    public void setUserService(UserService userService) {
        this.userService = userService;
    }
    @Resource
    public void setJobInfoDao(JobInfoDao jobInfoDao) {
        this.jobInfoDao = jobInfoDao;
    }
}
