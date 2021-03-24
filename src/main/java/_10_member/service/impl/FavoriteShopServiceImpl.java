package _10_member.service.impl;

import java.io.Serializable;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import _02_model.entity.FavoriteShopListBean;
import _02_model.entity.ShopBean;
import _10_member.dao.FavoriteShopDao;
import _10_member.dao.MemberDao;
import _10_member.entity.Member;
import _10_member.service.FavoriteShopService;

@Transactional
@Service
public class FavoriteShopServiceImpl implements Serializable, FavoriteShopService{

	@Autowired
	FavoriteShopDao favoriteShopDao;
	
	@Autowired
	MemberDao memberDao;
	
	@Override
	public int saveFavoriteShop(ShopBean shopBean, Member member) {
		int n = 0;
		
		List<FavoriteShopListBean> fsbl = favoriteShopDao.getFavoriteShopByMemberId(member.getMemberId());
		
		
		if (fsbl.size() == 0) {  //先判斷該會員有沒有收藏過店家
			Set<ShopBean> sbl = new HashSet<ShopBean>();  //新增一個裝店家的set容器
			sbl.add(shopBean);  //將要被加入的shop加入
			FavoriteShopListBean fsb = new FavoriteShopListBean();  //新增一個喜愛店家清單
			fsb.setMemberBean(member);  //將喜愛清單標註為該會員的
			fsb.setShops(sbl);  //將喜愛店家加入清單
			favoriteShopDao.saveFavoriteShop(fsb);  //儲存
			n++;
		}else {
			Set<ShopBean> sbl = new HashSet<ShopBean>();  //新增一個臨時裝店家的set容器
			FavoriteShopListBean tempfsb = new FavoriteShopListBean();  //新增一個臨時清單
			for(FavoriteShopListBean fsb : fsbl) {  //雖然是list但只會有一樣，還是用for取出
				tempfsb = fsb;  //將找到的清單放入暫時清單中
				sbl = tempfsb.getShops();  //將舊有清單中的店家取出
			}
			sbl.add(shopBean);  //將新的店家加入時裝店家的set容器
			tempfsb.setShops(sbl);  //並放回臨時清單
			favoriteShopDao.updateFavoriteShop(tempfsb);  //儲存
			n++;
		}
		
		return n;
	}

	@Override
	public int updateFavoriteShop(FavoriteShopListBean favoriteShopListBean) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<FavoriteShopListBean> getFavoriteShopByMemberId(Integer memberId) {
		// TODO Auto-generated method stub
		return null;
	}

	
}
