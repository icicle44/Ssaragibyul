package com.ssaragibyul.common;

public class DistanceInfo {
	
	private double markerLat;
	private double markerLnt;
	private double myLat;
	private double myLnt;
	private String unit;
	
	public DistanceInfo() {
		// TODO Auto-generated constructor stub
	}
	
	public DistanceInfo(double markerLat, double markerLnt, double myLat, double myLnt, String unit) {
		super();
		this.markerLat = markerLat;
		this.markerLnt = markerLnt;
		this.myLat = myLat;
		this.myLnt = myLnt;
		this.unit = unit;
	}

	public double getMarkerLat() {
		return markerLat;
	}

	public void setMarkerLat(double markerLat) {
		this.markerLat = markerLat;
	}

	public double getMarkerLnt() {
		return markerLnt;
	}

	public void setMarkerLnt(double markerLnt) {
		this.markerLnt = markerLnt;
	}

	public double getMyLat() {
		return myLat;
	}

	public void setMyLat(double myLat) {
		this.myLat = myLat;
	}

	public double getMyLnt() {
		return myLnt;
	}

	public void setMyLnt(double myLnt) {
		this.myLnt = myLnt;
	}

	public String getUnit() {
		return unit;
	}

	public void setUnit(String unit) {
		this.unit = unit;
	}

	@Override
	public String toString() {
		return "DistanceInfo [markerLat=" + markerLat + ", markerLnt=" + markerLnt + ", myLat=" + myLat + ", myLnt="
				+ myLnt + ", unit=" + unit + "]";
	}
	
	public double getDistance() {
        double theta = markerLnt - myLnt;
        double dist = Math.sin(deg2rad(markerLat)) * Math.sin(deg2rad(myLat)) + Math.cos(deg2rad(markerLat)) * Math.cos(deg2rad(myLat)) * Math.cos(deg2rad(theta));
         
        dist = Math.acos(dist);
        dist = rad2deg(dist);
        dist = dist * 60 * 1.1515;
         
        if (unit == "kilometer") {
            dist = dist * 1.609344;
        } else if(unit == "meter"){
            dist = dist * 1609.344;
        }
        
        return dist;
    }
     
 
    // This function converts decimal degrees to radians
    private static double deg2rad(double deg) {
        return (deg * Math.PI / 180.0);
    }
     
    // This function converts radians to decimal degrees
    private static double rad2deg(double rad) {
        return (rad * 180 / Math.PI);
    }

}
