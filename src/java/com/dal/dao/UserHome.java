package com.dal.dao;

// default package
// Generated Mar 20, 2014 6:42:12 PM by Hibernate Tools 3.4.0.CR1

import com.dal.pojo.User;
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
 * Home object for domain model class User.
 * @see .User
 * @author Hibernate Tools
 */
public class UserHome {

    //private static final Log log = LogFactory.getLog(UserHome.class);
    private static final Log log = LogFactory.getLog(UserHome.class);
    private Session session;
       
    public Session getSession() {
        SessionFactory sf = new Configuration().configure().buildSessionFactory();
        session = sf.openSession();
        session.getTransaction();
        log.debug("Getting Session successful!");
        return session;
    }

    public UserHome() {
        this.session =  this.getSession();
    }
    
    
	public void persist(User transientInstance) {
		log.debug("persisting User instance");
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

	public void attachDirty(User instance) {
		log.debug("attaching dirty User instance");
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

	/*public void attachClean(User instance) {
		log.debug("attaching clean User instance");
		try {
			session.getSessionFactory().getCurrentSession().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		}
		catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}*/

	public void delete(User persistentInstance) {
		log.debug("deleting User instance");
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

	public User merge(User detachedInstance) {
		log.debug("merging User instance");
		try {
                        session.beginTransaction();
			User result = (User)session.merge(detachedInstance);
                        session.getTransaction().commit();                   
			//User result = (User) session.getSessionFactory().getCurrentSession().merge(detachedInstance);
			log.debug("merge successful");
			return result;
		}
		catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public User findById(java.lang.Integer id) {
		log.debug("getting User instance with id: " + id);
		try {
                        session.beginTransaction();
			User instance = (User)session.get(User.class,id);
                        //session.getTransaction().commit();  
			//User instance = (User) session.getSessionFactory().getCurrentSession().get("User", id);
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

	public List findByExample(User instance) {
		log.debug("finding User instance by example");
		try {
                    
			List results = session.createCriteria(User.class).add(Example.create(instance))
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
