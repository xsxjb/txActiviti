package com.ibusiness.auth.manager;

import com.ibusiness.auth.domain.Role;

import com.ibusiness.core.hibernate.HibernateEntityDao;

import org.springframework.stereotype.Service;

@Service
public class RoleManager extends HibernateEntityDao<Role> {
}
