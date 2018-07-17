package com.team.app.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team.app.dao.FrameDao;
import com.team.app.domain.LoraFrame;
import com.team.app.domain.TblUserInfo;
import com.team.app.logger.AtLogger;
import com.team.app.service.ConsumerInstrumentService;

/**
 * 
 * @author Vikky
 *
 */
@Service("consumerInstrumentServiceImpl")
public class ConsumerInstrumentServiceImpl implements ConsumerInstrumentService {

	private final AtLogger logger = AtLogger.getLogger(ConsumerInstrumentServiceImpl.class);
	
		
	@Autowired
	private FrameDao frameDao;		
		
	public void setUpdateNodeName(String nodeName,String devEUI) throws Exception {
		frameDao.setUpdateNodeName(nodeName,devEUI);
	}

	public void deleteDevEUI(String appId, String devEUI) throws Exception {
		frameDao.deleteDevEUI(appId,devEUI);
		
	}
	
	public List<LoraFrame> getDevEUIByAppId(String appId) throws Exception {
		return frameDao.getDevEUIByAppId(appId);
	}

	public List<LoraFrame> getDeviceIdByDevEUI(String devEUI) throws Exception {
		return frameDao.getDeviceIdByDevEUI(devEUI);
	}

	public List<LoraFrame> getFrames() throws Exception {
		return frameDao.getFrames();
	}

	
	public String getUserAccountMessage(TblUserInfo u) throws Exception {
		return "Heyo "
				+u.getUname().toLowerCase()	
				+",<br/><br/>I heard that you just created a Unizen SWM account. You're just a few steps away from taking your favorite portal on-the-go. Super exciting."
				+"<br/><br/>You'll remain logged into your USWM account unless you login with a different account. If you happen to get logged out and can't remember your password, click the Forgot Password link on the USWM login screen to reset it."
				+"<br/><br/>Please use the below credential to access your account."
				+"<br/><br/>LoginID : "+u.getUname()
				+"<br/>Password : "+u.getPassword()
				+"<br/>URL : http://139.59.14.31:8081/USWM"
				+"<br/><br/>If you have any questions about anything related to USWM, please email the USWM team at vikky@unizentechnologies.com"
				+"<br/><br/>Much love,"
				+"<br/>The USWM Robot"
				+"<br/><br/><em>I'm a robot and my owners won't let me receive inbound messages. If you have any questions, please send my owners an email at vikky@unizentechnologies.com</em>"; 
				
		
	}





	

	
}