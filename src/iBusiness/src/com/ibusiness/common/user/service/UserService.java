package com.ibusiness.common.user.service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Map;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ibusiness.common.user.dao.UserAttrDao;
import com.ibusiness.common.user.dao.UserBaseDao;
import com.ibusiness.common.user.dao.UserRepoDao;
import com.ibusiness.common.user.dao.UserSchemaDao;
import com.ibusiness.common.user.entity.UserAttr;
import com.ibusiness.common.user.entity.UserBase;
import com.ibusiness.common.user.entity.UserSchema;
import com.ibusiness.security.api.scope.ScopeHolder;

@Service
@Transactional(rollbackFor = Exception.class)
public class UserService {
    private static Logger logger = LoggerFactory.getLogger(UserService.class);
    private UserBaseDao userBaseDao;
    private UserRepoDao userRepoDao;
    private UserAttrDao userAttrDao;
    private UserSchemaDao userSchemaDao;

    public void insertUser(UserBase userBase, Long userRepoId, Map<String, Object> parameters) {
        // user repo
        userBase.setUserRepo(userRepoDao.get(userRepoId));

        userBase.setScopeId(ScopeHolder.getScopeId());
        userBaseDao.save(userBase);

        for (Map.Entry<String, Object> entry : parameters.entrySet()) {
            String key = entry.getKey();
            String value = (String) entry.getValue();

            UserSchema userSchema = userSchemaDao.findUnique("from UserSchema where code=? and userRepo.id=?", key,
                    userRepoId);
            UserAttr userAttr = new UserAttr();
            userAttr.setUserSchema(userSchema);
            userAttr.setUserBase(userBase);
            userAttr.setScopeId(ScopeHolder.getScopeId());
            userAttrDao.save(userAttr);

            String type = userSchema.getType();

            if ("boolean".equals(type)) {
                userAttr.setBooleanValue(Integer.parseInt(value));
            } else if ("date".equals(type)) {
                try {
                    userAttr.setDateValue(new SimpleDateFormat("yyyy-MM-dd").parse(value));
                } catch (ParseException ex) {
                    logger.info(ex.getMessage(), ex);
                }
            } else if ("long".equals(type)) {
                userAttr.setLongValue(Long.parseLong(value));
            } else if ("double".equals(type)) {
                userAttr.setDoubleValue(Double.parseDouble(value));
            } else if ("string".equals(type)) {
                userAttr.setStringValue(value);
            } else {
                throw new IllegalStateException("illegal type: " + userSchema.getType());
            }

            userAttrDao.save(userAttr);
        }
    }

    public void updateUser(UserBase userBase, Long userRepoId, Map<String, Object> parameters) {
        // user repo
        userBase.setUserRepo(userRepoDao.get(userRepoId));
        userBaseDao.save(userBase);

        for (Map.Entry<String, Object> entry : parameters.entrySet()) {
            String key = entry.getKey();
            String value = (String) entry.getValue();

            UserSchema userSchema = userSchemaDao.findUnique("from UserSchema where code=? and userRepo.id=?", key,
                    userRepoId);
            UserAttr userAttr = userAttrDao.findUnique("from UserAttr where userSchema=? and userBase=?",
                    userSchema, userBase);

            if (userAttr == null) {
                userAttr = new UserAttr();
                userAttr.setUserSchema(userSchema);
                userAttr.setUserBase(userBase);
                userAttr.setScopeId(ScopeHolder.getScopeId());
            }

            String type = userSchema.getType();

            if ("boolean".equals(type)) {
                userAttr.setBooleanValue(Integer.parseInt(value));
            } else if ("date".equals(type)) {
                try {
                    userAttr.setDateValue(new SimpleDateFormat("yyyy-MM-dd").parse(value));
                } catch (ParseException ex) {
                    logger.info(ex.getMessage(), ex);
                }
            } else if ("long".equals(type)) {
                userAttr.setLongValue(Long.parseLong(value));
            } else if ("double".equals(type)) {
                userAttr.setDoubleValue(Double.parseDouble(value));
            } else if ("string".equals(type)) {
                userAttr.setStringValue(value);
            } else {
                throw new IllegalStateException("illegal type: " + userSchema.getType());
            }

            userAttrDao.save(userAttr);
        }
    }

    public void removeUser(UserBase userBase) {
        userBaseDao.removeAll(userBase.getUserAttrs());
        userBaseDao.remove(userBase);
    }

    @Resource
    public void setUserBaseDao(UserBaseDao userBaseDao) {
        this.userBaseDao = userBaseDao;
    }

    @Resource
    public void setUserRepoDao(UserRepoDao userRepoDao) {
        this.userRepoDao = userRepoDao;
    }

    @Resource
    public void setUserAttrDao(UserAttrDao userAttrDao) {
        this.userAttrDao = userAttrDao;
    }

    @Resource
    public void setUserSchemaDao(UserSchemaDao userSchemaDao) {
        this.userSchemaDao = userSchemaDao;
    }
}
