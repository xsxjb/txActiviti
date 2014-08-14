package ${bussiPackage}.service.${entityPackage};

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.tx.common.dao.CommonDao;
import ${bussiPackage}.entity.${entityPackage}.${entityName}Entity;

/**   
 * @Title: Service
 * @Description: ${ftl_description}
 * @author JiangBo
 *
 */
public class ${entityName}Service {

    /**
     * 实例化DAO
     */
    @Autowired  
    @Qualifier("commonDao")  
	public CommonDao<${entityName}Entity> commonDao = null;
	
	/**
     * 更新
     * @param entity
     */
    public <T> void update(T entity) {
        commonDao.save(entity);
    }

    /**
     * 插入
     * @param entity
     */
    public <T> void insert(T entity) {
        commonDao.save(entity);
    }
    /**
     * 删除
     * @param entity
     */
    public <T> void remove(T entity) {
        commonDao.remove(entity);

    }
    /**
     * 设置DAO
     * @param dao the DAO to set
     */
    @Autowired(required= false) 
    public void setCommonDao(CommonDao<${entityName}Entity> commonDao) {
        this.commonDao = commonDao;
    }

    /**
     * 取得DAO
     * @return the commonDao
     */
    public CommonDao<${entityName}Entity> getCommonDao() {
        return commonDao;
    }
}
