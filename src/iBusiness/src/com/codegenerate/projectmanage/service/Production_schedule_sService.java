package com.codegenerate.projectmanage.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ibusiness.common.page.HibernateEntityDao;
import com.codegenerate.projectmanage.entity.Production_schedule_sEntity;

/**   
 * @Title: Service
 * @Description: 项目生产进度表流程
 * @author JiangBo
 *
 */
@Service
@Transactional
public class Production_schedule_sService extends HibernateEntityDao<Production_schedule_sEntity> {
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
    public void remove(Production_schedule_sEntity entity) {
        super.remove(entity);
    }
}
