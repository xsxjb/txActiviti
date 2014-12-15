package com.codegenerate.budgetmanage.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ibusiness.common.page.HibernateEntityDao;
import com.codegenerate.budgetmanage.entity.Operatbudgetplan_sEntity;

/**   
 * @Title: Service
 * @Description: 经营预算年度计划申报表
 * @author JiangBo
 *
 */
@Service
@Transactional
public class Operatbudgetplan_sService extends HibernateEntityDao<Operatbudgetplan_sEntity> {
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
    public void remove(Operatbudgetplan_sEntity entity) {
        super.remove(entity);
    }
}
