package _10_member.dao;

import java.util.List;

import _02_model.entity.FavoriteShopListBean;

public interface FavoriteShopDao {

	int saveFavoriteShop(FavoriteShopListBean favoriteShopListBean);
	
	int updateFavoriteShop(FavoriteShopListBean favoriteShopListBean);
	
	List<FavoriteShopListBean> getFavoriteShopByMemberId(Integer memberId);
	
}
