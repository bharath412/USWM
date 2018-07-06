package com.team.app.domain;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;


/**
 * The persistent class for the lora_frames database table.
 * 
 */
@Entity
@Table(name="lora_frames")
@NamedQuery(name="LoraFrame.findAll", query="SELECT l FROM LoraFrame l")
public class LoraFrame implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private String id;

	private String applicationID;

	private String applicationName;

	
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="created_at")
	private Date createdAt;

	private String devEUI;

	private String fPort;

	@Column(name="gateway_mac")
	private String gatewayMac;

	@Column(name="gateway_name")
	private String gatewayName;
	
	private String nodeName;
	
	private String waterLtr;
	

	public String getWaterLtr() {
		return waterLtr;
	}

	public void setWaterLtr(String waterLtr) {
		this.waterLtr = waterLtr;
	}

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="updated_at")
	private Date updatedAt;

	public LoraFrame() {
	}

	public String getId() {
		return this.id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getApplicationID() {
		return this.applicationID;
	}

	public void setApplicationID(String applicationID) {
		this.applicationID = applicationID;
	}

	public String getApplicationName() {
		return this.applicationName;
	}

	public void setApplicationName(String applicationName) {
		this.applicationName = applicationName;
	}

	
	public Date getCreatedAt() {
		return this.createdAt;
	}

	public void setCreatedAt(Date createdAt) {
		this.createdAt = createdAt;
	}

	public String getDevEUI() {
		return this.devEUI;
	}

	public void setDevEUI(String devEUI) {
		this.devEUI = devEUI;
	}

	
	public String getFPort() {
		return this.fPort;
	}

	public void setFPort(String fPort) {
		this.fPort = fPort;
	}

	public String getGatewayMac() {
		return this.gatewayMac;
	}

	public void setGatewayMac(String gatewayMac) {
		this.gatewayMac = gatewayMac;
	}

	public String getGatewayName() {
		return this.gatewayName;
	}

	public void setGatewayName(String gatewayName) {
		this.gatewayName = gatewayName;
	}

	
	public String getNodeName() {
		return this.nodeName;
	}

	public void setNodeName(String nodeName) {
		this.nodeName = nodeName;
	}

	public String getfPort() {
		return fPort;
	}

	public void setfPort(String fPort) {
		this.fPort = fPort;
	}

	public Date getUpdatedAt() {
		return this.updatedAt;
	}

	public void setUpdatedAt(Date updatedAt) {
		this.updatedAt = updatedAt;
	}

}