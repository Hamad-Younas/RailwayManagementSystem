package com.example.pr;

import android.annotation.SuppressLint;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;

import androidx.appcompat.app.AppCompatActivity;

import com.example.pr.data.dbHandler;
import com.example.pr.model.stations;

public class addStation extends AppCompatActivity {
    EditText stationName, location;
    Button button;

    @SuppressLint("MissingInflatedId")
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.add_station);

        stationName = findViewById(R.id.stationnametxtstation);
        location = findViewById(R.id.locationtxtstation);

        button = findViewById(R.id.addbtnstation);
        button.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                dbHandler db = new dbHandler(addStation.this);
                stations station = new stations();
                station.setStationName(stationName.getText().toString().trim());
                station.setLoc(location.getText().toString().trim());
                db.addStation(station);
            }
        });
    }
}
