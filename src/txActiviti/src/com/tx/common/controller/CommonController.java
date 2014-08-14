package com.tx.common.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.mossle.core.spring.MessageHelper;
import com.tx.common.entity.CommonEntity;
import com.tx.common.export.IbExportor;
import com.tx.common.export.IbTableModel;
import com.tx.common.hibernate.IbPropertyFilter;
import com.tx.common.page.IbPage;
import com.tx.common.service.CommonService;

@Controller
@RequestMapping("common")
public class CommonController {
    private MessageHelper messageHelper;
    private IbExportor exportor;
    private CommonService commonService;

    @RequestMapping("common-list")
    public String list(@ModelAttribute IbPage page, @RequestParam Map<String, Object> parameterMap, Model model) {
        // 查询条件Filter过滤器
        List<IbPropertyFilter> propertyFilters = IbPropertyFilter.buildFromMap(parameterMap);
        // 根据条件查询数据
        page = commonService.pagedQuery(page, propertyFilters);
        model.addAttribute("page", page);
        // 返回JSP
        return "../jsp/common/common-list";
    }

    /**
     * 插入
     * @param id
     * @param model
     * @return
     */
    @RequestMapping("common-input")
    public String input(@RequestParam(value = "id", required = false)
    Long id, Model model) {
        CommonEntity commonEntity = null;
        if (id != null) {
            commonEntity = commonService.get(id);
        } else {
            commonEntity = new CommonEntity();
        }
        model.addAttribute("model", commonEntity);
        
        return "../jsp/common/common-input";
    }

    /**
     * 保存
     * 
     * @return
     * @throws Exception
     */
    @RequestMapping("common-save")
    public String save(@ModelAttribute CommonEntity commonEntity, RedirectAttributes redirectAttributes) throws Exception {
        // 先进行校验
        // 再进行数据复制
        Long id = commonEntity.getId();
        if (id != null) {
            commonService.update(commonEntity);
        } else {
            commonService.insert(commonEntity);
        }
        messageHelper.addFlashMessage(redirectAttributes, "core.success.save", "保存成功");
        return "redirect:/common/common-list.do";
    }

    /**
     * 删除
     * @param selectedItem
     * @param redirectAttributes
     * @return
     */
    @RequestMapping("common-remove")
    public String remove(@RequestParam("selectedItem") List<Long> selectedItem, RedirectAttributes redirectAttributes) {
        List<CommonEntity> commonEntitys = commonService.findByIds(selectedItem);
        for (CommonEntity commonEntity : commonEntitys) {
            commonService.remove(commonEntity);
        }
        messageHelper.addFlashMessage(redirectAttributes, "core.success.delete", "删除成功");

        return "redirect:/common/common-list.do";
    }


    /**
     * 导出Excel
     * 
     * @param page
     * @param parameterMap
     * @param response
     * @throws Exception
     */
    @RequestMapping("common-export")
    public void export(@ModelAttribute IbPage page, @RequestParam Map<String, Object> parameterMap, HttpServletResponse response) throws Exception {
        List<IbPropertyFilter> propertyFilters = IbPropertyFilter.buildFromMap(parameterMap);
        page = commonService.pagedQuery(page, propertyFilters);
        IbTableModel tableModel = new IbTableModel();
        tableModel.setName("commonEntity");
        tableModel.addHeaders("id", "username", "status");
        tableModel.setData((List) page.getResult());
        exportor.export(response, tableModel);
    }

    // ======================================================================
    @Resource
    public void setMessageHelper(MessageHelper messageHelper) {
        this.messageHelper = messageHelper;
    }

    @Resource
    public void setIbExportor(IbExportor exportor) {
        this.exportor = exportor;
    }

    @Resource
    public void setCommonService(CommonService commonService) {
        this.commonService = commonService;
    }
}
