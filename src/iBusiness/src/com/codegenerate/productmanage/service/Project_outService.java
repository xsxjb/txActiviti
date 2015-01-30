package com.codegenerate.productmanage.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ibusiness.common.page.HibernateEntityDao;
import com.codegenerate.productmanage.entity.Project_outEntity;

/**   
 * @Title: Service
 * @Description: 项目出库表流程
 * @author JiangBo
 *
 */
@Service
@Transactional
public class Project_outService extends HibernateEntityDao<Project_outEntity> {
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
    public void remove(Project_outEntity entity) {
        super.remove(entity);
    }
}
