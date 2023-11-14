package com.example.pr.model;

public class stations {
    private String StationName;
    private String loc;
    private int id;

    public stations(String stationName, String Loc) {
        StationName = stationName;
        loc = Loc;
    }

    // Default constructor
    public stations() {}

    public String getStationName() {
        return StationName;
    }

    public void setStationName(String stationName) {
        StationName = stationName;
    }

    public String getLoc() {
        return loc;
    }

    public void setLoc(String Loc) {
        this.loc = Loc;  // Fix: Assign the parameter Loc to the class variable loc
    }

    public int getId() {  // Fix: Change return type to int
        return id;
    }

    public void setId(int Id) {  // Fix: Change parameter type to int
        id = Id;
    }
}
