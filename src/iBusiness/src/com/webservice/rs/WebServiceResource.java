package com.webservice.rs;

import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.QueryParam;
import javax.ws.rs.core.MediaType;

import org.springframework.stereotype.Component;
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
    @Path("test1")
    @Produces(MediaType.APPLICATION_JSON)
    public String tree() {
        return "hello test1";
    }
    @GET
    @Path("login")
    @Produces(MediaType.APPLICATION_JSON)
    public String getlogin(@QueryParam("username") String username) {
        return "hello test1";
    }
    // ==================================================
}
