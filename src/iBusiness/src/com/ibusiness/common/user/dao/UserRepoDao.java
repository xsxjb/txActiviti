package com.ibusiness.common.user.dao;

import org.springframework.stereotype.Service;

import com.ibusiness.common.page.HibernateEntityDao;
import com.ibusiness.common.user.entity.UserRepo;

@Service
public class UserRepoDao extends HibernateEntityDao<UserRepo> {
}
