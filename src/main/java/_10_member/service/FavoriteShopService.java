package _10_member.service;

import java.util.List;

import _02_model.entity.FavoriteShopListBean;
import _02_model.entity.ShopBean;
import _10_member.entity.Member;

public interface FavoriteShopService {
	
	int saveFavoriteShop(ShopBean shopBean , Member member);
	
	public void saveFavoriteShop2(Member member, Integer shopBean_id) ;

}
