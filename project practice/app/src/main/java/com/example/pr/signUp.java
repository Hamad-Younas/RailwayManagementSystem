package com.example.pr;

import android.annotation.SuppressLint;
import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;

import androidx.appcompat.app.AppCompatActivity;

import com.example.pr.data.dbHandler;
import com.example.pr.model.users;

public class signUp extends AppCompatActivity {
    private Button button;
    private Button continuebtn;
    EditText firstname, lastname, email, password, address, phoneno;
    @SuppressLint("MissingInflatedId")
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_sign_up);

        firstname=findViewById(R.id.nameText);
        lastname=findViewById(R.id.lastName);

        email=findViewById(R.id.emailText);
        password=findViewById(R.id.passwordText);
        address=findViewById(R.id.addressText);
        phoneno=findViewById(R.id.phoneText);

        continuebtn=(Button)findViewById(R.id.continuebtn);
        continuebtn.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                dbHandler db=new dbHandler(signUp.this);
                users user=new users();
                user.setFirstName(firstname.getText().toString().trim());
                user.setLastName(lastname.getText().toString().trim());
                user.setEmail(email.getText().toString().trim());
                user.setPassword(password.getText().toString().trim());
                user.setAddress(address.getText().toString().trim());
                user.setPhonenum(phoneno.getText().toString().trim());
                db.addUser(user);

            }
        });






        button = (Button) findViewById(R.id.backbutton);
        button.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                openMain();
            }
        });
    }
        public void openMain() {
            Intent intent = new Intent(this, MainActivity.class);
            startActivity(intent);
        }

    }
