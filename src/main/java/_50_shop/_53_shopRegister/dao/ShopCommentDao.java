package _50_shop._53_shopRegister.dao;

import java.util.List;

import _02_model.entity.ShopCommentBean;

public interface ShopCommentDao {
	
	List<ShopCommentBean> getShopCommentByShopId(int shopId);
	
	int saveShopComment(ShopCommentBean shopCommentBean);
	
	int updateShopComment(ShopCommentBean shopCommentBean);
	
	List<ShopCommentBean> getShopCommentByShopIdAndMemberId(int shopId, int memberId);
	
	ShopCommentBean getShopCommentByCommentId(int CommentId);
	
	int getShopCommentCount(int shopId);
	
	double getShopCommentTotalScore(int shopId);
}
