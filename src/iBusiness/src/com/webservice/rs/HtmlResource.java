package com.webservice.rs;

import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

import net.sf.json.JSONObject;

import org.springframework.stereotype.Component;

import com.ibusiness.base.group.dao.OrgCompanyDao;
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
    	JSONObject jsonObject = new JSONObject();
    	jsonObject.put("name", "hello");
        return jsonObject;
    }
    // ==================================================
    // 用户
    public OrgCompanyDao getOrgCompanyDao() {
        return ApplicationContextHelper.getBean(OrgCompanyDao.class);
    }
}
