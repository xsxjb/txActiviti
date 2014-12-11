package com.codegenerate.productmanage.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ibusiness.common.page.HibernateEntityDao;
import com.codegenerate.productmanage.entity.Product_in_sEntity;

/**   
 * @Title: Service
 * @Description: 产品入库表
 * @author JiangBo
 *
 */
@Service
@Transactional
public class Product_in_sService extends HibernateEntityDao<Product_in_sEntity> {
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
    public void remove(Product_in_sEntity entity) {
        super.remove(entity);
    }
}
