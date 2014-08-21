package com.ibusiness.api.scope;
/**
 * 应用管理缓存接口
 * 
 * @author JiangBo
 *
 */
public interface ScopeCache {
    ScopeDTO findById(String id);

    ScopeDTO findByRef(String ref);

    ScopeDTO findByCode(String code);

    void updateScope(ScopeDTO scopeDto);

    void removeScope(ScopeDTO scopeDto);
}
