package com.ibusiness.auth.manager;

import com.ibusiness.auth.domain.UserStatus;

import com.ibusiness.core.hibernate.HibernateEntityDao;

import org.springframework.stereotype.Service;

@Service
public class UserStatusManager extends HibernateEntityDao<UserStatus> {
}
