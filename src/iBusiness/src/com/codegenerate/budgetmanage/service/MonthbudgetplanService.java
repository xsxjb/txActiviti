package com.codegenerate.budgetmanage.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ibusiness.common.page.HibernateEntityDao;
import com.codegenerate.budgetmanage.entity.MonthbudgetplanEntity;

/**   
 * @Title: Service
 * @Description: 经营预算月计划表流程
 * @author JiangBo
 *
 */
@Service
@Transactional
public class MonthbudgetplanService extends HibernateEntityDao<MonthbudgetplanEntity> {
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
    public void remove(MonthbudgetplanEntity entity) {
        super.remove(entity);
    }
}
