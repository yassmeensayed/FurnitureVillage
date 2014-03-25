package com.dal.dao;

// default package
// Generated Mar 20, 2014 6:42:12 PM by Hibernate Tools 3.4.0.CR1

import com.dal.pojo.AdminUser;
import com.dal.pojo.User;
import java.util.List;
import javax.naming.InitialContext;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.Criteria;
import org.hibernate.LockMode;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import org.hibernate.criterion.Example;
import org.hibernate.criterion.Restrictions;

/**
 * Home object for domain model class AdminUser.
 * @see .AdminUser
 * @author Hibernate Tools
 */
public class AdminUserHome {

	private static final Log log = LogFactory.getLog(AdminUserHome.class);
    static SessionFactory sf = new Configuration().configure().buildSessionFactory();
        private  Session session = getSession();

    public Session getSession() {
        
        session = sf.openSession();
       // session.beginTransaction();
        log.debug("Getting Session successful!");
        return session;
    }

    public AdminUserHome() {
        //this.session =  this.getSession();
    }
    
    
	public void persist(AdminUser transientInstance) {
		log.debug("persisting AdminUser instance");
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

	public void attachDirty(AdminUser instance) {
		log.debug("attaching dirty AdminUser instance");
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

	/*public void attachClean(AdminUser instance) {
		log.debug("attaching clean AdminUser instance");
		try {
			session.getSessionFactory().getCurrentSession().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		}
		catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}*/

	public void delete(AdminUser persistentInstance) {
		log.debug("deleting AdminUser instance");
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

	public AdminUser merge(AdminUser detachedInstance) {
		log.debug("merging AdminUser instance");
		try {
                        session.beginTransaction();
			AdminUser result = (AdminUser)session.merge(detachedInstance);
                        session.getTransaction().commit();                   
			//AdminUser result = (AdminUser) session.getSessionFactory().getCurrentSession().merge(detachedInstance);
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
                        session.beginTransaction();
			AdminUser instance = (AdminUser)session.get(AdminUser.class,id);
                        //session.getTransaction().commit();  
			//AdminUser instance = (AdminUser) session.getSessionFactory().getCurrentSession().get("AdminUser", id);
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
                    
			List results = session.createCriteria(AdminUser.class).add(Example.create(instance))
					.list();
			log.debug("find by example successful, result size: " + results.size());
			return results;
		}
		catch (RuntimeException re) {
			log.error("find by example failed", re);
			throw re;
		}
	}
         public boolean isAdminUser(User user) {
		log.debug("finding AdminUser instance ");
		try {
                    
			Criteria reUser = session.createCriteria(AdminUser.class).add(Restrictions.eq("user", user));
			List u = reUser.list(); 
                        if(u.size() >= 1){
                            
                            log.debug("find by User successful");
                            return true;
                        }
			return false;
		}
		catch (RuntimeException re) {
			log.error("find by example failed", re);
			throw re;
		}
	}
}
