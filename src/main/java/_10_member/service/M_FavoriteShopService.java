package _10_member.service;

import java.util.List;
import java.util.Map;
import java.util.Set;

import _02_model.entity.ShopBean;

public interface M_FavoriteShopService {

	public List<Map<String,Object>> getMyFavoriteShopByMemberId(Integer memberId);
	
	public ShopBean  getShopBy_shop_id(Integer shop_id);
	
	public void deleteSingleFavoriteShopByMemberId(Integer memberId, Integer shop_id );

	public Set<ShopBean> getMyFavoriteShopByMemberId2(Integer memberId);
}

	
