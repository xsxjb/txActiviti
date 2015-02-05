package com.webservice.rs;

import java.util.List;

import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

import net.sf.json.JSONObject;

import org.springframework.stereotype.Component;

import com.ibusiness.base.group.dao.OrgCompanyDao;
import com.ibusiness.base.group.entity.OrgCompany;
import com.ibusiness.common.util.CommonUtils;
import com.ibusiness.core.spring.ApplicationContextHelper;
/**
 * webService通用接口
 * 
 * @author JiangBo
 *
 */
@Component
@Path("cws")
public class WebServiceResource {

	/**
	 * 测试接口1
	 * @param packageName
	 * @param strTypeId
	 * @param parentId
	 * @return
	 */
    @POST
    @GET
    @Path("test1")
    @Produces(MediaType.APPLICATION_JSON)
    public JSONObject tree() {
    	List<OrgCompany> list = getOrgCompanyDao().getAll();
    	
    	JSONObject jsonObject = CommonUtils.getJsonFromBean(list.get(0), null);
        return jsonObject;
    }
    // ==================================================
    // 用户
    public OrgCompanyDao getOrgCompanyDao() {
        return ApplicationContextHelper.getBean(OrgCompanyDao.class);
    }
}
