package com.dal.dao;

// default package
// Generated Mar 20, 2014 6:42:12 PM by Hibernate Tools 3.4.0.CR1

import com.dal.pojo.AdminUser;
import java.util.List;
import javax.naming.InitialContext;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.LockMode;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Example;

/**
 * Home object for domain model class AdminUser.
 * @see .AdminUser
 * @author Hibernate Tools
 */
public class AdminUserHome {

	private static final Log log = LogFactory.getLog(AdminUserHome.class);

	private final SessionFactory sessionFactory = getSessionFactory();

	protected SessionFactory getSessionFactory() {
		try {
			return (SessionFactory) new InitialContext().lookup("SessionFactory");
		}
		catch (Exception e) {
			log.error("Could not locate SessionFactory in JNDI", e);
			throw new IllegalStateException("Could not locate SessionFactory in JNDI");
		}
	}

	public void persist(AdminUser transientInstance) {
		log.debug("persisting AdminUser instance");
		try {
			sessionFactory.getCurrentSession().persist(transientInstance);
			log.debug("persist successful");
		}
		catch (RuntimeException re) {
			log.error("persist failed", re);
			throw re;
		}
	}

	public void attachDirty(AdminUser instance) {
		log.debug("attaching dirty AdminUser instance");
		try {
			sessionFactory.getCurrentSession().saveOrUpdate(instance);
			log.debug("attach successful");
		}
		catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(AdminUser instance) {
		log.debug("attaching clean AdminUser instance");
		try {
			sessionFactory.getCurrentSession().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		}
		catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void delete(AdminUser persistentInstance) {
		log.debug("deleting AdminUser instance");
		try {
			sessionFactory.getCurrentSession().delete(persistentInstance);
			log.debug("delete successful");
		}
		catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public AdminUser merge(AdminUser detachedInstance) {
		log.debug("merging AdminUser instance");
		try {
			AdminUser result = (AdminUser) sessionFactory.getCurrentSession().merge(detachedInstance);
			log.debug("merge successful");
			return result;
		}
		catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public AdminUser findById(java.lang.Integer id) {
		log.debug("getting AdminUser instance with id: " + id);
		try {
			AdminUser instance = (AdminUser) sessionFactory.getCurrentSession().get("AdminUser", id);
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

	public List findByExample(AdminUser instance) {
		log.debug("finding AdminUser instance by example");
		try {
			List results = sessionFactory.getCurrentSession().createCriteria("AdminUser").add(Example.create(instance))
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
