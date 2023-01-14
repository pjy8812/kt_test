package com.kt.klp.adm.admin.policy.domain;

import com.kt.klp.adm.admin.settlement.domain.SettlementStatusVO;

/**
*
* FreightOwnerPenaltyVO : 
* <p>
*
* <pre>
* Modification Information·
* Modification date    Modifier Modification content    (수정일, 수정자, 수정내용)
* --------------------------------------------------
* 2022.04.22       Jungeun Cho     Initial creation
* </pre>
*
* @author IOUSOFT Jungeun Cho (josee@iousoft.co.kr)
* @since 2022.04.22
* @version 1.0.0
* @see
*
*/
public class FreightOwnerPenaltyVO extends SettlementStatusVO {

	int freightOwnerpenaltyPolicySeq; // 화주패널티정책seq
	String freightOwnerPenaltyPolicyActicity; // 화주패널티Acticity
	
	String freightOwnerPenaltyPolicyDetails; // 화주패널티디테일
	int freightOwnerPenaltyPolicyMinT; // 화주패널티최소톤
	float freightOwnerPenaltyPolicyMaxT; // 화주패널티최대톤
	
	String freightOwnerPenaltyPolicyPenalty; // 화주패널티
	String freightOwnerPenaltyPolicyDescription; // 화주패널티설명

	public int getFreightOwnerpenaltyPolicySeq() {
		return freightOwnerpenaltyPolicySeq;
	}

	public void setFreightOwnerpenaltyPolicySeq(int freightOwnerpenaltyPolicySeq) {
		this.freightOwnerpenaltyPolicySeq = freightOwnerpenaltyPolicySeq;
	}

	public String getFreightOwnerPenaltyPolicyActicity() {
		return freightOwnerPenaltyPolicyActicity;
	}

	public void setFreightOwnerPenaltyPolicyActicity(String freightOwnerPenaltyPolicyActicity) {
		this.freightOwnerPenaltyPolicyActicity = freightOwnerPenaltyPolicyActicity;
	}

	public String getFreightOwnerPenaltyPolicyDetails() {
		return freightOwnerPenaltyPolicyDetails;
	}

	public void setFreightOwnerPenaltyPolicyDetails(String freightOwnerPenaltyPolicyDetails) {
		this.freightOwnerPenaltyPolicyDetails = freightOwnerPenaltyPolicyDetails;
	}

	public int getFreightOwnerPenaltyPolicyMinT() {
		return freightOwnerPenaltyPolicyMinT;
	}

	public void setFreightOwnerPenaltyPolicyMinT(int freightOwnerPenaltyPolicyMinT) {
		this.freightOwnerPenaltyPolicyMinT = freightOwnerPenaltyPolicyMinT;
	}

	public float getFreightOwnerPenaltyPolicyMaxT() {
		return freightOwnerPenaltyPolicyMaxT;
	}

	public void setFreightOwnerPenaltyPolicyMaxT(float freightOwnerPenaltyPolicyMaxT) {
		this.freightOwnerPenaltyPolicyMaxT = freightOwnerPenaltyPolicyMaxT;
	}

	public String getFreightOwnerPenaltyPolicyPenalty() {
		return freightOwnerPenaltyPolicyPenalty;
	}

	public void setFreightOwnerPenaltyPolicyPenalty(String freightOwnerPenaltyPolicyPenalty) {
		this.freightOwnerPenaltyPolicyPenalty = freightOwnerPenaltyPolicyPenalty;
	}

	public String getFreightOwnerPenaltyPolicyDescription() {
		return freightOwnerPenaltyPolicyDescription;
	}

	public void setFreightOwnerPenaltyPolicyDescription(String freightOwnerPenaltyPolicyDescription) {
		this.freightOwnerPenaltyPolicyDescription = freightOwnerPenaltyPolicyDescription;
	}

}
