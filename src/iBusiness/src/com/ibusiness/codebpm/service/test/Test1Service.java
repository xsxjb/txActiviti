package com.ibusiness.codebpm.service.test;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ibusiness.common.page.HibernateEntityDao;
import com.ibusiness.codebpm.entity.test.Test1Entity;

/**   
 * @Title: Service
 * @Description: 测试表1
 * @author JiangBo
 *
 */
@Service
@Transactional
public class Test1Service extends HibernateEntityDao<Test1Entity> {
    /**
     * 插入
     * @param entity
     */
    public <T> void insert(T entity) {
        super.saveInsert(entity);
    }
    /**
     * 删除
     * @param entity
     */
    public void remove(Test1Entity entity) {
        super.remove(entity);
    }
}
