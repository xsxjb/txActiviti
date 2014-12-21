package com.codegenerate.budgetmanage.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ibusiness.common.page.HibernateEntityDao;
import com.codegenerate.budgetmanage.entity.Annualchangeplan_sEntity;

/**   
 * @Title: Service
 * @Description: 经营预算年度计划增补、变更流程表流程
 * @author JiangBo
 *
 */
@Service
@Transactional
public class Annualchangeplan_sService extends HibernateEntityDao<Annualchangeplan_sEntity> {
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
    public void remove(Annualchangeplan_sEntity entity) {
        super.remove(entity);
    }
}
