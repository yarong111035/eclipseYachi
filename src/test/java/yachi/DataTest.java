package yachi;

import java.util.Calendar;
import java.util.Date;
import java.util.HashSet;
import java.util.Iterator;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Set;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;

import _00_util.util.HibernateUtils;
import _02_model.entity.CouponBean;
import _02_model.entity.FavoriteCouponListBean;
import _02_model.entity.FavoriteShopListBean;
import _02_model.entity.NightMarketBean;
import _02_model.entity.OrderNumberBean;
import _02_model.entity.OrderStatusBean;
import _02_model.entity.PayTypeBean;
import _02_model.entity.ProductBean;
import _02_model.entity.ProductTypeBean;
import _02_model.entity.ShipTypeBean;
import _02_model.entity.ShopBean;
import _02_model.entity.ShopMenuBean;
import _02_model.entity.ShopTypeBean;
import _10_member.entity.Member;
import _10_member.entity.Role;

public class DataTest {
	
	SessionFactory factory;
	Session session;
	Transaction tx;

	@Before
	public void init() {
		factory = HibernateUtils.getSessionFactory();
		session = factory.openSession();
		tx = session.beginTransaction();
	}
	@After
	public void destroy() {
		try {
			System.out.println("3.-----------------commit()開始");
			tx.commit();
			System.out.println("4.-----------------commit()結束");
			session.close();
			factory.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	//--------------會員增加管理員角色
	@Test
	public void addAdminRole() {

		Member mb = session.get(Member.class, 1);
		Set<Role> set = mb.getRoles();	
		Role roleA = new Role();
		roleA.setRole_name("管理員");
		roleA.setRole_code("ADMIN");
		
//		roleA.setRole_name("會員");
//		roleA.setRole_code("USER");
		
		set.add(roleA);			
		mb.setRoles(set);	
		session.update(mb);
		
	}
	
	//--------------新增夜市----------------
	@Test
	public void addnight() {
		NightMarketBean nightMarketBean1 = new NightMarketBean("饒河夜市",4.2);		
		NightMarketBean nightMarketBean2 = new NightMarketBean("華西街觀光夜市",4.0);
		NightMarketBean nightMarketBean3 = new NightMarketBean("寧夏夜市",3.9);
		NightMarketBean nightMarketBean4 = new NightMarketBean("士林夜市",2.5);
		NightMarketBean nightMarketBean5 = new NightMarketBean("臨江街觀光夜市",4.0);
		NightMarketBean nightMarketBean6 = new NightMarketBean("延三夜市",4.6);
		NightMarketBean nightMarketBean7 = new NightMarketBean("公館夜市",4.3);
		NightMarketBean nightMarketBean8 = new NightMarketBean("南機場夜市",4.1);
		session.persist(nightMarketBean1);
		session.persist(nightMarketBean2);
		session.persist(nightMarketBean3);
		session.persist(nightMarketBean4);
		session.persist(nightMarketBean5);
		session.persist(nightMarketBean6);
		session.persist(nightMarketBean7);
		session.persist(nightMarketBean8);	
	}
	
	//--------------新增商家類型
	@Test
	public void addShopTypeBean() {
		ShopTypeBean shopTypeBean1 = new ShopTypeBean("中式料理");
		ShopTypeBean shopTypeBean2 = new ShopTypeBean("西式料理");
		ShopTypeBean shopTypeBean3 = new ShopTypeBean("日式料理");
		ShopTypeBean shopTypeBean4 = new ShopTypeBean("飲料");
		ShopTypeBean shopTypeBean5 = new ShopTypeBean("衣服");
		ShopTypeBean shopTypeBean6 = new ShopTypeBean("飾品");
		ShopTypeBean shopTypeBean7 = new ShopTypeBean("手機周邊");
		ShopTypeBean shopTypeBean8 = new ShopTypeBean("日常生活用品");
		ShopTypeBean shopTypeBean9 = new ShopTypeBean("遊戲");
		session.persist(shopTypeBean1);
		session.persist(shopTypeBean2);
		session.persist(shopTypeBean3);
		session.persist(shopTypeBean4);
		session.persist(shopTypeBean5);
		session.persist(shopTypeBean6);
		session.persist(shopTypeBean7);
		session.persist(shopTypeBean8);
		session.persist(shopTypeBean9);
		
	}
	
	//-------------------------測試會員註冊成為商家以及從商家新增商品菜單
	@Test
	public void addShopAndMenu() {
		Member mb1 = session.get(Member.class, 1);
		ShopTypeBean st = session.get(ShopTypeBean.class, 2);        // 商家的類型 "西式料理"
		NightMarketBean nm = session.get(NightMarketBean.class, 1);  // 商家所在的夜市 "饒河夜市"
		
		ShopBean sp = new ShopBean(null, "你家牛排", null, "好ㄘ的牛排", "taipei", "0912321321", 
				"11:00~22:00 everyday", "www.yoursteak.com", null, null, st, nm, null);
		
		//會員註冊商家(會員資料庫有註冊商家的外鍵)
		mb1.setShopBean(sp);  
		session.persist(sp);
		ShopBean sp1 = session.get(ShopBean.class, mb1.getShopBean().getShop_id());
		ShopMenuBean sm = new ShopMenuBean(null, sp1, null, "鐵板麵", "好吃的鐵板麵", 80.0);
		ShopMenuBean sm1 = new ShopMenuBean(null, sp1, null, "厚切沙朗牛排", "好吃的沙朗牛排", 150.0);
		ShopMenuBean sm2 = new ShopMenuBean(null, sp1, null, "厚切菲力牛排", "好吃的菲力牛排", 180.0);
		ShopMenuBean sm3 = new ShopMenuBean(null, sp1, null, "厚切魷魚排", "好吃的魷魚", 150.0);
		session.persist(sm);
		session.persist(sm1);
		session.persist(sm2);
		session.persist(sm3);
		
	}
	@Test
	public void addShopAndMenu2() {
		Member mb1 = session.get(Member.class, 2);
		ShopTypeBean st = session.get(ShopTypeBean.class, 1);        // 商家的類型 "中式料理"
		NightMarketBean nm = session.get(NightMarketBean.class, 3);  // 商家所在的夜市 "寧夏夜市"
		
		ShopBean sp = new ShopBean(null, "藥燉排骨", null, "好吃的排骨", "taipei", "0987878788", 
				"11:00~22:00 everyday", "www.test.com", null, null, st, nm, null);
		
		//會員註冊商家(會員資料庫有註冊商家的外鍵)
		mb1.setShopBean(sp);  
		session.persist(sp);
		ShopBean sp1 = session.get(ShopBean.class, mb1.getShopBean().getShop_id());
		ShopMenuBean sm = new ShopMenuBean(null, sp1, null, "小碗的藥燉排骨", "好吃的排骨", 80.0);
		ShopMenuBean sm1 = new ShopMenuBean(null, sp1, null, "大碗的藥燉排骨", "選用台灣豬", 150.0);
		ShopMenuBean sm2 = new ShopMenuBean(null, sp1, null, "麵線", "好吃的麵線", 20.0);
		ShopMenuBean sm3 = new ShopMenuBean(null, sp1, null, "荷包蛋", "好吃的荷包蛋", 10.0);
		session.persist(sm);
		session.persist(sm1);
		session.persist(sm2);
		session.persist(sm3);
		
	}
	
	//-------------------------測試從商家撈出多個菜單
	@Test
	public void getShopMenu() {
		ShopBean sp = session.get(ShopBean.class, 1);
		Set<ShopMenuBean> menulist = sp.getShopMenus();
		
		for(ShopMenuBean sp1 : menulist) {
			
			System.out.println(sp1.getMenu_name());

		}
	}
	
	//-------------------------測試商家新增優惠券
	@Test
	public void shopAddCouponBean() {
		ShopBean shopBean = session.get(ShopBean.class, 1);
		CouponBean cp = new CouponBean(null, 10, "你家牛排鐵板麵折價券", "限定單人使用", java.sql.Date.valueOf("2020-11-11"), java.sql.Date.valueOf("2020-11-11"), "1111鐵板麵折價卷", null, shopBean);
		CouponBean cp1 = new CouponBean(null, 20, "你家牛排厚切鐵板麵折價券", "限定雙人使用", java.sql.Date.valueOf("2020-11-11"), java.sql.Date.valueOf("2020-12-12"), "2222厚切鐵板麵折價卷", null, shopBean);
		CouponBean cp2 = new CouponBean(null, 25, "你家牛排厚切菲力牛排折價券", "限定老闆使用", java.sql.Date.valueOf("2020-11-11"), java.sql.Date.valueOf("2021-12-31"), "33333阿就是折價卷", null, shopBean);

		cp.setShopBean(shopBean);
		
		// 優惠券添加商家的類型  中式料理or西式料理...等等
		cp.setShopTypeBean(shopBean.getShopTypeBean());
		cp1.setShopTypeBean(shopBean.getShopTypeBean());
		cp2.setShopTypeBean(shopBean.getShopTypeBean());

		Set<CouponBean> coupons = new LinkedHashSet<>();
		coupons.add(cp);
		coupons.add(cp1);
		coupons.add(cp2);
		
		shopBean.setCoupons(coupons);
		session.update(shopBean);
	}
	
	
	//-------------------------測試從商家撈出多個優惠券
	@Test
	public void getCouponBeanOfShop() {
		ShopBean sp = session.get(ShopBean.class, 1);
		Set<CouponBean> coupons = sp.getCoupons();
		
		for(CouponBean sp1 : coupons) {
			
			System.out.println(sp.getShop_name()+" 商家發行的優惠券--> "+sp1.getCoupon_name());

		}
	}
	
	//---------------------測試會員收藏優惠券 以及再次收藏優惠券
	@Test
	public void keepCoupons() {
		Member mb = session.get(Member.class, 1);
		CouponBean cp = session.get(CouponBean.class, 1);
		CouponBean cp2 = session.get(CouponBean.class, 2);
		CouponBean cp3 = session.get(CouponBean.class, 3);

		
		String hql = "FROM FavoriteCouponListBean WHERE memberBean.memberId = :mid";
		FavoriteCouponListBean favoriteCouponListBean = new FavoriteCouponListBean();
		
		try {
			favoriteCouponListBean = (FavoriteCouponListBean) session.createQuery(hql)
												.setParameter("mid", mb.getMemberId())
												.getSingleResult();
		} catch (Exception e) {

		}
								
		if ( favoriteCouponListBean.getCoupon_list_id() == null) {
			
			// 新創建一個Set 將一個一個優惠券集合成Set
			Set<CouponBean> coupons = new LinkedHashSet<CouponBean>();
			coupons.add(cp);
			coupons.add(cp2);
			coupons.add(cp3);
			
			// 該會員第一次收藏優惠券才需要創建 FavoriteCouponListBean
			FavoriteCouponListBean fc2 = new FavoriteCouponListBean();
			fc2.setMemberBean(mb);
			fc2.setCoupons(coupons);
			
			session.persist(fc2);
		}else {
			
			// 該會員想要再次收藏其他的優惠券 	
			Set<CouponBean> coupons = new HashSet<CouponBean>();
			coupons = favoriteCouponListBean.getCoupons();
			coupons.add(cp);
			coupons.add(cp2);
			coupons.add(cp3);
			
			favoriteCouponListBean.setCoupons(coupons);
			
			session.update(favoriteCouponListBean);
						
		}
	
	}
	
	// 多對多表格
	//-------------------------測試會員撈出喜愛的優惠券	
	@SuppressWarnings("unchecked")
	@Test
	public void getMemberCoupons() {
		Member mb = session.get(Member.class, 1);
		String hql = "FROM FavoriteCouponListBean WHERE memberBean.memberId = :mid";
		
		List<FavoriteCouponListBean> resultList2 = session.createQuery(hql)
														 .setParameter("mid", mb.getMemberId())
														 .getResultList();
		 
		Set<CouponBean> coupons = new HashSet<CouponBean>();
		 
		for (FavoriteCouponListBean coupon : resultList2) {
			coupons = coupon.getCoupons();
			 
		}
					
		for (CouponBean couponBean : coupons) {
			System.out.println(mb.getFullname()+" 會員收藏的折價券--> "+couponBean.getCoupon_name());
		}
	}
	
	// 多對多表格
	//---------------------測試會員移除喜愛優惠券
	@Test
	public void deleteCoupon() {
		Member mb = session.get(Member.class, 1);
		CouponBean cp = session.get(CouponBean.class, 1);

		String hql = "FROM FavoriteCouponListBean WHERE memberBean.memberId = :mid";
		
		FavoriteCouponListBean favoriteCouponListBean = new FavoriteCouponListBean();
		
		try {
			favoriteCouponListBean = (FavoriteCouponListBean) session.createQuery(hql)
												.setParameter("mid", mb.getMemberId())
												.getSingleResult();
		} catch (Exception e) {

		}	
		Set<CouponBean> coupons = new HashSet<CouponBean>();
		coupons = favoriteCouponListBean.getCoupons();
		coupons.remove(cp);
		
		favoriteCouponListBean.setCoupons(coupons);
		
		session.update(favoriteCouponListBean);
			
	}
	
	//-------------------------測試會員收藏商家
	@Test
	public void MemberKeepShop() {
		
		Member mb = session.get(Member.class, 1);
		Set<ShopBean> shops = new LinkedHashSet<>();
		ShopBean shopBean = session.get(ShopBean.class, 1);
		
		shops.add(shopBean);
		
		FavoriteShopListBean fsl = new FavoriteShopListBean(null, mb, shops, java.sql.Timestamp.valueOf("2020-12-31 23:59:59.000"));
		
		session.persist(fsl);
	
	}
	//-------------------------測試新增商品類型
	@Test
	public void addProductTypeBean() {
	
		
		ProductTypeBean ptb1 = new ProductTypeBean("環保杯套");
		ProductTypeBean ptb2 = new ProductTypeBean("環保餐具");
		ProductTypeBean ptb3 = new ProductTypeBean("環保購物袋");
		ProductTypeBean ptb4 = new ProductTypeBean("陶瓷碗盤");
		ProductTypeBean ptb5 = new ProductTypeBean("攤販用具");
		ProductTypeBean ptb6 = new ProductTypeBean("免洗餐具");
		ProductTypeBean ptb7 = new ProductTypeBean("紙袋");
		ProductTypeBean ptb8 = new ProductTypeBean("餐車");
		
		ProductTypeBean ptb9 = new ProductTypeBean("零食");
		ProductTypeBean ptb10 = new ProductTypeBean("玩具");
		ProductTypeBean ptb11 = new ProductTypeBean("文具");
		ProductTypeBean ptb12 = new ProductTypeBean("折價券");
		ProductTypeBean ptb13 = new ProductTypeBean("衣服");
		ProductTypeBean ptb14 = new ProductTypeBean("文創商品");
		ProductTypeBean ptb15 = new ProductTypeBean("雜貨");
		ProductTypeBean ptb16 = new ProductTypeBean("飲料");
		ProductTypeBean ptb17 = new ProductTypeBean("食品");
		
		session.persist(ptb1); session.persist(ptb2); session.persist(ptb3);
		session.persist(ptb4); session.persist(ptb5); session.persist(ptb6);
		session.persist(ptb7); session.persist(ptb8); 
		
		session.persist(ptb9);  session.persist(ptb10); session.persist(ptb11);
		session.persist(ptb12); session.persist(ptb13); session.persist(ptb14);
		session.persist(ptb15); session.persist(ptb16); session.persist(ptb17); 

		
	}
	
	//-------------------------測試新增商城商品
	@Test 
	public void addProduct() {
		
		// 原生的sql語句
//		INSERT  INTO `product`(`product_id`,`filename`,`filenameA`,`product_info`,`product_memo`,`product_name`,`product_pic`,`product_picA`,`product_price`,`product_release`,`product_spec`,`product_status`,`product_stock`,`FK_product_type_id`) VALUES 
//		(1,'日本陶瓷拉麵碗1.png','日本陶瓷拉麵碗2.png',NULL,NULL,'陶瓷握柄鍋碗',NULL,NULL,99,'2021-02-01','',0,8,4),
//		(2,'日本陶瓷拉麵碗1.png','日本陶瓷拉麵碗2.png',NULL,NULL,'陶瓷握柄鍋碗',NULL,NULL,99,'2021-02-02','',0,8,4),
//		(3,'三格裝小麥餐盒1.png','三格裝小麥餐盒2.png',NULL,NULL,'三格裝小麥餐盒',NULL,NULL,79,'2021-02-03','粉色',0,5,2),
//		(4,'秸稈餐盒套組1.png','秸稈餐盒套組2.png',NULL,NULL,'秸稈餐盒套組',NULL,NULL,79,'2021-02-04','蘋果綠',0,3,2),
//		(5,'日本原裝水果叉1.png','日本原裝水果叉2.png',NULL,NULL,'日本原裝水果叉',NULL,NULL,89,'2021-02-05','萬聖款',0,20,2),
//		(6,'安全矽膠折疊盒1.png','安全矽膠折疊盒2.png',NULL,NULL,'安全矽膠折疊盒',NULL,NULL,199,'2021-02-06','湖水綠款',0,3,2),
//		(7,'日本原裝便當小物1.png','日本原裝便當小物2.png',NULL,NULL,'日本原裝便當小物',NULL,NULL,70,'2021-02-07','便當款',0,24,2),
//		(8,'304超值感餐具組1.png','304超值感餐具組2.png',NULL,NULL,'304超值感餐具組',NULL,NULL,99,'2021-02-08','霧色款',0,1,2),
//		(9,'珍珠奶茶帆布袋1.png','珍珠奶茶帆布袋2.png',NULL,NULL,'珍珠奶茶帆布袋',NULL,NULL,149,'2021-02-09','珍珠奶茶款',0,7,3),
//		(10,'高質感免洗盤1.png','高質感免洗盤2.png',NULL,NULL,'高質感免洗盤',NULL,NULL,250,'2021-02-10','50入',0,9,6),
//		(11,'造型飲料提環1.png','造型飲料提環2.png',NULL,NULL,'造型飲料提環',NULL,NULL,119,'2021-02-11','卡通款',0,5,1),
//		(12,'大理石環保杯袋1.png','大理石環保杯袋2.png',NULL,NULL,'大理石環保杯袋',NULL,NULL,49,'2021-02-12','大理石款',0,6,1),
//		(13,'飯糰攤車1.png','飯糰攤車2.png',NULL,NULL,'飯糰攤車',NULL,NULL,10000,'2021-02-12','飯糰餐車',0,0,8),
//		(14,'雞蛋糕餐車1.png','雞蛋糕餐車2.png',NULL,NULL,'雞蛋糕餐車',NULL,NULL,15000,'2021-02-13','蛋糕攤車',0,1,8),
//		(15,'植纖外帶餐盒1.png','植纖外帶餐盒2.png',NULL,NULL,'植纖外帶餐盒',NULL,NULL,800,'2021-02-14','250入/組',2,14,6),
//		(16,'防油笑臉紙袋1.png','防油笑臉紙袋2.png',NULL,NULL,'防油笑臉紙袋',NULL,NULL,200,'2021-02-15','100入/組',0,33,7),
//		(17,'小熊紙袋1.png','小熊紙袋2.png',NULL,NULL,'小熊紙袋',NULL,NULL,250,'2021-02-16','100入/組',0,29,7),
//		(18,'陶瓷握柄鍋碗1.png','陶瓷握柄鍋碗2.png',NULL,NULL,'陶瓷握柄鍋碗',NULL,NULL,129,'2021-02-17','墨綠款',0,10,4),
//		(19,'史奴比環保杯套1.png','史奴比環保杯套2.png',NULL,NULL,'史奴比環保杯套',NULL,NULL,59,'2021-02-18','史奴比款',0,1,1),
//		(20,'磁性立式黑板1.png','磁性立式黑板2.png',NULL,NULL,'磁性立式黑板',NULL,NULL,300,'2021-02-19','粉色款',0,2,5),
//		(21,'大型擺攤傘1.png','大型擺攤傘2.png',NULL,NULL,'大型擺攤傘',NULL,NULL,2800,'2021-02-20','綠款2.7米',0,0,5);
		
		ProductTypeBean pt9 = session.get(ProductTypeBean.class, 9);
		ProductTypeBean pt10 = session.get(ProductTypeBean.class, 10);
		ProductTypeBean pt11 = session.get(ProductTypeBean.class, 11);
		ProductTypeBean pt12 = session.get(ProductTypeBean.class, 12);
		ProductTypeBean pt13 = session.get(ProductTypeBean.class, 13);
		ProductTypeBean pt14 = session.get(ProductTypeBean.class, 14);
		ProductTypeBean pt15 = session.get(ProductTypeBean.class, 15);
		ProductTypeBean pt16 = session.get(ProductTypeBean.class, 16);
		ProductTypeBean pt17 = session.get(ProductTypeBean.class, 17);
			
		//product_name;product_status;product_price;product_stock;product_info;product_release;productTypeBean;
		
		ProductBean pd1 = new ProductBean("XX家的紅豆餅",0,15000.0,25,"新鮮的紅豆製成",java.sql.Date.valueOf("2021-1-1"),pt9);
		ProductBean pd2 = new ProductBean("Switch遊戲機",0,100.0,25,"目前有特價",java.sql.Date.valueOf("2021-1-5"),pt10);
		ProductBean pd3 = new ProductBean("白色的鉛筆",0,200.0,25,"很好寫",java.sql.Date.valueOf("2021-1-10"),pt11);
		ProductBean pd4 = new ProductBean("蔥油餅買一送一",0, 300.0,25,"吃了會肥",java.sql.Date.valueOf("2021-2-1"),pt12);
		ProductBean pd5 = new ProductBean("棉質T",0, 400.0,25, "舒服好穿",java.sql.Date.valueOf("2021-2-10"),pt13);
		ProductBean pd6 = new ProductBean("紅藍白購物袋",0, 500.0,25,"文創商品",java.sql.Date.valueOf("2021-3-16"),pt14);
		ProductBean pd7 = new ProductBean("新手入門學會JAVA15",0, 600.0,25,"好看",java.sql.Date.valueOf("2021-3-17"),pt15);
		ProductBean pd8 = new ProductBean("大吉嶺紅茶包",0, 700.0,25, "好喝",java.sql.Date.valueOf("2021-3-18"),pt16);
		ProductBean pd9 = new ProductBean("不樂事洋芋片",0, 800.0,25,"好吃",java.sql.Date.valueOf("2021-3-19"),pt17);
		ProductBean pd10 = new ProductBean("卡拉姆久洋芋片",0, 900.0,25,"不好吃",java.sql.Date.valueOf("2021-3-20"),pt17);
		ProductBean pd11 = new ProductBean("Switch 魔物獵人特仕主機狩獵組合",0, 1897.0,25,"好玩",java.sql.Date.valueOf("2021-3-26"),pt11);

		session.persist(pd1);
		session.persist(pd2);
		session.persist(pd3);
		session.persist(pd4);
		session.persist(pd5);
		session.persist(pd6);
		session.persist(pd7);
		session.persist(pd8);
		session.persist(pd9);
		session.persist(pd10);
		session.persist(pd11);
		
	}
	
	//---------------新增訂單狀態
	@Test 
	public void addOrder_status() {
		
		OrderStatusBean osb1 = new OrderStatusBean("未付款");
		OrderStatusBean osb2 = new OrderStatusBean("未出貨");
		OrderStatusBean osb3 = new OrderStatusBean("送貨中");
		OrderStatusBean osb4 = new OrderStatusBean("已送達");
		OrderStatusBean osb5 = new OrderStatusBean("已取消");
		OrderStatusBean osb6 = new OrderStatusBean("退貨中");
		
		session.persist(osb1); 
		session.persist(osb2); 
		session.persist(osb3); 
		session.persist(osb4); 
		session.persist(osb5); 
		session.persist(osb6);
				
	}
	
	//----------------新增付款方式
	@Test
	public void addPay_type() {
		PayTypeBean payTypeBean1 = new PayTypeBean("信用卡/金融卡");
		PayTypeBean payTypeBean2 = new PayTypeBean("銀行轉帳");
		PayTypeBean payTypeBean3 = new PayTypeBean("超商貨到付款");
		
		session.persist(payTypeBean1);
		session.persist(payTypeBean2);
		session.persist(payTypeBean3);

	}
	
	//------------------新增訂單亂數編號
	@Test
	public void addOrderRandomNumber() {
		
		String orderString ;
		
		for (int i = 1; i < 1100; i += 11) {		
			orderString = "YA" + String.format("%05d", i) + "CHI";
			session.persist(new OrderNumberBean(null,orderString));
					
		}
	}
	
	//-------------------新增運送方式
	@Test
	public void addShip_type() {
		
		ShipTypeBean shipTypeBean1 = new ShipTypeBean("宅配到府");
		ShipTypeBean shipTypeBean2 = new ShipTypeBean("超商取貨");
		ShipTypeBean shipTypeBean3 = new ShipTypeBean("中華郵政i郵箱");
		
		session.persist(shipTypeBean1);
		session.persist(shipTypeBean2);
		session.persist(shipTypeBean3);
	}
	
	//-------------------------測試將商品放入購物車
	//
//	@Test
//	public void putProductToCart() {
//		Member mb = session.get(Member.class, 1);
//		CartBean ct = new CartBean(null, null, mb, null);
//		ProductBean pd = session.get(ProductBean.class, 1);
//		ProductBean pd1 = session.get(ProductBean.class, 2);
//		CartBean ct1 = session.get(CartBean.class, 1);
//		CartItemBean ci = new CartItemBean(null, ct, pd, null, 5);
//		CartItemBean ci1 = new CartItemBean(null, ct, pd, null, 3);
//		
//		session.persist(ci);
//		session.persist(ci1);
//		
//		CartItemBean ci2 = session.get(CartItemBean.class, 2);
//		CartItemBean ci3 = session.get(CartItemBean.class, 3);
//		CartBean ct2 = session.get(CartBean.class, 1);
//		Set<CartItemBean> items = ct1.getItemBeans();
//		items.add(ci2);
//		items.add(ci3);
//		session.update(ct2);
//	}
	//-------------------------測試將商品加入訂單
//	ProductBean pd = session.get(ProductBean.class, 1);
//	ProductBean pd1 = session.get(ProductBean.class, 2);
//	Member mb = session.get(Member.class, 1);
//	OrderBean ob = new OrderBean(null, mb, "neihu", null, "你家牛排", "03799401", "023323211", java.sql.Timestamp.valueOf("2020-12-31 23:59:59.000"), java.sql.Date.valueOf("2021-01-02"), 1, 1, null);
//	OrderItemBean oib = new OrderItemBean(null, ob, pd, pd.getProduct_price(), 5, null, null);
//	OrderItemBean oib1 = new OrderItemBean(null, ob, pd1, pd1.getProduct_price(), 10, null, null);
//	
//	session.persist(ob);
//	session.persist(oib);
//	session.persist(oib1);
	//--------------------------使用hql將特定種類物品取出
	//--------------------------注意當tostring方法裡有其bean時會出現overstack例外

//	String hql = "FROM ProductBean pb WHERE pb.productTypeBean = 1";
//	List<ProductBean> list = session.createQuery(hql).getResultList();
//	System.out.println(list.toString());
	
	//--------------------------從cart取出商品在加入order
//	OrderBean ob = new OrderBean(null, session.get(Member.class, 1), "neihu", null, "你家牛排", "你家牛排", "2223311", java.sql.Timestamp.valueOf("2020-12-31 23:59:59.000"), java.sql.Date.valueOf("2021-01-02"), 1, null, null);
//	session.persist(ob);
//	CartBean cart = session.get(CartBean.class, 1);
//	Set<CartItemBean> cib = cart.getItemBeans();
//	for(CartItemBean pb1 :cib) {
//		OrderItemBean oib = new OrderItemBean(null, ob, pb1.getProductBean(), pb1.getProductBean().getProduct_price(), pb1.getCart_item_amount(), null, null);
//		session.persist(oib);
//	}
	
	
	// 測試hql模糊搜尋夜市 
	@SuppressWarnings("unchecked")
	@Test
	public void searchNight() {

		String str = "夜市";
		
		String hql = "From NightMarketBean n Where n.market_name LIKE :name "; 
		
		List<NightMarketBean> list = session.createQuery(hql).setParameter("name","%"+str+"%")
									.getResultList();
		for (NightMarketBean nBean : list) {
			System.out.println(nBean.getMarket_name());
		}
		
		
	}
	
	// 測試hql模糊搜尋夜市 分頁查詢
	@SuppressWarnings("unchecked")
	@Test
	public void searchNightPage() {

		String str = "夜市";
		String hql = "From NightMarketBean n Where n.market_name LIKE '%"+str+"%'"; 
				
		int page = 1;
		int size = 3;
		
		List<NightMarketBean> list = session.createQuery(hql)
											.setFirstResult(page-1)
											.setMaxResults(size)
											.getResultList();
				
		for (NightMarketBean nBean : list) {
			System.out.println(nBean.getMarket_name());
		}
	}
	
	// 測試查詢所有的優惠券 (優惠券有效期限大於當前時間) 尚未過期
	@SuppressWarnings("unchecked")
	@Test
	public void getAllCouponNoExpired() {
		
		String str = "牛排";
		
		Date date = Calendar.getInstance().getTime();
		String hql = "FROM CouponBean c Where c.coupon_name LIKE :name and c.coupon_end >= :date and c.coupon_begin <= :date";
		
		List<CouponBean> list = session.createQuery(hql).setParameter("name","%"+str+"%")
														.setParameter("date", date)
														.getResultList();
		
		for (CouponBean couponBean : list) {
			System.out.println(couponBean.getCoupon_name());
		}
		
	}
	
	// 測試查詢所有的商品  --> 顯示商城全部的商品 
	@SuppressWarnings("unchecked")
	@Test
	public void getALLProducts() {
		
		String hql = "from ProductBean p ";
		List<ProductBean> list = session.createQuery(hql).getResultList();
		for (ProductBean pBean : list) {
			System.out.println(pBean.getProduct_name());
		}
		
	}
	
	// 測試查詢所有的商品 --> 依商品名稱
	@SuppressWarnings("unchecked")
	@Test
	public void getAllProductsByName() {
		
		String str = "洋芋片";
		
		String hql = "from ProductBean p where p.product_name LIKE :pName"; 
		
		List<ProductBean> list = session.createQuery(hql)
										.setParameter("pName", "%"+str+"%")
										.getResultList();
		for (ProductBean pBean : list) {
			System.out.println(pBean.getProduct_name());
		}

	}
	
	// 測試查詢所有的商品 --> 依特定的商品名稱 依商品價格高 由大至小排列
	@SuppressWarnings("unchecked")
	@Test
	public void getAllProductsByHighPrice() {
		
		String str = "洋芋片";
		
		String hql = "from ProductBean p where p.product_name LIKE :pName ORDER BY p.product_price DESC";

		List<ProductBean> list = session.createQuery(hql).setParameter("pName", "%"+str+"%")
														 .getResultList();

		for (ProductBean pBean : list) {
			System.out.println(pBean.getProduct_name()+" --> "+pBean.getProduct_price());
		}
		
		
	}
	
	// 測試查詢所有的商品 --> 依特定的商品名稱 依商品價格低 由小至大排列
	@SuppressWarnings("unchecked")
	@Test
	public void getAllProductsByLowPrice() {
		
		String str = "洋芋片";
		
		String hql = "from ProductBean p where p.product_name LIKE :pName ORDER BY p.product_price ASC";
		
		List<ProductBean> list = session.createQuery(hql).setParameter("pName", "%"+str+"%")
				 										 .getResultList();	
		for (ProductBean pBean : list) {
			System.out.println(pBean.getProduct_name()+" --> "+pBean.getProduct_price());
		}
	}
	
	// 測試查詢所有的商品 --> 依特定的商品名稱 依使用者輸入商品價格低 ~ 到商品價格高
	@SuppressWarnings("unchecked")
	@Test
	public void getAllProductsByBetweenPrice() {
		
		String str = "洋芋片";
		
		double lowPrice = 900.0;
		double highPrice = 950.0;
				
		String hql = "from ProductBean p WHERE p.product_name LIKE :pName and p.product_price BETWEEN :low AND :high";
		
		List<ProductBean> list = session.createQuery(hql)
										.setParameter("pName", "%"+str+"%")
										.setParameter("low", lowPrice)
										.setParameter("high", highPrice)
										.getResultList();
		
		for (ProductBean pBean : list) {
			System.out.println(pBean.getProduct_name()+" --> "+pBean.getProduct_price());
		}
	}
	
	// 測試查詢所有的商品 --> 依照最新上架的日期
	@SuppressWarnings("unchecked")
	@Test
	public void getReleaseNewProduct() {
		
		String hql = "from ProductBean p ORDER BY p.product_release DESC";
		
		List<ProductBean> list = session.createQuery(hql).getResultList();
		
		for (ProductBean pBean : list) {
			System.out.println(pBean.getProduct_name()+" --> "+pBean.getProduct_release());
		}
				
	}
	
	// 測試查詢所有的商品 --> 依照商品的類型
	@Test
	public void getProductTypeBean() {
		
		Integer product_type_id = 9;
		
		ProductTypeBean typeBean = session.get(ProductTypeBean.class, product_type_id);
		Set<ProductBean> products = typeBean.getProducts();
		
		for (ProductBean pBean : products) {
			System.out.println(pBean.getProduct_name());
		}
		
	}
	
	// 測試查詢所有的商家 --> 依商家名稱
	@SuppressWarnings("unchecked")
	@Test
	public void getAllShopByName() {
		
		String str= "牛排";
		
		String hql = "from ShopBean s where s.shop_name LIKE :sname";
		
		List<ShopBean> list = session.createQuery(hql)
								     .setParameter("sname", "%"+str+"%")
								     .getResultList();
		for (ShopBean shopBean : list) {
			System.out.println(shopBean.getShop_name());
		}
		
	}
	
	// 測試依商家的類型找出所有的商家 
	@Test
	public void getAllShopBean() {
		
		Integer shop_type_id = 1;
		
		ShopTypeBean shopTypeBean = session.get(ShopTypeBean.class, shop_type_id);
		Set<ShopBean> shops = shopTypeBean.getShops();
		
		for (ShopBean shopBean : shops) {
			System.out.println(shopBean.getShop_name());
		}
		
	}

	
	
}









