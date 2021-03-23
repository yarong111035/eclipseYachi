package _00_util.init;

import java.sql.SQLException;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;


import _00_util.util.HibernateUtils;
import _02_model.entity.OrderNumberBean;

public class initOrderRandomNumber {
	public static void main(String[] args) {
		SessionFactory factory = HibernateUtils.getSessionFactory();
		Session session = factory.getCurrentSession();
		Transaction tx = session.beginTransaction();
		
		String orderString ;
		for (int i = 1; i < 10001; i += 11) {
			orderString = "YA" + String.format("%05d", i) + "CHI";
			
			session.persist(new OrderNumberBean(null,orderString));
//			System.out.println("=============");
			
		
		}
        
		
		
		tx.commit();
		session.close();
		System.out.println("程式結束.......");
		factory.close();
	}
}
