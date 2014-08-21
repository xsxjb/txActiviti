package com.ibusiness.auth.manager;

import org.springframework.stereotype.Service;

import com.ibusiness.auth.domain.Role;
import com.ibusiness.page.HibernateEntityDao;

@Service
public class RoleManager extends HibernateEntityDao<Role> {
}
