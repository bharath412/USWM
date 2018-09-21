package com.team.app.dao;

import java.io.Serializable;

import org.springframework.data.jpa.repository.JpaRepository;

import com.team.app.domain.TblPaymentInfo;

public interface PaymentBillDao extends JpaRepository<TblPaymentInfo, Serializable> {

}
