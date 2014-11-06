package com.map.service;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ibusiness.common.page.HibernateEntityDao;
import com.map.entity.CustomerInfo;

/**   
 * 客户信息Service
 * @author JiangBo
 *
 */
@Service
@Transactional
public class CustomerService extends HibernateEntityDao<CustomerInfo> {
}
