package com.tx.common.service;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.tx.common.dao.CommonDao;
import com.tx.common.entity.CommonEntity;

@Service
@Transactional
public class CommonService extends CommonDao<CommonEntity> {

    /**
     * 更新
     * @param entity
     */
    public <T> void update(T entity) {
        save(entity);
    }

    /**
     * 插入
     * @param entity
     */
    public <T> void insert(T entity) {
        save(entity);
    }
    /**
     * 删除
     * @param entity
     */
    public <T> void delete(T entity) {
        super.remove(entity);

    }
}
