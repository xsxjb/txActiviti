package com.codegenerate.budgetmanage.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ibusiness.common.page.HibernateEntityDao;
import com.codegenerate.budgetmanage.entity.Monthbudgetreal_sEntity;

/**   
 * @Title: Service
 * @Description: 经营预算月计划执行表流程
 * @author JiangBo
 *
 */
@Service
@Transactional
public class Monthbudgetreal_sService extends HibernateEntityDao<Monthbudgetreal_sEntity> {
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
    public void remove(Monthbudgetreal_sEntity entity) {
        super.remove(entity);
    }
}
