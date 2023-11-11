package com.example.pr;

import android.annotation.SuppressLint;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Toast;

import androidx.appcompat.app.AppCompatActivity;

import com.example.pr.data.dbHandler;

public class sign_in extends AppCompatActivity {

    private EditText emailEditText;
    private EditText passwordEditText;
    private Button signinButton;
    private dbHandler databaseHandler;

    @SuppressLint("MissingInflatedId")
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.sign_in);

        // Initialize UI elements
        emailEditText = findViewById(R.id.emailTextSignIn);
        passwordEditText = findViewById(R.id.passwordtxtSignIn);
        signinButton = findViewById(R.id.signinbtn);

        // Initialize the database handler
        databaseHandler = new dbHandler(this);

        // Set OnClickListener for the signinButton
        signinButton.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                // Get user input
                String email = emailEditText.getText().toString().trim();
                String password = passwordEditText.getText().toString().trim();

                // Check if the email and password are not empty
                if (!email.isEmpty() && !password.isEmpty()) {
                    // Call the signInUser method from dbHandler
                    if (databaseHandler.signInUser(email, password)) {
                        // Sign-in successful
                        Toast.makeText(sign_in.this, "Sign-in successful", Toast.LENGTH_SHORT).show();
                        // You can navigate to the next activity or perform any other action here
                    } else {
                        // Sign-in failed
                        Toast.makeText(sign_in.this, "Invalid email or password", Toast.LENGTH_SHORT).show();
                    }
                } else {
                    // Handle case where email or password is empty
                    Toast.makeText(sign_in.this, "Please enter email and password", Toast.LENGTH_SHORT).show();
                }
            }
        });
    }
}
