package com.codegenerate.operationmanage.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ibusiness.common.page.HibernateEntityDao;
import com.codegenerate.operationmanage.entity.Conf_popup_pageEntity;

/**   
 * @Title: Service
 * @Description: PLC弹出页面页面
 * @author JiangBo
 *
 */
@Service
@Transactional
public class Conf_popup_pageService extends HibernateEntityDao<Conf_popup_pageEntity> {
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
    public void remove(Conf_popup_pageEntity entity) {
        super.remove(entity);
    }
}
