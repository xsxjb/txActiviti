package com.ibusiness.codebpm.service.car;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ibusiness.common.page.HibernateEntityDao;
import com.ibusiness.codebpm.entity.car.CarManageEntity;

/**   
 * @Title: Service
 * @Description: 车辆管理
 * @author JiangBo
 *
 */
@Service
@Transactional
public class CarManageService extends HibernateEntityDao<CarManageEntity> {
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
    public void remove(CarManageEntity entity) {
        super.remove(entity);
    }
}
