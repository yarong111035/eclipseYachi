package _20_shoppingMall._23_orderProcess.service.impl;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import _02_model.entity.PayTypeBean;
import _20_shoppingMall._23_orderProcess.dao.PayTypeDao;

@Service
public class PayTypeService implements _20_shoppingMall._23_orderProcess.service.PayTypeService {
	@Autowired
	PayTypeDao payTypeDao;
	
	@Override
	@Transactional
	public List<PayTypeBean> getAllPayTypes() {
		return payTypeDao.getAllPayTypes();
	}

	@Override
	@Transactional
	public PayTypeBean getPayTypeById(int payTypeId) {
		return payTypeDao.getPayTypeById(payTypeId);
	}

}
