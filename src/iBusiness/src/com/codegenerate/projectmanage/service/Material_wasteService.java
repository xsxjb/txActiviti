package com.codegenerate.projectmanage.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ibusiness.common.page.HibernateEntityDao;
import com.codegenerate.projectmanage.entity.Material_wasteEntity;

/**   
 * @Title: Service
 * @Description: 作废产品原料清单
 * @author JiangBo
 *
 */
@Service
@Transactional
public class Material_wasteService extends HibernateEntityDao<Material_wasteEntity> {
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
    public void remove(Material_wasteEntity entity) {
        super.remove(entity);
    }
}
