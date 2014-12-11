package com.codegenerate.productmanage.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ibusiness.common.page.HibernateEntityDao;
import com.codegenerate.productmanage.entity.Product_out_sEntity;

/**   
 * @Title: Service
 * @Description:  项目出库申请表
 * @author JiangBo
 *
 */
@Service
@Transactional
public class Product_out_sService extends HibernateEntityDao<Product_out_sEntity> {
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
    public void remove(Product_out_sEntity entity) {
        super.remove(entity);
    }
}
