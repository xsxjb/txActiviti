package com.webservice.rs;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.List;
import java.util.UUID;

import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.QueryParam;
import javax.ws.rs.core.MediaType;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.springframework.stereotype.Component;

import com.codegenerate.designmanage.entity.Contract_manageEntity;
import com.codegenerate.designmanage.entity.Pp_demolition_imgEntity;
import com.codegenerate.designmanage.entity.Pp_design_imgEntity;
import com.codegenerate.designmanage.entity.Pp_done_imgEntity;
import com.codegenerate.designmanage.entity.Pp_floor_imgEntity;
import com.codegenerate.designmanage.entity.Pp_metal_imgEntity;
import com.codegenerate.designmanage.entity.Pp_surface_imgEntity;
import com.codegenerate.designmanage.entity.Pp_tile_imgEntity;
import com.codegenerate.designmanage.entity.Pp_wall_imgEntity;
import com.codegenerate.designmanage.entity.Pp_water_imgEntity;
import com.codegenerate.designmanage.entity.Project_progressEntity;
import com.codegenerate.designmanage.service.Contract_manageService;
import com.codegenerate.designmanage.service.Pp_demolition_imgService;
import com.codegenerate.designmanage.service.Pp_design_imgService;
import com.codegenerate.designmanage.service.Pp_done_imgService;
import com.codegenerate.designmanage.service.Pp_floor_imgService;
import com.codegenerate.designmanage.service.Pp_metal_imgService;
import com.codegenerate.designmanage.service.Pp_surface_imgService;
import com.codegenerate.designmanage.service.Pp_tile_imgService;
import com.codegenerate.designmanage.service.Pp_wall_imgService;
import com.codegenerate.designmanage.service.Pp_water_imgService;
import com.codegenerate.designmanage.service.Project_progressService;
import com.ibusiness.base.group.dao.OrgCompanyDao;
import com.ibusiness.cms.entity.CmsArticle;
import com.ibusiness.cms.entity.IndeximgbyworksEntity;
import com.ibusiness.cms.service.CmsArticleService;
import com.ibusiness.cms.service.IndeximgbyworksService;
import com.ibusiness.common.util.CommonUtils;
import com.ibusiness.core.spring.ApplicationContextHelper;
/**
 * 网页 HTML 通用接口
 * 
 * @author JiangBo
 *
 */
@Component
@Path("html")
public class HtmlResource {

