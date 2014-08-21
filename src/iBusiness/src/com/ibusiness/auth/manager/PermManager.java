package com.ibusiness.auth.manager;

import org.springframework.stereotype.Service;

import com.ibusiness.auth.domain.Perm;
import com.ibusiness.page.HibernateEntityDao;

@Service
public class PermManager extends HibernateEntityDao<Perm> {
}
