package _30_coupon._33_editCoupon.service;

import java.util.List;

import org.springframework.stereotype.Service;

import _02_model.entity.CouponBean;
import _02_model.entity.FavoriteCouponListBean;
import _10_member.entity.Member;


public interface FavoriteCouponService {
	
	public int saveFavoriteCoupon(CouponBean couponBean, Member member);
	
	public List<FavoriteCouponListBean> getFavoriteCouponByMemberId(Integer memberId);
	
	public void deleteSingleFavoriteCouponByMemberId(Integer memberId,Integer coupon_id);


}
