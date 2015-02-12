package com.codegenerate.personmannager.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ibusiness.common.page.HibernateEntityDao;
import com.codegenerate.personmannager.entity.Assess_recordEntity;

/**   
 * @Title: Service
 * @Description: 考核记录页面
 * @author JiangBo
 *
 */
@Service
@Transactional
public class Assess_recordService extends HibernateEntityDao<Assess_recordEntity> {
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
    public void remove(Assess_recordEntity entity) {
        super.remove(entity);
    }
}
