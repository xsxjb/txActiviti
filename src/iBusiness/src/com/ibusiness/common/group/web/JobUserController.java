package com.ibusiness.common.group.web;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ibusiness.common.group.dao.JobInfoDao;
import com.ibusiness.common.group.dao.JobUserDao;
import com.ibusiness.common.group.entity.JobUser;
import com.ibusiness.common.page.Page;
import com.ibusiness.common.page.PropertyFilter;
import com.ibusiness.core.mapper.BeanMapper;
import com.ibusiness.core.spring.MessageHelper;
import com.ibusiness.security.api.scope.ScopeHolder;

/**
 * 人员职务管理
 * 
 * @author JiangBo
 * 
 */
@Controller
@RequestMapping("group")
public class JobUserController {
    private JobInfoDao jobInfoDao;
    private MessageHelper messageHelper;
    private BeanMapper beanMapper = new BeanMapper();
    private JobUserDao jobUserDao;

    @RequestMapping("job-user-list")
    public String list(@ModelAttribute
    Page page, @RequestParam
    Map<String, Object> parameterMap, Model model) {
        List<PropertyFilter> propertyFilters = PropertyFilter.buildFromMap(parameterMap);
        propertyFilters.add(new PropertyFilter("EQS_scopeId", ScopeHolder.getScopeId()));
        page = jobUserDao.pagedQuery(page, propertyFilters);

        model.addAttribute("page", page);

        return "common/group/job-user-list.jsp";
    }

    @RequestMapping("job-user-input")
    public String input(@RequestParam(value = "id", required = false)
    Long id, Model model) {
        if (id != null) {
            JobUser jobUser = jobUserDao.get(id);
            model.addAttribute("model", jobUser);
        }

        model.addAttribute("jobInfos", jobInfoDao.getAll());

        return "common/group/job-user-input.jsp";
    }

    @RequestMapping("job-user-save")
    public String save(@ModelAttribute
    JobUser jobUser, @RequestParam("jobId")
    long jobId, RedirectAttributes redirectAttributes) {
        JobUser dest = null;
        Long id = jobUser.getId();

        if (id != null) {
            dest = jobUserDao.get(id);
            beanMapper.copy(jobUser, dest);
        } else {
            dest = jobUser;
        }

        if (id == null) {
            dest.setScopeId(ScopeHolder.getScopeId());
        }

        dest.setJobInfo(jobInfoDao.get(jobId));

        jobUserDao.save(dest);

        messageHelper.addFlashMessage(redirectAttributes, "core.success.save", "保存成功");

        return "redirect:/group/job-user-list.do";
    }

    @RequestMapping("job-user-remove")
    public String remove(@RequestParam("selectedItem")
    List<Long> selectedItem, RedirectAttributes redirectAttributes) {
        List<JobUser> jobUsers = jobUserDao.findByIds(selectedItem);

        for (JobUser jobUser : jobUsers) {
            jobUserDao.remove(jobUser);
        }

        messageHelper.addFlashMessage(redirectAttributes, "core.success.delete", "删除成功");

        return "redirect:/group/job-user-list.do";
    }

    // ~ ======================================================================
    @Resource
    public void setJobInfoDao(JobInfoDao jobInfoDao) {
        this.jobInfoDao = jobInfoDao;
    }

    @Resource
    public void setMessageHelper(MessageHelper messageHelper) {
        this.messageHelper = messageHelper;
    }

    @Resource
    public void setJobUserDao(JobUserDao jobUserDao) {
        this.jobUserDao = jobUserDao;
    }
}
