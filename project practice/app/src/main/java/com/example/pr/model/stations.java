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
        this.loc = Loc;
    }

    public int getId() {
        return id;
    }

    public void setId(int Id) {
        id = Id;
    }
}
