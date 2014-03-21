package com.dal.dao;

// default package
// Generated Mar 20, 2014 6:42:12 PM by Hibernate Tools 3.4.0.CR1

import com.dal.pojo.ShoppingCart;
import com.dal.pojo.ShoppingCartId;
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
 * Home object for domain model class ShoppingCart.
 * @see .ShoppingCart
 * @author Hibernate Tools
 */
public class ShoppingCartHome {

	private static final Log log = LogFactory.getLog(ShoppingCartHome.class);

	private Session session;
       
    public Session getSession() {
        SessionFactory sf = new Configuration().configure().buildSessionFactory();
        session = sf.openSession();
        session.getTransaction();
        log.debug("Getting Session successful!");
        return session;
    }

    public ShoppingCartHome() {
        this.session =  this.getSession();
    }
    
    
	public void persist(ShoppingCart transientInstance) {
		log.debug("persisting ShoppingCart instance");
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

	public void attachDirty(ShoppingCart instance) {
		log.debug("attaching dirty ShoppingCart instance");
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

	/*public void attachClean(ShoppingCart instance) {
		log.debug("attaching clean ShoppingCart instance");
		try {
			session.getSessionFactory().getCurrentSession().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		}
		catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}*/

	public void delete(ShoppingCart persistentInstance) {
		log.debug("deleting ShoppingCart instance");
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

	public ShoppingCart merge(ShoppingCart detachedInstance) {
		log.debug("merging UserCredentials instance");
		try {
                        session.beginTransaction();
			ShoppingCart result = (ShoppingCart)session.merge(detachedInstance);
                        session.getTransaction().commit();                   
			//UserCredentials result = (UserCredentials) session.getSessionFactory().getCurrentSession().merge(detachedInstance);
			log.debug("merge successful");
			return result;
		}
		catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public ShoppingCart findById(java.lang.Integer id) {
		log.debug("getting UserCredentials instance with id: " + id);
		try {
                        session.beginTransaction();
			ShoppingCart instance = (ShoppingCart)session.get(ShoppingCart.class,id);
                        //session.getTransaction().commit();  
			//UserCredentials instance = (UserCredentials) session.getSessionFactory().getCurrentSession().get("UserCredentials", id);
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

	public List findByExample(ShoppingCart instance) {
		log.debug("finding UserCredentials instance by example");
		try {
                    
			List results = session.createCriteria(ShoppingCart.class).add(Example.create(instance))
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
