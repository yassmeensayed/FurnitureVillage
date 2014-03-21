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

	private Session session;

    public Session getSession() {
        SessionFactory sf = new Configuration().configure().buildSessionFactory();
        session = sf.openSession();
        return session;
    }


        
        
}
