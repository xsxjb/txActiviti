package com.codegenerate.projectmanage.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ibusiness.common.page.HibernateEntityDao;
import com.codegenerate.projectmanage.entity.Project_approvalEntity;

/**   
 * @Title: Service
 * @Description: 项目立项表
 * @author JiangBo
 *
 */
@Service
@Transactional
public class Project_approvalService extends HibernateEntityDao<Project_approvalEntity> {
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
    public void remove(Project_approvalEntity entity) {
        super.remove(entity);
    }
}
