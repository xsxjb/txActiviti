package com.codegenerate.personmannager.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ibusiness.common.page.HibernateEntityDao;
import com.codegenerate.personmannager.entity.Person_leaveEntity;

/**   
 * @Title: Service
 * @Description: 员工离职页面
 * @author JiangBo
 *
 */
@Service
@Transactional
public class Person_leaveService extends HibernateEntityDao<Person_leaveEntity> {
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
    public void remove(Person_leaveEntity entity) {
        super.remove(entity);
    }
}
