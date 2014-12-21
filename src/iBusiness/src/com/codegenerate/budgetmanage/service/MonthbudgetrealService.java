package com.codegenerate.budgetmanage.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ibusiness.common.page.HibernateEntityDao;
import com.codegenerate.budgetmanage.entity.MonthbudgetrealEntity;

/**   
 * @Title: Service
 * @Description: 经营预算月计划执行表流程
 * @author JiangBo
 *
 */
@Service
@Transactional
public class MonthbudgetrealService extends HibernateEntityDao<MonthbudgetrealEntity> {
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
    public void remove(MonthbudgetrealEntity entity) {
        super.remove(entity);
    }
}
