package com.ibusiness.codebpm.service.test;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ibusiness.common.page.HibernateEntityDao;
import com.ibusiness.codebpm.entity.test.Test2Entity;

/**   
 * @Title: Service
 * @Description: 测试表1
 * @author JiangBo
 *
 */
@Service
@Transactional
public class Test2Service extends HibernateEntityDao<Test2Entity> {
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
    public void remove(Test2Entity entity) {
        super.remove(entity);
    }
}
