package com.codegenerate.budgetmanage.service;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.codegenerate.budgetmanage.entity.AnnualchangeplanEntity;
import com.ibusiness.common.page.HibernateEntityDao;

/**   
 * @Title: Service
 * @Description: 经营预算年度计划增补、变更流程表流程
 * @author JiangBo
 *
 */
@Service
@Transactional
public class AnnualchangeplanService extends HibernateEntityDao<AnnualchangeplanEntity> {
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
    public void remove(AnnualchangeplanEntity entity) {
        super.remove(entity);
    }
}
