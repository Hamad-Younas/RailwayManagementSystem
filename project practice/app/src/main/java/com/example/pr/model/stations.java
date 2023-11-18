package com.example.pr.model;

public class stations {
    private String stationName;
    private String Loc;
    private int id;

    public stations(String stationName, String Loc) {
        this.stationName = stationName;
        this.Loc = Loc;
    }

    public stations() {}

    public String getStationName() {
        return stationName;
    }

    public void setStationName(String stationName) {
        this.stationName = stationName;
    }

    public String getLoc() {
        return Loc;
    }

    public void setLoc(String Loc) {
        this.Loc = Loc;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }
}
