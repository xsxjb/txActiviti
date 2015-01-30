package com.codegenerate.projectmanage.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ibusiness.common.page.HibernateEntityDao;
import com.codegenerate.projectmanage.entity.Bom_materialsEntity;

/**   
 * @Title: Service
 * @Description: 原料BOM分解表页面
 * @author JiangBo
 *
 */
@Service
@Transactional
public class Bom_materialsService extends HibernateEntityDao<Bom_materialsEntity> {
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
    public void remove(Bom_materialsEntity entity) {
        super.remove(entity);
    }
}
