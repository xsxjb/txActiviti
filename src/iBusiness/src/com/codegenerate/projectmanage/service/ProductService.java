package com.codegenerate.projectmanage.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ibusiness.common.page.HibernateEntityDao;
import com.codegenerate.projectmanage.entity.ProductEntity;

/**   
 * @Title: Service
 * @Description: 产成品管理表
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
