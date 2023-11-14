package com.example.pr;

import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;

import androidx.appcompat.app.AppCompatActivity;

public class userMainPage extends AppCompatActivity {

    // Your existing declarations

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.user_mainpage);


        Button logoutButton = findViewById(R.id.logoutbtnsignin);


        logoutButton.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                // Open MainActivity when the button is pressed
                openMainActivity();
            }
        });
    }

    // Add this method to open MainActivity
    private void openMainActivity() {
        Intent intent = new Intent(this, MainActivity.class);
        startActivity(intent);
        // Optionally, finish the current activity to remove it from the back stack
        finish();
    }
}
