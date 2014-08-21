package com.ibusiness.auth.manager;

import org.springframework.stereotype.Service;

import com.ibusiness.auth.domain.UserStatus;
import com.ibusiness.page.HibernateEntityDao;

@Service
public class UserStatusManager extends HibernateEntityDao<UserStatus> {
}
