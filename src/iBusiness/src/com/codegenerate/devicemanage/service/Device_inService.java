package com.codegenerate.devicemanage.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ibusiness.common.page.HibernateEntityDao;
import com.codegenerate.devicemanage.entity.Device_inEntity;

/**   
 * @Title: Service
 * @Description: 设备入库表流程
 * @author JiangBo
 *
 */
@Service
@Transactional
public class Device_inService extends HibernateEntityDao<Device_inEntity> {
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
    public void remove(Device_inEntity entity) {
        super.remove(entity);
    }
}
