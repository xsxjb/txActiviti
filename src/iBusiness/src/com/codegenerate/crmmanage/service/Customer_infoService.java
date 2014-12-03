package com.codegenerate.crmmanage.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ibusiness.common.page.HibernateEntityDao;
import com.codegenerate.crmmanage.entity.Customer_infoEntity;

/**   
 * @Title: Service
 * @Description: 客户信息表
 * @author JiangBo
 *
 */
@Service
@Transactional
public class Customer_infoService extends HibernateEntityDao<Customer_infoEntity> {
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
    public void remove(Customer_infoEntity entity) {
        super.remove(entity);
    }
}