	/**
	 * 首页初始化--图片
	 * @return
	 */
    @POST
    @GET
    @Path("initdata")
    @Produces(MediaType.APPLICATION_JSON)
    public JSONObject initdata() {
    	// 查询文章信息列表
    	JSONArray cmsArray = cmsArticleList();
    	JSONObject json = new JSONObject();
    	json.put("cmslist", cmsArray);
    	// 图片
    	List<IndeximgbyworksEntity> imgbyworkslist = getIndeximgbyworksService().getAll();
    	JSONArray imgbyworksArray = CommonUtils.getJsonFromList(imgbyworkslist, null);
    	json.put("imglist", imgbyworksArray);
        return json;
    }
    /**
     * 保存数据
     * @return
     */
    @POST
    @GET
    @Path("senddatabyindexhtml")
    @Produces(MediaType.APPLICATION_JSON)
    public JSONObject sendDataByIndexHtml(@QueryParam("customername") String customername, @QueryParam("customerphone") String customerphone,
    		@QueryParam("address") String address,@QueryParam("remark") String remark) {
		if (!CommonUtils.isNull(customername)) {
			try {
				//
				Contract_manageEntity entity = new Contract_manageEntity();
				entity.setCustomername(URLDecoder.decode(customername, "utf-8"));
				entity.setAddress(URLDecoder.decode(address, "utf-8"));
				entity.setCustomerphone(URLDecoder.decode(customerphone, "utf-8"));
				entity.setRemark(URLDecoder.decode(remark, "utf-8"));
				entity.setId(UUID.randomUUID().toString());
				entity.setTypeflag("未签");

				getContract_manageService().insert(entity);
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
		}
		JSONObject jsonObject = new JSONObject();
		return jsonObject;
    }
    
    /**
     * 查询文章信息列表
     * @return
     */
    @POST
    @GET
    @Path("html-cmsArticlelist")
    @Produces(MediaType.APPLICATION_JSON)
    public JSONArray cmsArticleList() {
    	List<CmsArticle> list = getCmsArticleService().getAll();
    	JSONArray jsonArray = new JSONArray();
    	for (CmsArticle bean : list ) {
    		JSONObject jsonObject = new JSONObject();
    		jsonObject.put("title", bean.getTitle());
    		jsonObject.put("id", bean.getId());
    		jsonObject.put("createTime", CommonUtils.getInstance().getYmd().format(bean.getCreateTime()));
    		jsonArray.add(jsonObject);
    	}
        return jsonArray;
    }
    /**
     * 查询指定的文章信息
     */
    @POST
    @GET
    @Path("html-cmsArticleView")
    @Produces(MediaType.APPLICATION_JSON)
    public JSONObject cmsArticleView(@QueryParam("id") String id) {
    	CmsArticle bean = getCmsArticleService().get(id);
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("title", bean.getTitle());
		jsonObject.put("content", bean.getContent());
		jsonObject.put("userName", bean.getUserId());
		jsonObject.put("creatTime", bean.getCreateTime());
        return jsonObject;
    }
    /**
     * 查询工程进度信息
     */
    @POST
    @GET
    @Path("html-project-progress")
    @Produces(MediaType.APPLICATION_JSON)
    public JSONObject projectProgress(@QueryParam("progressid") String progressid) {
    	Project_progressEntity bean = getProject_progressService().get(progressid);
		JSONObject jsonObject = CommonUtils.getJsonFromBean(bean, null);
        return jsonObject;
    }
    /**
     * 详细进度图片展示
     */
    @SuppressWarnings("unchecked")
	@POST
    @GET
    @Path("html-progress-demolitionimg")
    @Produces(MediaType.APPLICATION_JSON)
    public JSONArray progressDemolitionimg(@QueryParam("progressid") String progressid, @QueryParam("imgtype") String imgtype) {
    	JSONArray array = new JSONArray();
    	if ("design".equals(imgtype)) {
    		List<Pp_design_imgEntity> list = getPp_design_imgService().find("from Pp_design_imgEntity where parentid=?", progressid);
    		array = CommonUtils.getJsonFromList(list, null);
    	} else if ("demolition".equals(imgtype)) {
    		List<Pp_demolition_imgEntity> list = getPp_demolition_imgService().find("from Pp_demolition_imgEntity where parentid=?", progressid);
    		array = CommonUtils.getJsonFromList(list, null);
    	} else if ("water".equals(imgtype)) {
    		List<Pp_water_imgEntity> list = getPp_water_imgService().find("from Pp_water_imgEntity where parentid=?", progressid);
    		array = CommonUtils.getJsonFromList(list, null);
    	} else if ("tile".equals(imgtype)) {
    		List<Pp_tile_imgEntity> list = getPp_tile_imgService().find("from Pp_tile_imgEntity where parentid=?", progressid);
    		array = CommonUtils.getJsonFromList(list, null);
    	} else if ("metal".equals(imgtype)) {
    		List<Pp_metal_imgEntity> list = getPp_metal_imgService().find("from Pp_metal_imgEntity where parentid=?", progressid);
    		array = CommonUtils.getJsonFromList(list, null);
    	} else if ("wall".equals(imgtype)) {
    		List<Pp_wall_imgEntity> list = getPp_wall_imgService().find("from Pp_wall_imgEntity where parentid=?", progressid);
    		array = CommonUtils.getJsonFromList(list, null);
    	} else if ("floor".equals(imgtype)) {
    		List<Pp_floor_imgEntity> list = getPp_floor_imgService().find("from Pp_floor_imgEntity where parentid=?", progressid);
    		array = CommonUtils.getJsonFromList(list, null);
    	} else if ("surface".equals(imgtype)) {
    		List<Pp_surface_imgEntity> list = getPp_surface_imgService().find("from Pp_surface_imgEntity where parentid=?", progressid);
    		array = CommonUtils.getJsonFromList(list, null);
    	} else if ("done".equals(imgtype)) {
    		List<Pp_done_imgEntity> list = getPp_done_imgService().find("from Pp_done_imgEntity where parentid=?", progressid);
    		array = CommonUtils.getJsonFromList(list, null);
    	}
    	
        return array;
    }
    
    // ==================================================
    // 用户
    public OrgCompanyDao getOrgCompanyDao() {
        return ApplicationContextHelper.getBean(OrgCompanyDao.class);
    }
    // 首页图片管理
    public IndeximgbyworksService getIndeximgbyworksService() {
        return ApplicationContextHelper.getBean(IndeximgbyworksService.class);
    }
    // 公告文章管理表 Service
    public CmsArticleService getCmsArticleService() {
        return ApplicationContextHelper.getBean(CmsArticleService.class);
    }
    // 合同管理service
    public Contract_manageService getContract_manageService() {
        return ApplicationContextHelper.getBean(Contract_manageService.class);
    }
    // 进度管理
    public Project_progressService getProject_progressService() {
        return ApplicationContextHelper.getBean(Project_progressService.class);
    }
    // 进度管理相关 img service
    public Pp_demolition_imgService getPp_demolition_imgService() {
        return ApplicationContextHelper.getBean(Pp_demolition_imgService.class);
    }
    public Pp_design_imgService getPp_design_imgService() {
        return ApplicationContextHelper.getBean(Pp_design_imgService.class);
    }
    public Pp_done_imgService getPp_done_imgService() {
        return ApplicationContextHelper.getBean(Pp_done_imgService.class);
    }
    public Pp_floor_imgService getPp_floor_imgService() {
        return ApplicationContextHelper.getBean(Pp_floor_imgService.class);
    }
    public Pp_metal_imgService getPp_metal_imgService() {
        return ApplicationContextHelper.getBean(Pp_metal_imgService.class);
    }
    public Pp_surface_imgService getPp_surface_imgService() {
        return ApplicationContextHelper.getBean(Pp_surface_imgService.class);
    }
    public Pp_tile_imgService getPp_tile_imgService() {
        return ApplicationContextHelper.getBean(Pp_tile_imgService.class);
    }
    public Pp_wall_imgService getPp_wall_imgService() {
        return ApplicationContextHelper.getBean(Pp_wall_imgService.class);
    }
    public Pp_water_imgService getPp_water_imgService() {
        return ApplicationContextHelper.getBean(Pp_water_imgService.class);
    }
}
