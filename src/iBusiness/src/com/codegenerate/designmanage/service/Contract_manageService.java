package com.codegenerate.designmanage.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ibusiness.common.page.HibernateEntityDao;
import com.codegenerate.designmanage.entity.Contract_manageEntity;

/**   
 * @Title: Service
 * @Description: 合同管理页面
 * @author JiangBo
 *
 */
@Service
@Transactional
public class Contract_manageService extends HibernateEntityDao<Contract_manageEntity> {
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
    public void remove(Contract_manageEntity entity) {
        super.remove(entity);
    }
}
