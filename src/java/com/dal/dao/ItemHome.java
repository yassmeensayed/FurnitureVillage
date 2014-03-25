package com.dal.dao;

// default package
// Generated Mar 20, 2014 6:42:12 PM by Hibernate Tools 3.4.0.CR1

import com.dal.pojo.Categories;
import com.dal.pojo.Item;
import com.dal.pojo.OrderHistory;
import com.dal.pojo.User;
import java.util.List;
import java.util.Locale;
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
 * Home object for domain model class Item.
 * @see .Item
 * @author Hibernate Tools
 */
public class ItemHome {

	private static final Log log = LogFactory.getLog(ItemHome.class);
    static SessionFactory sf = new Configuration().configure().buildSessionFactory();
        private  Session session = getSession();

    public Session getSession() {
        
        session = sf.openSession();
       // session.beginTransaction();
        log.debug("Getting Session successful!");
        return session;
    }
    public ItemHome() {
        //this.session =  this.getSession();
    }
    
    
	public void persist(Item transientInstance) {
		log.debug("persisting Item instance");
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

	public void attachDirty(Item instance) {
		log.debug("attaching dirty Item instance");
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

	/*public void attachClean(Item instance) {
		log.debug("attaching clean Item instance");
		try {
			session.getSessionFactory().getCurrentSession().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		}
		catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}*/

	public void delete(Item persistentInstance) {
		log.debug("deleting Item instance");
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

	public Item merge(Item detachedInstance) {
		log.debug("merging Item instance");
		try {
                        session.beginTransaction();
			Item result = (Item)session.merge(detachedInstance);
                        session.getTransaction().commit();                   
			//Item result = (Item) session.getSessionFactory().getCurrentSession().merge(detachedInstance);
			log.debug("merge successful");
			return result;
		}
		catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public Item findById(java.lang.Integer id) {
		log.debug("getting Item instance with id: " + id);
		try {
                        session.beginTransaction();
			Item instance = (Item)session.get(Item.class,id);
                        //session.getTransaction().commit();  
			//Item instance = (Item) session.getSessionFactory().getCurrentSession().get("Item", id);
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

	public List findByExample(Item instance) {
		log.debug("finding Item instance by example");
		try {
                    
			List results = session.createCriteria(Item.class).add(Example.create(instance))
					.list();
			log.debug("find by example successful, result size: " + results.size());
			return results;
		}
		catch (RuntimeException re) {
			log.error("find by example failed", re);
			throw re;
		}
	}
        public List findByCategory(Categories cat) {
		log.debug("finding User instance by example");
		try {
                    
			 Criteria reItem = session.createCriteria(Item.class).add(Restrictions.eq("categories",cat ));
			List i = reItem.list();	
			log.debug("find by example successful");
			return i;
		}
		catch (RuntimeException re) {
			log.error("find by example failed", re);
			throw re;
		}
	}
        public List findByPriceCategory(Categories cat, Double startPrice, Double endPrice) {
		log.debug("finding Items instance by example");
		try {
                    
			 Criteria reItem = session.createCriteria(Item.class).add(Restrictions.eq("categories",cat )
                                 ).add(Restrictions.between("price", startPrice, endPrice));
			List i = reItem.list();	
			log.debug("find by example successful");
			return i;
		}
		catch (RuntimeException re) {
			log.error("find by example failed", re);
			throw re;
		}
	}
}
