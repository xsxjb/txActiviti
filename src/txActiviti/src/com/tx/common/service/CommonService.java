package com.tx.common.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.tx.common.dao.CommonDao;
import com.tx.common.entity.CommonEntity;

@Service("commonService")
@Transactional
public class CommonService {
    /**
     * 实例化DAO
     */
    @Autowired  
    @Qualifier("commonDao")  
	public CommonDao<CommonEntity> commonDao = null;

    /**
     * 更新
     * @param entity
     */
    public <T> void update(T entity) {
        commonDao.save(entity);
    }

    /**
     * 插入
     * @param entity
     */
    public <T> void insert(T entity) {
        commonDao.save(entity);
    }
    /**
     * 删除
     * @param entity
     */
    public <T> void remove(T entity) {
        commonDao.remove(entity);

    }
    /**
     * 设置DAO
     * @param dao the DAO to set
     */
    @Autowired(required= false) 
    public void setCommonDao(CommonDao<CommonEntity> commonDao) {
        this.commonDao = commonDao;
    }

    /**
     * 取得DAO
     * @return the commonDao
     */
    public CommonDao<CommonEntity> getCommonDao() {
        return commonDao;
    }
}
