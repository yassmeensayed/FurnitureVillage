package com.dal.dao;

// default package
// Generated Mar 20, 2014 6:42:12 PM by Hibernate Tools 3.4.0.CR1

import com.dal.pojo.UserCredentialsId;
import com.dal.pojo.UserCredentials;
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
 * Home object for domain model class UserCredentials.
 * @see .UserCredentials
 * @author Hibernate Tools
 */
public class UserCredentialsHome {

	private static final Log log = LogFactory.getLog(UserCredentialsHome.class);
    private Session session;
       
    public Session getSession() {
        SessionFactory sf = new Configuration().configure().buildSessionFactory();
        session = sf.openSession();
        session.getTransaction();
        log.debug("Getting Session successful!");
        return session;
    }

    public UserCredentialsHome() {
        this.session =  this.getSession();
    }
    
    
	public void persist(UserCredentials transientInstance) {
		log.debug("persisting UserCredentialsCredentials instance");
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

	public void attachDirty(UserCredentials instance) {
		log.debug("attaching dirty UserCredentialsCredentials instance");
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

	/*public void attachClean(UserCredentials instance) {
		log.debug("attaching clean UserCredentials instance");
		try {
			session.getSessionFactory().getCurrentSession().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		}
		catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}*/

	public void delete(UserCredentials persistentInstance) {
		log.debug("deleting UserCredentials instance");
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

	public UserCredentials merge(UserCredentials detachedInstance) {
		log.debug("merging UserCredentials instance");
		try {
                        session.beginTransaction();
			UserCredentials result = (UserCredentials)session.merge(detachedInstance);
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

	public UserCredentials findById(java.lang.Integer id) {
		log.debug("getting UserCredentials instance with id: " + id);
		try {
                        session.beginTransaction();
			UserCredentials instance = (UserCredentials)session.get(UserCredentials.class,id);
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

	public List findByExample(UserCredentials instance) {
		log.debug("finding UserCredentials instance by example");
		try {
                    
			List results = session.createCriteria(UserCredentials.class).add(Example.create(instance))
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
