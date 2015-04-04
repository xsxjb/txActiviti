package com.codegenerate.designmanage.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ibusiness.common.page.HibernateEntityDao;
import com.codegenerate.designmanage.entity.AutoquoteBedroomEntity;

/**   
 * @Title: Service
 * @Description: 自动报价页面
 * @author JiangBo
 *
 */
@Service
@Transactional
public class AutoquoteBedroomService extends HibernateEntityDao<AutoquoteBedroomEntity> {
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
    public void remove(AutoquoteBedroomEntity entity) {
        super.remove(entity);
    }
}
