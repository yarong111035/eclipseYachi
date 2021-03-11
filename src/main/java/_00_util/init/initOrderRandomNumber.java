package _00_util.init;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import _00_util.util.HibernateUtils;
import _00_util.util.SnowflakeMini;
import _02_model.entity.OrderNumberBean;

public class initOrderRandomNumber {
	public static void main(String[] args) {
		SessionFactory factory = HibernateUtils.getSessionFactory();
		Session session = factory.getCurrentSession();
		Transaction tx = session.beginTransaction();
		
		for (int i = 0; i < 300; i++) {
            long id = SnowflakeMini.nextId();
            session.persist(new OrderNumberBean(null,id));
            System.out.println("=============");
            System.out.println("d:"+id);
        }
		
		
		tx.commit();
		session.close();
		System.out.println("程式結束.......");
		factory.close();
	}
}
