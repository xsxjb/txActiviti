package com.ibusiness.doc.controller;

import java.io.InputStream;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ibusiness.bridge.user.UserConnector;
import com.ibusiness.common.page.Page;
import com.ibusiness.common.page.PropertyFilter;
import com.ibusiness.core.mapper.BeanMapper;
import com.ibusiness.core.spring.MessageHelper;
import com.ibusiness.core.util.IoUtils;
import com.ibusiness.core.util.ServletUtils;
import com.ibusiness.doc.entity.DocInfo;
import com.ibusiness.doc.service.DocInfoService;
import com.ibusiness.doc.store.StoreConnector;
import com.ibusiness.doc.store.StoreDTO;
import com.ibusiness.security.api.scope.ScopeHolder;
import com.ibusiness.security.util.SpringSecurityUtils;

@Controller
@RequestMapping("doc")
public class DocInfoController {
    private DocInfoService docInfoService;
    private BeanMapper beanMapper = new BeanMapper();
    private UserConnector userConnector;
    private MessageHelper messageHelper;
    private StoreConnector storeConnector;

    /**
     * 文档查询列表
     * 
     * @param page
     * @param parameterMap
     * @param model
     * @return
     */
    @RequestMapping("doc-info-list")
    public String list(@ModelAttribute Page page, @RequestParam Map<String, Object> parameterMap, Model model) {
        List<PropertyFilter> propertyFilters = PropertyFilter.buildFromMap(parameterMap);
        // 
        String userId = userConnector.findByUsername(SpringSecurityUtils.getCurrentUsername(),
                ScopeHolder.getUserRepoRef()).getId();
        propertyFilters.add(new PropertyFilter("EQS_userId", userId));
        page = docInfoService.pagedQuery(page, propertyFilters);

        model.addAttribute("page", page);

        return "ibusiness/doc/doc-info-list.jsp";
    }

    /**
     * 
     * @param id
     * @param model
     * @return
     */
    @RequestMapping("doc-info-input")
    public String input(@RequestParam(value = "id", required = false) String id, Model model) {
        if (id != null) {
            DocInfo docInfo = docInfoService.get(id);
            model.addAttribute("model", docInfo);
        }
        return "ibusiness/doc/doc-info-input.jsp";
    }

    @RequestMapping("doc-info-save")
    public String save(@ModelAttribute DocInfo docInfo, @RequestParam("attachment") MultipartFile attachment,
            @RequestParam Map<String, Object> parameterMap, RedirectAttributes redirectAttributes) throws Exception {
        DocInfo dest = null;
        String id = docInfo.getId();

        StoreDTO storeDto = storeConnector.save("docinfo", attachment.getInputStream(), attachment.getOriginalFilename());
        
        if (id != null) {
            dest = docInfoService.get(id);
            beanMapper.copy(docInfo, dest);
            dest.setName(attachment.getOriginalFilename());
            dest.setPath(storeDto.getKey());
            docInfoService.save(dest);
        } else {
            dest = docInfo;
            dest.setCreateTime(new Date());
            String userId = SpringSecurityUtils.getCurrentUserId();
            dest.setUserId(userId);
            dest.setId(UUID.randomUUID().toString());
            dest.setName(attachment.getOriginalFilename());
            dest.setPath(storeDto.getKey());
            docInfoService.saveInsert(dest);
        }

        messageHelper.addFlashMessage(redirectAttributes, "core.success.save", "保存成功");

        return "redirect:/doc/doc-info-list.do";
    }

    @RequestMapping("doc-info-download")
    public void download(@RequestParam("id") String id, HttpServletResponse response) throws Exception {
        DocInfo docInfo = docInfoService.get(id);
        InputStream is = null;
        try {
            ServletUtils.setFileDownloadHeader(response, docInfo.getName());
            is = storeConnector.get("docinfo", docInfo.getPath()).getInputStream();
            IoUtils.copyStream(is, response.getOutputStream());
        } finally {
            if (is != null) {
                is.close();
            }
        }
    }

    @RequestMapping("doc-info-remove")
    public String remove(@RequestParam("selectedItem") List<Long> selectedItem,
            RedirectAttributes redirectAttributes) {
        List<DocInfo> docInfos = docInfoService.findByIds(selectedItem);
        docInfoService.removeAll(docInfos);
        messageHelper.addFlashMessage(redirectAttributes, "core.success.delete", "删除成功");

        return "redirect:/doc/doc-info-list.do";
    }

    // ~ ======================================================================
    @Resource
    public void setDocInfoService(DocInfoService docInfoService) {
        this.docInfoService = docInfoService;
    }
    @Resource
    public void setMessageHelper(MessageHelper messageHelper) {
        this.messageHelper = messageHelper;
    }
    @Resource
    public void setStoreConnector(StoreConnector storeConnector) {
        this.storeConnector = storeConnector;
    }
    @Resource
    public void setUserConnector(UserConnector userConnector) {
        this.userConnector = userConnector;
    }
}
