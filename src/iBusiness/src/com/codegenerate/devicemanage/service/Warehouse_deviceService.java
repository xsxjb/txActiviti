package com.codegenerate.devicemanage.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ibusiness.common.page.HibernateEntityDao;
import com.codegenerate.devicemanage.entity.Warehouse_deviceEntity;

/**   
 * @Title: Service
 * @Description: 设备库存管理表页面
 * @author JiangBo
 *
 */
@Service
@Transactional
public class Warehouse_deviceService extends HibernateEntityDao<Warehouse_deviceEntity> {
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
    public void remove(Warehouse_deviceEntity entity) {
        super.remove(entity);
    }
}
