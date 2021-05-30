package com.ssaragibyul.point.domain;

public class MyPoint {

	private String id; //userId
	private int total; //전체 잔여포인트(예약 중 포인트도 사용분으로 처리)
	private int reserved; //예약 중 포인트
	
	public MyPoint() {}

	public MyPoint(String id, int total, int reserved) {
		super();
		this.id = id;
		this.total = total;
		this.reserved = reserved;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}

	public int getReserved() {
		return reserved;
	}

	public void setReserved(int reserved) {
		this.reserved = reserved;
	}

	@Override
	public String toString() {
		return "MyPoint [id=" + id + ", total=" + total + ", reserved=" + reserved + "]";
	}
	
}
