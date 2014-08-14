package com.tx.common.dao;

import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.tx.common.entity.CommonEntity;

/**
 * DAO
 */
@Component
@Transactional(rollbackFor = Exception.class)
public class OneGUIDao extends CommonDao<CommonEntity> {
    
}
