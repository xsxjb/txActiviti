package com.tx.common.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.QueryParam;
import javax.ws.rs.core.MediaType;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.mossle.core.page.Page;
import com.mossle.party.domain.PartyEntity;
import com.mossle.party.domain.PartyStruct;
import com.mossle.party.domain.PartyStructType;
import com.mossle.party.manager.PartyStructManager;
import com.mossle.party.manager.PartyStructTypeManager;
import com.mossle.party.service.PartyService;
import com.tx.common.service.ServiceModuleService;

/**
 * 业务模块组件用controller。业务模块下包括各个业务模块的内容。
 * 每个业务模块下都有1.存储控制器 2.表单设计器 3.流程设计器
 * 
 * @author JiangBo
 *
 */
@Controller
@RequestMapping("serviceModule")
@Path("serviceModule")
public class ServiceModuleController {
    private ServiceModuleService serviceModuleService;
    
    private PartyService partyService;
    private PartyStructTypeManager partyStructTypeManager;
    private PartyStructManager partyStructManager;

    @RequestMapping("serviceModule-show")
    public String show(@RequestParam Map<String, Object> parameterMap, Model model) {
        model.addAttribute("parentId", 0);
        // 返回JSP
        return "../jsp/common/serviceModule-show";
    }
    /**
     * 菜单跳转控制方法
     * 
     * @param parameterMap
     * @param model
     * @return
     */
    @RequestMapping("serviceModule-action")
    public String moduleAction(Model model, @RequestParam(value = "packageName", required = false) String packageName,
            @RequestParam(value = "entityId", required = false) String entityId) {
        if ("root".equals(packageName)) {
            // 返回添加业务组件管理页面
            return "../jsp/common/serviceModule-list";
        }
        if (packageName.indexOf("Table") > -1) {
            // 跳转到表单存储页面
            return "redirect:/table/conf-table-show.do?packageName=" + packageName;
        }
//        init(model, partyStructTypeId, partyEntityId);
//        String hql = "from PartyStruct where childEntity.partyType.type=1 and parentEntity.id=?";
//        page = partyStructTypeManager.pagedQuery(hql, page.getPageNo(),
//                page.getPageSize(), partyEntityId);
//        model.addAttribute("page", page);
        
        // 返回JSP
        return "../jsp/common/serviceModule-show";
    }
    /**
     * 
     * @param partyStructTypeId
     * @return
     */
    @POST
    @Path("tree")
    @Produces(MediaType.APPLICATION_JSON)
    public List<Map> tree(@QueryParam("partyStructTypeId") long partyStructTypeId) {
        List<PartyEntity> partyEntities = partyService.getTopPartyEntities(partyStructTypeId);
        return generatePartyEntities(partyEntities, partyStructTypeId);
    }
    public List<Map> generatePartyEntities(List<PartyEntity> partyEntities,
            long partyStructTypeId) {
        if (partyEntities == null) {
            return null;
        }
        List<Map> list = new ArrayList<Map>();
        try {
            for (PartyEntity partyEntity : partyEntities) {
                list.add(generatePartyEntity(partyEntity, partyStructTypeId));
            }
        } catch (Exception ex) {
        }
        return list;
    }
    public Map<String, Object> generatePartyEntity(PartyEntity partyEntity,
            long partyStructTypeId) {
        Map<String, Object> map = new HashMap<String, Object>();
        try {
            map.put("id", partyEntity.getId());
            map.put("name", partyEntity.getName());
            map.put("ref", partyEntity.getRef());
            List<PartyStruct> partyStructs = partyStructManager.find(
                    "from PartyStruct where parentEntity=? order by priority",
                    partyEntity);
            List<PartyEntity> partyEntities = new ArrayList<PartyEntity>();
            for (PartyStruct partyStruct : partyStructs) {
                if (partyStruct.getPartyStructType().getId() == partyStructTypeId) {
                    PartyEntity childPartyEntity = partyStruct.getChildEntity();

                    if (childPartyEntity.getPartyType().getType() == 0) {
                        partyEntities.add(childPartyEntity);
                    }
                }
            }
            if (partyEntities.isEmpty()) {
                map.put("open", false);
            } else {
                map.put("open", true);
                map.put("children", generatePartyEntities(partyEntities, partyStructTypeId));
            }
            return map;
        } catch (Exception ex) {
            return map;
        }
    }
    /**
     * 
     * @param model
     * @param partyStructTypeId
     * @param partyEntityId
     */
    private void init(Model model, Long partyStructTypeId, Long partyEntityId) {
        List<PartyStructType> partyStructTypes = partyStructTypeManager.getAll(
                "priority", true);
        PartyStructType partyStructType = null;

        if (partyStructTypeId == null) {
            partyStructType = partyStructTypes.get(0);
            partyStructTypeId = partyStructType.getId();
        } else {
            partyStructType = partyStructTypeManager.get(partyStructTypeId);
        }
        if (partyEntityId == null) {
            partyEntityId = partyService.getTopPartyEntities(partyStructTypeId)
                    .get(0).getId();
        }
        model.addAttribute("partyStructType", partyStructType);
        model.addAttribute("partyStructTypeId", partyStructTypeId);
        model.addAttribute("partyEntityId", partyEntityId);
        model.addAttribute("partyStructTypes", partyStructTypes);
    }
    // ======================================================================
    @Resource
    public void setPartyStructTypeManager(
            PartyStructTypeManager partyStructTypeManager) {
        this.partyStructTypeManager = partyStructTypeManager;
    }
    @Resource
    public void setPartyService(PartyService partyService) {
        this.partyService = partyService;
    }
    @Resource
    public void setPartyStructManager(PartyStructManager partyStructManager) {
        this.partyStructManager = partyStructManager;
    }

    
    @Resource
    public void setServiceModuleService(ServiceModuleService serviceModuleService) {
        this.serviceModuleService = serviceModuleService;
    }
}
