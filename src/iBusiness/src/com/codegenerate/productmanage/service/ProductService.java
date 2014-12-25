package com.codegenerate.productmanage.service;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.codegenerate.productmanage.entity.ProductEntity;
import com.ibusiness.common.page.HibernateEntityDao;

/**   
 * @Title: Service
 * @Description: 产品管理表
 * @author JiangBo
 *
 */
@Service
@Transactional
public class ProductService extends HibernateEntityDao<ProductEntity> {
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
    public void remove(ProductEntity entity) {
        super.remove(entity);
    }
}
