package com.team.app.service.impl;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team.app.dao.RoleDao;
import com.team.app.dao.UserDeviceMappingDao;
import com.team.app.dao.UserInfoDao;
import com.team.app.domain.Role;
import com.team.app.domain.TblUserInfo;
import com.team.app.domain.UserDeviceMapping;
import com.team.app.logger.AtLogger;
import com.team.app.service.ConsumerInstrumentService;
import com.team.app.service.UserLoginService;
import com.team.mighty.notification.SendMail;
import com.team.mighty.notification.SendMailFactory;

@Service
public class UserLoginServiceImpl implements UserLoginService {
	
	private static final AtLogger logger = AtLogger.getLogger(UserLoginServiceImpl.class);

	@Autowired
	private UserInfoDao userInfoDao;
	
	@Autowired
	private RoleDao roleDao;
	
	@Autowired
	private UserDeviceMappingDao userDeviceMappingDao;
	
	@Autowired
	private ConsumerInstrumentService consumerInstrumentServiceImpl;
	
	
	public TblUserInfo getUserByUserAndPwd(String username, String password) throws Exception {
		return userInfoDao.getUserByUserAndPwd(username,password);
	}


	
	public List<TblUserInfo> getUserInfosCount() throws Exception {
		return userInfoDao.getUserInfosCount();
	}



	public List<TblUserInfo> getUserInfos()throws Exception {
		return userInfoDao.getUserInfos();
	}



	public TblUserInfo getUserByUnameAndEmail(String uname, String email) throws Exception {
		return userInfoDao.getUserByUnameAndEmail(uname,email);
	}



	public TblUserInfo getUserByEmailId(String email) throws Exception {
		return userInfoDao.getUserByEmailId(email);
	}



	public Role getRoleByRoleId(String roleId) throws Exception {
		return roleDao.getRoleByRoleId(roleId);
	}


	@Transactional
	public TblUserInfo saveUser(TblUserInfo user, UserDeviceMapping udm) throws Exception  {
		validateDeviceEUI(udm.getDevEUI(),udm.getOrgId());		
		TblUserInfo u=userInfoDao.save(user);
		if(u!=null){						
			udm.setTblUserInfo(u);
			UserDeviceMapping udmSave=userDeviceMappingDao.save(udm);
			if(udmSave!=null){
				try{
					logger.debug("in try block");
					String subject = "Your brand new USWM account";
					String message = consumerInstrumentServiceImpl.getUserAccountMessage(u);
							
					SendMail mail =SendMailFactory.getMailInstance();
					mail.send(u.getEmailId().trim(), subject, message);
					
				
				}catch(Exception e){
					logger.error("Exception in mail ",e);
					throw new Exception("System Exception while registering user!");
				}
				
				return u;
			}else{
				return null;
			}
		}else{
			return null;
		}
		
		
	}



	



	void validateDeviceEUI(String devEUI,String orgId) throws Exception{
		UserDeviceMapping dEUI=userDeviceMappingDao.getDeviceByEUIAndOrgId(devEUI,orgId);
		if(dEUI!=null){
			throw new Exception("Device already exist");
		}
		
	}



	public UserDeviceMapping saveUDM(UserDeviceMapping udm) throws Exception {
		return userDeviceMappingDao.save(udm);
	}



	
	public void updateUserInfo(TblUserInfo user) throws Exception {
		userInfoDao.save(user);
		
	}


	public TblUserInfo getUserByUId(String uId) throws Exception {
		
		return userInfoDao.getUserByUId(uId);
	}



	public List<TblUserInfo> getUserListByEmail(String email) throws Exception {
		return userInfoDao.getUserListByEmail(email);
	}



	
	public UserDeviceMapping saveNewUDMToUser(UserDeviceMapping udm) throws Exception {
		validateDeviceEUI(udm.getDevEUI(),udm.getOrgId());	
		return userDeviceMappingDao.save(udm);
	}

}
