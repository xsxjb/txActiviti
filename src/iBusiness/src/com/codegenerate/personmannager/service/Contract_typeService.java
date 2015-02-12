package com.codegenerate.personmannager.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ibusiness.common.page.HibernateEntityDao;
import com.codegenerate.personmannager.entity.Contract_typeEntity;

/**   
 * @Title: Service
 * @Description: 合同类型页面
 * @author JiangBo
 *
 */
@Service
@Transactional
public class Contract_typeService extends HibernateEntityDao<Contract_typeEntity> {
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
    public void remove(Contract_typeEntity entity) {
        super.remove(entity);
    }
}
