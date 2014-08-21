package com.ibusiness.security.client;

import javax.annotation.PostConstruct;
import javax.annotation.Resource;

import javax.jms.ConnectionFactory;

import org.springframework.jms.core.JmsTemplate;

import org.springframework.util.Assert;
/**
 * 资源可分为原始资源和加工后的资源。
 * 把一些用户认为相关性比较大资源聚合在一起形成资源包并发布出去，就是Resource Publisher。
 * Resource Publish的方式有很多种，其中包括zip、合并成一个文档、archive等，publish以后的文档可发布到多个Location中去，
 * 这里的Location就可以包括CD、打印机、web、cloud等。
 * 
 * @author JiangBo
 *
 */
public class ResourcePublisher {
    private ConnectionFactory connectionFactory;
    private JmsTemplate jmsTemplate;
    private String scopeId = "1";

    @PostConstruct
    public void afterPropertiesSet() {
        Assert.notNull(connectionFactory);
        jmsTemplate = new JmsTemplate();
        jmsTemplate.setConnectionFactory(connectionFactory);
        jmsTemplate.setPubSubDomain(true);
    }

    public void publish(String message) {
        jmsTemplate.convertAndSend(getTopic(), message);
    }

    public void publish() {
        this.publish(scopeId);
    }

    public String getTopic() {
        return "topic.security.resource";
    }

    @Resource
    public void setConnectionFactory(ConnectionFactory connectionFactory) {
        this.connectionFactory = connectionFactory;
    }

    public void setScopeId(String scopeId) {
        this.scopeId = scopeId;
    }
}
