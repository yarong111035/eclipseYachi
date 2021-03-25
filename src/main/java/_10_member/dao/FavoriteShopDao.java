package _10_member.dao;

import java.util.List;

import _02_model.entity.FavoriteShopListBean;
import _02_model.entity.ShopBean;
import _10_member.entity.Member;

public interface FavoriteShopDao {

	int saveFavoriteShop(FavoriteShopListBean favoriteShopListBean);
	
	int updateFavoriteShop(FavoriteShopListBean favoriteShopListBean);
	
	List<FavoriteShopListBean> getFavoriteShopByMemberId(Integer memberId);
	
	public void saveFavoriteShop2(Member member,Integer shopBean_id);
	
}
