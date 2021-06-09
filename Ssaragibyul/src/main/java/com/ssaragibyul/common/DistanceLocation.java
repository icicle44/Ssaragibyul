package com.ssaragibyul.common;

public class DistanceLocation {
    public static DistanceInfo getDistance(double markerLat, double markerLnt, double myLat, double myLnt, String unit) {
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
        DistanceInfo di = new DistanceInfo(markerLat, markerLnt, myLat, myLnt, unit);
        return di;
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
