package _30_coupon._33_editCoupon.dao;

import java.util.List;

import _02_model.entity.CouponBean;
import _02_model.entity.FavoriteCouponListBean;
import _10_member.entity.Member;

public interface  FavoriteCouponDao {
	public int saveFavoriteCoupon(FavoriteCouponListBean favoriteCouponListBean);
	 
	public int updateFavoriteCoupon(FavoriteCouponListBean favoriteCouponListBean);
	
	public List<FavoriteCouponListBean> getFavoriteCouponByMemberId(Integer memberId);
	
	public void deleteSingleFavoriteCouponByMemberId(Integer memberId,Integer coupon_id);

	

	
}
