package com.ibusiness.common.auth.dao;

import org.springframework.stereotype.Service;

import com.ibusiness.common.auth.entity.UserStatus;
import com.ibusiness.common.page.HibernateEntityDao;
/**
 * 用户状态表DAO
 * 
 * @author JiangBo
 *
 */
@Service
public class UserStatusDao extends HibernateEntityDao<UserStatus> {
}
