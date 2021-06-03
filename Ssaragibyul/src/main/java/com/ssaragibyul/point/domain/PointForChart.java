package com.ssaragibyul.point.domain;

public class PointForChart {

	private String id;
	private int fundTotal;
	private int fundReserved;
	private int donationTotal;
	private int donationReserved;
	private int visitTotal;
	private int takePresentTotal;
	private int givePresentTotal;
	private int chargeTotal;
	
	public PointForChart() {}

	public PointForChart(String id, int fundTotal, int fundReserved, int donationTotal, int donationReserved,
			int visitTotal, int takePresentTotal, int givePresentTotal, int chargeTotal) {
		super();
		this.id = id;
		this.fundTotal = fundTotal;
		this.fundReserved = fundReserved;
		this.donationTotal = donationTotal;
		this.donationReserved = donationReserved;
		this.visitTotal = visitTotal;
		this.takePresentTotal = takePresentTotal;
		this.givePresentTotal = givePresentTotal;
		this.chargeTotal = chargeTotal;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public int getFundTotal() {
		return fundTotal;
	}

	public void setFundTotal(int fundTotal) {
		this.fundTotal = fundTotal;
	}

	public int getFundReserved() {
		return fundReserved;
	}

	public void setFundReserved(int fundReserved) {
		this.fundReserved = fundReserved;
	}

	public int getDonationTotal() {
		return donationTotal;
	}

	public void setDonationTotal(int donationTotal) {
		this.donationTotal = donationTotal;
	}

	public int getDonationReserved() {
		return donationReserved;
	}

	public void setDonationReserved(int donationReserved) {
		this.donationReserved = donationReserved;
	}

	public int getVisitTotal() {
		return visitTotal;
	}

	public void setVisitTotal(int visitTotal) {
		this.visitTotal = visitTotal;
	}

	public int getTakePresentTotal() {
		return takePresentTotal;
	}

	public void setTakePresentTotal(int takePresentTotal) {
		this.takePresentTotal = takePresentTotal;
	}

	public int getGivePresentTotal() {
		return givePresentTotal;
	}

	public void setGivePresentTotal(int givePresentTotal) {
		this.givePresentTotal = givePresentTotal;
	}

	public int getChargeTotal() {
		return chargeTotal;
	}

	public void setChargeTotal(int chargeTotal) {
		this.chargeTotal = chargeTotal;
	}

	@Override
	public String toString() {
		return "PointForChart [id=" + id + ", fundTotal=" + fundTotal + ", fundReserved=" + fundReserved
				+ ", donationTotal=" + donationTotal + ", donationReserved=" + donationReserved + ", visitTotal="
				+ visitTotal + ", takePresentTotal=" + takePresentTotal + ", givePresentTotal=" + givePresentTotal
				+ ", chargeTotal=" + chargeTotal + "]";
	}

}
