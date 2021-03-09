package _00_util;


import java.util.HashSet;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Set;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.core.type.filter.AbstractClassTestingTypeFilter;

import _00_util.util.HibernateUtils;
import _02_model.entity.CouponBean;
import _02_model.entity.FavoriteCouponListBean;
import _02_model.entity.NightMarketBean;
import _02_model.entity.ShopBean;
import _02_model.entity.ShopMenuBean;
import _02_model.entity.ShopTypeBean;
import _10_member.entity.Member;
import _10_member.entity.Role;

public class Main_Init_sql {

	public static void main(String[] args) {
		
		SessionFactory factory = HibernateUtils.getSessionFactory();
		Session session = factory.getCurrentSession();
		Transaction tx = session.beginTransaction();
				
//		//--------------會員增加管理員角色
		Member mb = session.get(Member.class, 1);
		Set<Role> set = mb.getRoles();
		
		Role roleA = new Role();
		roleA.setRole_name("管理員");
		roleA.setRole_code("ADMIN");
		
		set.add(roleA);			
		mb.setRoles(set);
		
		session.update(mb);
		
		//--------------新增夜市
//		NightMarketBean nightMarketBean1 = new NightMarketBean("饒河夜市",4.2);		
//		NightMarketBean nightMarketBean2 = new NightMarketBean("華西街觀光夜市",4.0);
//		NightMarketBean nightMarketBean3 = new NightMarketBean("寧夏夜市",3.9);
//		NightMarketBean nightMarketBean4 = new NightMarketBean("士林夜市",2.5);
//		NightMarketBean nightMarketBean5 = new NightMarketBean("臨江街觀光夜市",4.0);
//		NightMarketBean nightMarketBean6 = new NightMarketBean("延三夜市",4.6);
//		NightMarketBean nightMarketBean7 = new NightMarketBean("廣州街夜市",4.3);
//		NightMarketBean nightMarketBean8 = new NightMarketBean("南機場夜市",4.1);
//		session.persist(nightMarketBean1);
//		session.persist(nightMarketBean2);
//		session.persist(nightMarketBean3);
//		session.persist(nightMarketBean4);
//		session.persist(nightMarketBean5);
//		session.persist(nightMarketBean6);
//		session.persist(nightMarketBean7);
//		session.persist(nightMarketBean8);	
//		
		//--------------新增商家類型
//		ShopTypeBean shopTypeBean1 = new ShopTypeBean("中式料理");
//		ShopTypeBean shopTypeBean2 = new ShopTypeBean("西式料理");
//		ShopTypeBean shopTypeBean3 = new ShopTypeBean("日式料理");
//		ShopTypeBean shopTypeBean4 = new ShopTypeBean("飲料");
//		ShopTypeBean shopTypeBean5 = new ShopTypeBean("衣服");
//		ShopTypeBean shopTypeBean6 = new ShopTypeBean("飾品");
//		ShopTypeBean shopTypeBean7 = new ShopTypeBean("手機周邊");
//		ShopTypeBean shopTypeBean8 = new ShopTypeBean("日常生活用品");
//		ShopTypeBean shopTypeBean9 = new ShopTypeBean("遊戲");
//		session.persist(shopTypeBean1);
//		session.persist(shopTypeBean2);
//		session.persist(shopTypeBean3);
//		session.persist(shopTypeBean4);
//		session.persist(shopTypeBean5);
//		session.persist(shopTypeBean6);
//		session.persist(shopTypeBean7);
//		session.persist(shopTypeBean8);
//		session.persist(shopTypeBean9);
//		
//		//-------------------------測試會員註冊成為商家以及從商家新增商品菜單
//		Member mb1 = session.get(Member.class, 1);
//		ShopTypeBean st = session.get(ShopTypeBean.class, 2);        // 商家的類型
//		NightMarketBean nm = session.get(NightMarketBean.class, 1);  // 商家所在的夜市
//		
//		ShopBean sp = new ShopBean(null, "你家牛排", null, "好ㄘ的牛排", "taipei", "0912321321", 
//				"11:00~22:00 everyday", "www.yoursteak.com", null, null, st, nm, null);
//		
//		//會員註冊商家(會員資料庫有註冊商家的外鍵)
//		mb1.setShopBean(sp);  
//		session.persist(sp);
//		ShopBean sp1 = session.get(ShopBean.class, 1);
//		ShopMenuBean sm = new ShopMenuBean(null, sp1, null, "鐵板麵", "好吃的鐵板麵", 80.0);
//		ShopMenuBean sm1 = new ShopMenuBean(null, sp1, null, "厚切沙朗牛排", "好吃的沙朗牛排", 150.0);
//		ShopMenuBean sm2 = new ShopMenuBean(null, sp1, null, "厚切菲力牛排", "好吃的菲力牛排", 180.0);
//		ShopMenuBean sm3 = new ShopMenuBean(null, sp1, null, "厚切魷魚排", "好吃的魷魚", 150.0);
//		session.persist(sm);
//		session.persist(sm1);
//		session.persist(sm2);
//		session.persist(sm3);
//		
//		//-------------------------測試從商家撈出多個菜單
//		//String hql = "from Shop s,Shop_Menu m where s.shop_id=m.FK_shop_id";
//		ShopBean sp = session.get(ShopBean.class, 1);
//		Set<ShopMenuBean> menulist = sp.getShopMenus();
//		
//		for(ShopMenuBean sp1 : menulist) {
//			
//			System.out.println(sp1.getMenu_name());
//
//		}
		
		//-------------------------測試商家新增優惠券
//		ShopBean shopBean = session.get(ShopBean.class, 1);
//		CouponBean cp = new CouponBean(null, 10, "你家牛排鐵板麵折價券", "1111限定單人使用", 11, java.sql.Date.valueOf("2020-11-11"), "1111鐵板麵折價卷", null, shopBean);
//		CouponBean cp1 = new CouponBean(null, 20, "你家牛排厚切鐵板麵折價券", "1212限定單人使用", 12, java.sql.Date.valueOf("2020-12-12"), "1212厚切鐵板麵折價卷", null, shopBean);
//		CouponBean cp2 = new CouponBean(null, 25, "你家牛排厚切菲力牛排折價券", "限定老闆使用", 1, java.sql.Date.valueOf("2020-12-31"), "阿就是折價卷", null, shopBean);
//		
//		// 優惠券添加商家的類型  中式料理or西式料理...等等
//		cp.setShopTypeBean(shopBean.getShopTypeBean());
//		cp1.setShopTypeBean(shopBean.getShopTypeBean());
//		cp2.setShopTypeBean(shopBean.getShopTypeBean());
//
//		Set<CouponBean> coupons = new LinkedHashSet<>();
//		coupons.add(cp);
//		coupons.add(cp1);
//		coupons.add(cp2);
//		
//		shopBean.setCoupons(coupons);
//		session.update(shopBean);
////		
//		//-------------------------測試從商家撈出多個優惠券
		//String hql = "from Shop s,Shop_Menu m where s.shop_id=m.FK_shop_id";
//		ShopBean sp = session.get(ShopBean.class, 1);
//		Set<CouponBean> coupons = sp.getCoupons();
//		
//		for(CouponBean sp1 : coupons) {
//			
//			System.out.println(sp1.getCoupon_name());
//
//		}
//	
//		//---------------------測試會員收藏優惠券 以及再次收藏優惠券
//		Member mb = session.get(Member.class, 2);
//		CouponBean cp = session.get(CouponBean.class, 3);
//		
//		String hql = "FROM FavoriteCouponListBean WHERE memberBean.memberId = :mid";
//		@SuppressWarnings("unchecked")
//		List<FavoriteCouponListBean> resultList = session.createQuery(hql)
//													 .setParameter("mid", mb.getMemberId())
//													 .getResultList();	
//		if (resultList == null) {
//			
//			// 新創建一個Set 將一個一個優惠券集合成Set
//			Set<CouponBean> coupons = new LinkedHashSet<CouponBean>();
//			coupons.add(cp);
//			
//			// 該會員第一次收藏優惠券才需要創建 FavoriteCouponListBean
//			FavoriteCouponListBean fc2 = new FavoriteCouponListBean();
//			fc2.setMemberBean(mb);
//			fc2.setCoupons(coupons);
//			
//			session.persist(fc2);
//		}else {
//			Set<CouponBean> coupons = new HashSet<CouponBean>();
//			FavoriteCouponListBean tempfcl = new FavoriteCouponListBean();
//			for (FavoriteCouponListBean fcl: resultList) {
//				fcl = tempfcl;
//				coupons = fcl.getCoupons();
//			 
//			}
//			
//			// 該會員想要再次收藏其他的優惠券 
//			
//			coupons.add(cp);
//			tempfcl.setCoupons(coupons);
//			
//			session.update(tempfcl);
//		}
////		
//		//-------------------------測試會員撈出喜愛的優惠券		
//		Member mb = session.get(Member.class, 2);
//		String hql = "FROM FavoriteCouponListBean WHERE memberBean.memberId = :mid";
//		System.out.println(mb.getMemberId());
//		
//		 List<FavoriteCouponListBean> resultList = session.createQuery(hql)
//								 .setParameter("mid", mb.getMemberId())
//								 .getResultList();
//		 
//		 System.out.println(resultList);
//		 Set<CouponBean> coupons = new HashSet<CouponBean>();
//		 
//		 for (FavoriteCouponListBean coupon : resultList) {
//			 coupons = coupon.getCoupons();
//			 
//			}
//		 
//		 for (CouponBean coupon : coupons) {
//			 System.out.println(coupon.toString());
//			 
//			}
//				
//				
//		Set<CouponBean> coupons = resultList
//		
//		for (CouponBean couponBean : coupons) {
//			System.out.println("會員收藏的折價券--> "+couponBean.getCoupon_name());
//		}
		
		
		//-------------------------測試會員收藏商家
//		Member mb = session.get(Member.class, 1);
//		Set<ShopBean> shops = new LinkedHashSet<ShopBean>();
//		shops.add(session.get(ShopBean.class, 1));
//		
//		FavoriteShopListBean fsl = new FavoriteShopListBean(null, mb, shops, java.sql.Timestamp.valueOf("2020-12-31 23:59:59.000"));
//		
//		session.persist(fsl);
		//-------------------------測試新增商城商品
//		ProductTypeBean pt = session.get(ProductTypeBean.class, 1);
//		ProductTypeBean pt1 = session.get(ProductTypeBean.class, 2);
//		ProductTypeBean pt2 = session.get(ProductTypeBean.class, 7);
//		ProductTypeBean pt3 = session.get(ProductTypeBean.class, 8);
//		ProductTypeBean pt4 = session.get(ProductTypeBean.class, 5);
//		ProductBean pd = new ProductBean(null, "免洗環保筷", 100.0, 20, "不用洗的環保筷", null, java.sql.Date.valueOf("2021-09-01"), null, pt, null);
//		ProductBean pd1 = new ProductBean(null, "免洗環保碗", 150.0, 50, "不用洗的環保碗", null, java.sql.Date.valueOf("2021-09-02"), null, pt1, null);
//		ProductBean pd2 = new ProductBean(null, "紅豆餅餐車", 15000.0, 5, "30年+9餐車", null, java.sql.Date.valueOf("2030-05-01"), null, pt2, null);
//		ProductBean pd3 = new ProductBean(null, "秘製關東煮醬", 100.0, 1000, "好ㄘ的關東煮醬", null, java.sql.Date.valueOf("2020-09-01"), null, pt3, null);
//		ProductBean pd4 = new ProductBean(null, "營業用紙袋(小)", 300.0, 1000, "營業用紙袋(小)", null, java.sql.Date.valueOf("2021-09-01"), null, pt4, null);
//		session.persist(pd);
//		session.persist(pd1);
//		session.persist(pd2);
//		session.persist(pd3);
//		session.persist(pd4);
		//-------------------------測試將商品放入購物車
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
		//-------------------------測試將商品加入訂單
//		ProductBean pd = session.get(ProductBean.class, 1);
//		ProductBean pd1 = session.get(ProductBean.class, 2);
//		Member mb = session.get(Member.class, 1);
//		OrderBean ob = new OrderBean(null, mb, "neihu", null, "你家牛排", "03799401", "023323211", java.sql.Timestamp.valueOf("2020-12-31 23:59:59.000"), java.sql.Date.valueOf("2021-01-02"), 1, 1, null);
//		OrderItemBean oib = new OrderItemBean(null, ob, pd, pd.getProduct_price(), 5, null, null);
//		OrderItemBean oib1 = new OrderItemBean(null, ob, pd1, pd1.getProduct_price(), 10, null, null);
//		
//		session.persist(ob);
//		session.persist(oib);
//		session.persist(oib1);
		//--------------------------使用hql將特定種類物品取出
		//--------------------------注意當tostring方法裡有其bean時會出現overstack例外
	
//		String hql = "FROM ProductBean pb WHERE pb.productTypeBean = 1";
//		List<ProductBean> list = session.createQuery(hql).getResultList();
//		System.out.println(list.toString());
		
		//--------------------------從cart取出商品在加入order
//		OrderBean ob = new OrderBean(null, session.get(Member.class, 1), "neihu", null, "你家牛排", "你家牛排", "2223311", java.sql.Timestamp.valueOf("2020-12-31 23:59:59.000"), java.sql.Date.valueOf("2021-01-02"), 1, null, null);
//		session.persist(ob);
//		CartBean cart = session.get(CartBean.class, 1);
//		Set<CartItemBean> cib = cart.getItemBeans();
//		for(CartItemBean pb1 :cib) {
//			OrderItemBean oib = new OrderItemBean(null, ob, pb1.getProductBean(), pb1.getProductBean().getProduct_price(), pb1.getCart_item_amount(), null, null);
//			session.persist(oib);
//		}
				
		tx.commit();
		session.close();
		System.out.println("程式結束.......");
		factory.close();

	}

}
