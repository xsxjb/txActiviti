package com.ibusiness.bpm.graph;

import java.util.ArrayList;
import java.util.List;

/**
 * 流程任务节点类
 * 
 * @author JiangBo
 * 
 */
public class Node extends GraphElement {
    private String type;
    private boolean active;
    // 流程任务节点元素列表
    private List<Edge> edges = new ArrayList<Edge>();

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public boolean isActive() {
        return active;
    }

    public void setActive(boolean active) {
        this.active = active;
    }

    public List<Edge> getEdges() {
        return edges;
    }

    public void setEdges(List<Edge> edges) {
        this.edges = edges;
    }
}
