package com.codegenerate.projectmanage.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ibusiness.common.page.HibernateEntityDao;
import com.codegenerate.projectmanage.entity.BomEntity;

/**   
 * @Title: Service
 * @Description: 原料BOM分解表
 * @author JiangBo
 *
 */
@Service
@Transactional
public class BomService extends HibernateEntityDao<BomEntity> {
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
    public void remove(BomEntity entity) {
        super.remove(entity);
    }
}
