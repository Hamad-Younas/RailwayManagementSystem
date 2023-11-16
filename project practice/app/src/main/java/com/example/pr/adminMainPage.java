package com.example.pr;

import android.annotation.SuppressLint;
import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;

import androidx.appcompat.app.AppCompatActivity;

public class adminMainPage extends AppCompatActivity {
    Button Stationbutton;
    Button manageuser;
    @SuppressLint(value = "MissingInflatedId")
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.admin_mainpage);
        Stationbutton= findViewById(R.id.stationbtn);


        Stationbutton.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                // Open MainActivity when the button is pressed
                openStation();
            }
        });



        manageuser= findViewById(R.id.manageuserbtn);


        manageuser.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                // Open MainActivity when the button is pressed
                ManageUser();
            }
        });

    };
    private void openStation() {
        Intent intent = new Intent(this, addStation.class);
        startActivity(intent);
        // Optionally, finish the current activity to remove it from the back stack
        finish();
    }
    private void ManageUser() {
        Intent intent = new Intent(this, adminManageUser.class);
        startActivity(intent);
        // Optionally, finish the current activity to remove it from the back stack
        finish();
    }
}
