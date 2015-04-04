package com.codegenerate.designmanage.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ibusiness.common.page.HibernateEntityDao;
import com.codegenerate.designmanage.entity.Project_progressEntity;

/**   
 * @Title: Service
 * @Description: 装饰进度管理表页面
 * @author JiangBo
 *
 */
@Service
@Transactional
public class Project_progressService extends HibernateEntityDao<Project_progressEntity> {
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
    public void remove(Project_progressEntity entity) {
        super.remove(entity);
    }
}
