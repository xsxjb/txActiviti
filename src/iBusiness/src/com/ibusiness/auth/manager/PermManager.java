package com.ibusiness.auth.manager;

import com.ibusiness.auth.domain.Perm;

import com.ibusiness.core.hibernate.HibernateEntityDao;

import org.springframework.stereotype.Service;

@Service
public class PermManager extends HibernateEntityDao<Perm> {
}
