package com.ibusiness.api.userauth;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import com.ibusiness.api.scope.ScopeConnector;
import com.ibusiness.api.scope.ScopeDTO;
import com.ibusiness.api.user.UserConnector;
import com.ibusiness.api.user.UserDTO;
import com.ibusiness.api.userauth.UserAuthConnector;
import com.ibusiness.api.userauth.UserAuthDTO;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import org.springframework.dao.EmptyResultDataAccessException;

import org.springframework.jdbc.core.JdbcTemplate;

import org.springframework.util.Assert;

public class MockUserAuthConnector implements UserAuthConnector {
    private static Logger logger = LoggerFactory
            .getLogger(MockUserAuthConnector.class);
    private JdbcTemplate jdbcTemplate;
    private ScopeConnector scopeConnector;
    private UserConnector userConnector;
    private UserAuthDTO userAuthDto;

    public MockUserAuthConnector() {
        userAuthDto = new UserAuthDTO();
        userAuthDto.setId("1");
        userAuthDto.setScopeId("1");
        userAuthDto.setUsername("lingo");
        userAuthDto.setRef("1");
        userAuthDto.setDisplayName("lingo");
        userAuthDto.setStatus("1");
        userAuthDto.setPassword("1");

        userAuthDto.setPermissions(Collections.singletonList("*"));
        userAuthDto.setRoles(Collections.singletonList("ROLE_ADMIN"));
    }

    public UserAuthDTO findByUsername(String username, String scopeId) {
        return userAuthDto;
    }

    public UserAuthDTO findByRef(String ref, String scopeId) {
        return userAuthDto;
    }

    public UserAuthDTO findById(String id, String scopeId) {
        return userAuthDto;
    }
}
