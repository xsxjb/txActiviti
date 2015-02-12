package com.codegenerate.personmannager.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ibusiness.common.page.HibernateEntityDao;
import com.codegenerate.personmannager.entity.Rewards_punishmentsEntity;

/**   
 * @Title: Service
 * @Description: 奖惩记录页面
 * @author JiangBo
 *
 */
@Service
@Transactional
public class Rewards_punishmentsService extends HibernateEntityDao<Rewards_punishmentsEntity> {
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
    public void remove(Rewards_punishmentsEntity entity) {
        super.remove(entity);
    }
}
