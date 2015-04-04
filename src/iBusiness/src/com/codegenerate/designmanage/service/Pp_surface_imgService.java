package com.codegenerate.designmanage.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ibusiness.common.page.HibernateEntityDao;
import com.codegenerate.designmanage.entity.Pp_surface_imgEntity;

/**   
 * @Title: Service
 * @Description: 装饰进度管理表页面
 * @author JiangBo
 *
 */
@Service
@Transactional
public class Pp_surface_imgService extends HibernateEntityDao<Pp_surface_imgEntity> {
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
    public void remove(Pp_surface_imgEntity entity) {
        super.remove(entity);
    }
}
