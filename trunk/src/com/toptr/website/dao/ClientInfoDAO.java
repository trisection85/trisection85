package com.toptr.website.dao;

import java.util.List;

import com.toptr.website.pojo.ClientInfo;
import org.hibernate.Criteria;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository
@Transactional
public class ClientInfoDAO
{
    @Autowired
    private SessionFactory sessionFactory;
    
    public ClientInfo getById(int id)
    {
        return (ClientInfo) sessionFactory.getCurrentSession().get(ClientInfo.class, id);
    }
    
    @SuppressWarnings("unchecked")
    public List<ClientInfo> searchClientInfo(String clientname)
    {
        Criteria criteria = sessionFactory.getCurrentSession().createCriteria(ClientInfo.class);
        criteria.add(Restrictions.ilike("clinetname", clientname+"%"));
        return criteria.list();
    }
    
    @SuppressWarnings("unchecked")
    public List<ClientInfo> getAllClientInfo()
    {
        Criteria criteria = sessionFactory.getCurrentSession().createCriteria(ClientInfo.class);
        return criteria.list();
    }
    
    public int save(ClientInfo clientInfo)
    {
        return (Integer) sessionFactory.getCurrentSession().save(clientInfo);
    }
    
    public void update(ClientInfo clientInfo)
    {
        sessionFactory.getCurrentSession().merge(clientInfo);
    }
    
    public void delete(int id)
    {
        ClientInfo c = getById(id);
        sessionFactory.getCurrentSession().delete(c);
    }
}