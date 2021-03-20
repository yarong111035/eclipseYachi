package _90_admin._94_editActivity.service.impl;

import java.io.Serializable;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import _02_model.entity.AdminActivityBean;
import _90_admin._94_editActivity.dao.editActivityDao;
import _90_admin._94_editActivity.service.editActivityService;



@Transactional
@Service
public class editActivityServiceImpl implements Serializable, editActivityService{
	
	@Autowired
	editActivityDao adminactivitydao;

	@Transactional
	@Override
	public AdminActivityBean getAdminActivity(int adminactivity_id) {
		
		return adminactivitydao.getAdminActivity(adminactivity_id);
	}
	
	@Transactional
	@SuppressWarnings("unchecked")
	@Override
	public int saveAdminActivity(AdminActivityBean bean) {
		
		return adminactivitydao.saveAdminActivity(bean);
	}

	@Transactional
	@SuppressWarnings("unchecked")
	@Override
	public List<AdminActivityBean> getAllAdminActivities() {
		
		return adminactivitydao.getAllAdminActivities();
	}

	
	@Transactional
	@Override
	public int updateAdminActivity(AdminActivityBean bean) {
		
		return adminactivitydao.updateAdminActivity(bean);
	}
	

	@Override
	public int deleteAdminActivity(int adminactivity_id) {
		
		return adminactivitydao.deleteAdminActivity(adminactivity_id);
	}
	

}
