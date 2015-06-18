package com.codegenerate.test.rs;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.QueryParam;
import javax.ws.rs.core.MediaType;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.springframework.stereotype.Controller;
import com.ibusiness.common.page.Page;
import com.ibusiness.common.page.PropertyFilter;
import com.ibusiness.common.util.CommonUtils;

import com.codegenerate.test.entity.TestEntity;
import com.codegenerate.test.service.TestService;
import com.codegenerate.test.entity.Test_s2Entity;
import com.codegenerate.test.service.Test_s2Service;

/**   
 * @Title: 接口
 * @Description: 测试练习表页面
 * @author JiangBo
 *
 */
@Controller
@Path("ws-test")
public class TestResource {

   /**
     * 列表接口
	 */
    @POST
    @GET
    @Path("test-list")
    @Produces(MediaType.APPLICATION_JSON)
    public JSONObject testList(@QueryParam("jsonStr") String jsonStr) {
        JSONObject json = JSONObject.fromObject(jsonStr);
        int pageNo = json.getInt("pageNo");
        int pageSize = json.getInt("pageSize");
        // 
    	JSONObject returnJson = new JSONObject();
    	Page page = new Page(pageNo, pageSize, "", "ASC");
    	Map<String, Object> parameterMap = new HashMap<String, Object>();
    	List<PropertyFilter> propertyFilters = PropertyFilter.buildFromMap(parameterMap);
    	page = getTestService().pagedQuery(page, propertyFilters);
    	// 取得对象列表
    	List<TestEntity> list = (List<TestEntity>) page.getResult();
    	// 转换JSON对象
    	JSONArray jsonArray = CommonUtils.getJsonFromList(list, null);
    	returnJson.put("datas", jsonArray);
        return returnJson;
    }
    
    /**
     * 详情接口
	 */
    @POST
    @GET
    @Path("test-input")
    @Produces(MediaType.APPLICATION_JSON)
    public JSONObject testInput(@QueryParam("jsonStr") String jsonStr) {
        JSONObject json = JSONObject.fromObject(jsonStr);
        // 根据ID查询,判断参数中是否有ID字段
        String id = null;
        if (json.containsKey("id")) {
            id = json.getString("id");
        }
        TestEntity entity;
        // 实例化子表对象
        List<Test_s2Entity> test_s2List = null;
        if (!CommonUtils.isNull(id)) {
            entity = getTestService().get(id);
            // 取得子表信息
            test_s2List = getTest_s2Service().find("from Test_s2Entity where parentid=?", id);
        } else {
            entity = new TestEntity();
        }
        // 
    	JSONObject returnJson = new JSONObject();
        // 转换JSON对象
        JSONObject jsonObj = CommonUtils.getJsonFromBean(entity, null);
        returnJson.put("datas", jsonObj);
        // 设置子表JSON
        JSONArray test_s2Array = CommonUtils.getJsonFromList(test_s2List, null);
        returnJson.put("test_s2Array", test_s2Array);
        return returnJson;
    }
    /**
     * 保存
     */
    @POST
    @GET
    @Path("test-save")
    @Produces(MediaType.APPLICATION_JSON)
    public JSONObject testSave(@QueryParam("jsonStr") String jsonStr) {
        TestEntity entity = (TestEntity) CommonUtils.getBeanFromJson(jsonStr, TestEntity.class);
        // 再进行数据复制
        String id = entity.getId();
        if (CommonUtils.isNull(id)) {
            entity.setId(UUID.randomUUID().toString());
            getTestService().insert(entity);
        } else {
            getTestService().update(entity);
        }
        JSONObject jsonObj = new JSONObject();
        jsonObj.put("stateCode", "200");
        return jsonObj;
    }
    /**
     * 删除
     */
    @POST
    @GET
    @Path("test-remove")
    @Produces(MediaType.APPLICATION_JSON)
    public JSONObject testRemove(@QueryParam("jsonStr") String jsonStr) {
        JSONObject json = JSONObject.fromObject(jsonStr);
        String id = null;
        if (json.containsKey("id")) {
            id = json.getString("id");
        }
        JSONObject jsonObj = new JSONObject();
        if (CommonUtils.isNull(id)) {
            jsonObj.put("stateCode", "404");
        } else {
            TestEntity entity = getTestService().get(id);
            getTestService().remove(entity);
            jsonObj.put("stateCode", "200");
        }
        return jsonObj;
    }
    // ======================================================================
    // Service
    public TestService getTestService() {
        return com.ibusiness.core.spring.ApplicationContextHelper.getBean(TestService.class);
    }
    public Test_s2Service getTest_s2Service() {
        return com.ibusiness.core.spring.ApplicationContextHelper.getBean(Test_s2Service.class);
    }
}
