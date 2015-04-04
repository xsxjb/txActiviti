package com.codegenerate.designmanage.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ibusiness.common.page.HibernateEntityDao;
import com.codegenerate.designmanage.entity.AutoquoteManageEntity;

/**   
 * @Title: Service
 * @Description: 自动报价页面
 * @author JiangBo
 *
 */
@Service
@Transactional
public class AutoquoteService extends HibernateEntityDao<AutoquoteManageEntity> {
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
    public void remove(AutoquoteManageEntity entity) {
        super.remove(entity);
    }
}
