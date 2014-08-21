package com.ibusiness.page;

public class EntityRemovedEvent extends EntityEvent {
    private static final long serialVersionUID = 0L;

    public EntityRemovedEvent(Object entity) {
        super(entity);
    }

    public boolean isRemoved() {
        return true;
    }
}