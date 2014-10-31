package com.codegenerate.test.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ibusiness.common.page.HibernateEntityDao;
import com.codegenerate.test.entity.TestEntity;

/**   
 * @Title: Service
 * @Description: 测试练习表
 * @author JiangBo
 *
 */
@Service
@Transactional
public class TestService extends HibernateEntityDao<TestEntity> {
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
    public void remove(TestEntity entity) {
        super.remove(entity);
    }
}
