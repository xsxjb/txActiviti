package com.codegenerate.crmmanage.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ibusiness.common.page.HibernateEntityDao;
import com.codegenerate.crmmanage.entity.SupplierEntity;

/**   
 * @Title: Service
 * @Description: 原材料供应商维护
 * @author JiangBo
 *
 */
@Service
@Transactional
public class SupplierService extends HibernateEntityDao<SupplierEntity> {
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
    public void remove(SupplierEntity entity) {
        super.remove(entity);
    }
}
