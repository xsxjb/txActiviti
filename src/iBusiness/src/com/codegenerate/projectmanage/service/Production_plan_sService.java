package com.codegenerate.projectmanage.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ibusiness.common.page.HibernateEntityDao;
import com.codegenerate.projectmanage.entity.Production_plan_sEntity;

/**   
 * @Title: Service
 * @Description: 项目生产计划表
 * @author JiangBo
 *
 */
@Service
@Transactional
public class Production_plan_sService extends HibernateEntityDao<Production_plan_sEntity> {
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
    public void remove(Production_plan_sEntity entity) {
        super.remove(entity);
    }
}
