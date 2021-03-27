package _90_admin._94_editActivity.service;

import java.util.List;

import _02_model.entity.AdminActivityBean;
import _02_model.entity.AdminCouponTypeBean;


public interface editActivityService {
	
	AdminActivityBean getAdminActivity(int adminactivity_id);
	
	int saveAdminActivity (AdminActivityBean bean);
	
	List<AdminActivityBean> getAllAdminActivities();
	
	
	int updateAdminActivity(AdminActivityBean bean);
	
	int deleteAdminActivity(int adminactivity_id);
	
	List<AdminActivityBean> getCurrentAdminActivity();
}
