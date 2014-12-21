package com.codegenerate.budgetmanage.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ibusiness.common.page.HibernateEntityDao;
import com.codegenerate.budgetmanage.entity.AnnualmaterialplanEntity;

/**   
 * @Title: Service
 * @Description: 年度经营预算材料计划汇总表流程
 * @author JiangBo
 *
 */
@Service
@Transactional
public class AnnualmaterialplanService extends HibernateEntityDao<AnnualmaterialplanEntity> {
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
    public void remove(AnnualmaterialplanEntity entity) {
        super.remove(entity);
    }
}
