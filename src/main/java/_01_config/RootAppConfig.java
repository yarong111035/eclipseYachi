package _01_config;

import java.beans.PropertyVetoException;
import java.util.Properties;

import javax.sql.DataSource;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.orm.hibernate5.HibernateTransactionManager;
import org.springframework.orm.hibernate5.LocalSessionFactoryBean;
import org.springframework.transaction.annotation.EnableTransactionManagement;

import com.mchange.v2.c3p0.ComboPooledDataSource;

@Configuration
@EnableTransactionManagement
public class RootAppConfig {
	
	//Step1: 定義DataSource
	@Bean
	public DataSource dataSource() {
		ComboPooledDataSource ds = new ComboPooledDataSource();
		ds.setUser("root");
		ds.setPassword("ABCDE123");
		try {
			ds.setDriverClass("com.mysql.cj.jdbc.Driver");
		} catch (PropertyVetoException e) {
			e.printStackTrace();
		}
		ds.setJdbcUrl("jdbc:mysql://127.0.0.1:3306/yachidb00?serverTimezone=Asia/Taipei&useSSL=false&useUnicode=true&characterEncoding=utf-8");
		ds.setInitialPoolSize(4); //初始化
		ds.setMaxPoolSize(8); //設定最大連結數
		return ds;
	}
	
	//Step2: 建立sessionFactory
	@Bean
	public LocalSessionFactoryBean sessionFactoryBean() {
		System.out.println("sessionFactory... in RootAppConfig");
		LocalSessionFactoryBean factory = new LocalSessionFactoryBean();
		factory.setDataSource(dataSource()); 
		//掃描永續類別(有加@Entity註釋的類別)
		factory.setPackagesToScan(new String[] {"_02_model.entity" , "_10_member\\entity"});
		factory.setHibernateProperties(additionalProperties());  //自訂方法
		return factory;
	}
	
	
	//Step3: 啟動交易
	//由LocalSessionFactoryBean 產生 sessionFactory
	@Bean
	@Autowired
	public HibernateTransactionManager transactionManager(SessionFactory sessionFactory) {
		System.out.println("transactionManager.. in RootAppConfig");
        HibernateTransactionManager txManager = new HibernateTransactionManager();
        txManager.setSessionFactory(sessionFactory);
        return txManager;
     }	
	
	//Step4: 定義Hibernate 的組態資訊(須不須要顯示sql指令等等)
	private Properties additionalProperties() {
		Properties properties = new Properties();
		properties.put("hibernate.dialect", org.hibernate.dialect.MySQL8Dialect.class);
		properties.put("hibernate.show_sql", Boolean.TRUE);
		properties.put("hibernate.format_sql", Boolean.TRUE);
		properties.put("default_batch_fetch_size", 10);
		properties.put("hibernate.hbm2ddl.auto", "update");
		return properties;
	}
}
