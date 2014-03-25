package com.dal.dao;

// default package
// Generated Mar 20, 2014 6:42:12 PM by Hibernate Tools 3.4.0.CR1

import com.dal.pojo.OrderHistoryId;
import com.dal.pojo.OrderHistory;

import java.util.List;
import javax.naming.InitialContext;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.LockMode;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import org.hibernate.criterion.Example;

/**
 * Home object for domain model class OrderHistory.
 * @see .OrderHistory
 * @author Hibernate Tools
 */
public class OrderHistoryHome {

	private static final Log log = LogFactory.getLog(OrderHistoryHome.class);
    static SessionFactory sf = new Configuration().configure().buildSessionFactory();
        private  Session session = getSession();

    public Session getSession() {
        
        session = sf.openSession();
       // session.beginTransaction();
        log.debug("Getting Session successful!");
        return session;
    }

    public OrderHistoryHome() {
        //this.session =  this.getSession();
    }
    
    
	public void persist(OrderHistory transientInstance) {
		log.debug("persisting OrderHistory instance");
		try {
                        session.beginTransaction();
			session.persist(transientInstance);
                        session.getTransaction().commit();
			log.debug("persist successful");
		}
		catch (RuntimeException re) {
			log.error("persist failed", re);
			throw re;
		}
	}

	public void attachDirty(OrderHistory instance) {
		log.debug("attaching dirty OrderHistory instance");
		try {
                        session.beginTransaction();
			session.saveOrUpdate(instance);
                        session.getTransaction().commit();
			log.debug("attach successful");
		}
		catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	/*public void attachClean(OrderHistory instance) {
		log.debug("attaching clean OrderHistory instance");
		try {
			session.getSessionFactory().getCurrentSession().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		}
		catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}*/

	public void delete(OrderHistory persistentInstance) {
		log.debug("deleting OrderHistory instance");
		try {
                        session.beginTransaction();
			session.delete(persistentInstance);
                        session.getTransaction().commit();
			log.debug("delete successful");
		}
		catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public OrderHistory merge(OrderHistory detachedInstance) {
		log.debug("merging OrderHistory instance");
		try {
                        session.beginTransaction();
			OrderHistory result = (OrderHistory)session.merge(detachedInstance);
                        session.getTransaction().commit();                   
			//OrderHistory result = (OrderHistory) session.getSessionFactory().getCurrentSession().merge(detachedInstance);
			log.debug("merge successful");
			return result;
		}
		catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public OrderHistory findById(java.lang.Integer id) {
		log.debug("getting OrderHistory instance with id: " + id);
		try {
                        session.beginTransaction();
			OrderHistory instance = (OrderHistory)session.get(OrderHistory.class,id);
                        //session.getTransaction().commit();  
			//OrderHistory instance = (OrderHistory) session.getSessionFactory().getCurrentSession().get("OrderHistory", id);
			if (instance == null) {
				log.debug("get successful, no instance found");
			}
			else {
				log.debug("get successful, instance found");
			}
			return instance;
		}
		catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(OrderHistory instance) {
		log.debug("finding OrderHistory instance by example");
		try {
                    
			List results = session.createCriteria(OrderHistory.class).add(Example.create(instance))
					.list();
			log.debug("find by example successful, result size: " + results.size());
			return results;
		}
		catch (RuntimeException re) {
			log.error("find by example failed", re);
			throw re;
		}
	}
}
