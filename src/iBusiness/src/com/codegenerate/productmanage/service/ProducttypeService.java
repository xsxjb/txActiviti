package com.codegenerate.productmanage.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ibusiness.common.page.HibernateEntityDao;
import com.codegenerate.productmanage.entity.ProducttypeEntity;

/**   
 * @Title: Service
 * @Description: 产品分类表
 * @author JiangBo
 *
 */
@Service
@Transactional
public class ProducttypeService extends HibernateEntityDao<ProducttypeEntity> {
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
    public void remove(ProducttypeEntity entity) {
        super.remove(entity);
    }
}