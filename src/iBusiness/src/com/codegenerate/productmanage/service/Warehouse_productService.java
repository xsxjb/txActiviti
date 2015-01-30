package com.codegenerate.productmanage.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ibusiness.common.page.HibernateEntityDao;
import com.codegenerate.productmanage.entity.Warehouse_productEntity;

/**   
 * @Title: Service
 * @Description: 产品库存管理表页面
 * @author JiangBo
 *
 */
@Service
@Transactional
public class Warehouse_productService extends HibernateEntityDao<Warehouse_productEntity> {
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
    public void remove(Warehouse_productEntity entity) {
        super.remove(entity);
    }
}
