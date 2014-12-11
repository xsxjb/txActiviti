package com.codegenerate.productmanage.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ibusiness.common.page.HibernateEntityDao;
import com.codegenerate.productmanage.entity.Product_inEntity;

/**   
 * @Title: Service
 * @Description: 产品入库表
 * @author JiangBo
 *
 */
@Service
@Transactional
public class Product_inService extends HibernateEntityDao<Product_inEntity> {
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
    public void remove(Product_inEntity entity) {
        super.remove(entity);
    }
}
