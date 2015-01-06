package com.codegenerate.operationmanage.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ibusiness.common.page.HibernateEntityDao;
import com.codegenerate.operationmanage.entity.Pop_conf_ctrlobjEntity;

/**   
 * @Title: Service
 * @Description: PLC弹出页面控件对象配置表页面
 * @author JiangBo
 *
 */
@Service
@Transactional
public class Pop_conf_ctrlobjService extends HibernateEntityDao<Pop_conf_ctrlobjEntity> {
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
    public void remove(Pop_conf_ctrlobjEntity entity) {
        super.remove(entity);
    }
}
