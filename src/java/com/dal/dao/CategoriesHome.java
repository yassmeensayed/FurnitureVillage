package com.dal.dao;

// default package
// Generated Mar 20, 2014 6:42:12 PM by Hibernate Tools 3.4.0.CR1

import com.dal.pojo.Categories;

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
 * Home object for domain model class Categories.
 * @see .Categories
 * @author Hibernate Tools
 */
public class CategoriesHome {

	private static final Log log = LogFactory.getLog(CategoriesHome.class);

	private Session session;
       
    public Session getSession() {
        SessionFactory sf = new Configuration().configure().buildSessionFactory();
        session = sf.openSession();
        session.getTransaction();
        log.debug("Getting Session successful!");
        return session;
    }

    public CategoriesHome() {
        this.session =  this.getSession();
    }
    
    
	public void persist(Categories transientInstance) {
		log.debug("persisting Categories instance");
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

	public void attachDirty(Categories instance) {
		log.debug("attaching dirty Categories instance");
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

	/*public void attachClean(Categories instance) {
		log.debug("attaching clean Categories instance");
		try {
			session.getSessionFactory().getCurrentSession().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		}
		catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}*/

	public void delete(Categories persistentInstance) {
		log.debug("deleting Categories instance");
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

	public Categories merge(Categories detachedInstance) {
		log.debug("merging Categories instance");
		try {
                        session.beginTransaction();
			Categories result = (Categories)session.merge(detachedInstance);
                        session.getTransaction().commit();                   
			//Categories result = (Categories) session.getSessionFactory().getCurrentSession().merge(detachedInstance);
			log.debug("merge successful");
			return result;
		}
		catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public Categories findById(java.lang.Integer id) {
		log.debug("getting Categories instance with id: " + id);
		try {
                        session.beginTransaction();
			Categories instance = (Categories)session.get(Categories.class,id);
                        //session.getTransaction().commit();  
			//Categories instance = (Categories) session.getSessionFactory().getCurrentSession().get("Categories", id);
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

	public List findByExample(Categories instance) {
		log.debug("finding Categories instance by example");
		try {
                    
			List results = session.createCriteria(Categories.class).add(Example.create(instance))
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
