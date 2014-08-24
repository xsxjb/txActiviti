package com.ibusiness.common.auth.dao;

import org.springframework.stereotype.Service;

import com.ibusiness.common.auth.entity.Role;
import com.ibusiness.common.page.HibernateEntityDao;

@Service
public class RoleDao extends HibernateEntityDao<Role> {
}
