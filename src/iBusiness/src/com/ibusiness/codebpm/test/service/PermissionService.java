package com.ibusiness.codebpm.test.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ibusiness.common.page.HibernateEntityDao;
import com.ibusiness.codebpm.test.entity.PermissionEntity;

/**   
 * @Title: Service
 * @Description: 审批权限流程表
 * @author JiangBo
 *
 */
@Service
@Transactional
public class PermissionService extends HibernateEntityDao<PermissionEntity> {
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
    public void remove(PermissionEntity entity) {
        super.remove(entity);
    }
}
