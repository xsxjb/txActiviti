package com.codegenerate.operationmanage.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ibusiness.common.page.HibernateEntityDao;
import com.codegenerate.operationmanage.entity.AirconditionlogEntity;

/**   
 * @Title: Service
 * @Description: 空调控制记录
 * @author JiangBo
 *
 */
@Service
@Transactional
public class AirconditionlogService extends HibernateEntityDao<AirconditionlogEntity> {
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
    public void remove(AirconditionlogEntity entity) {
        super.remove(entity);
    }
}
