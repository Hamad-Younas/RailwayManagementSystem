package com.example.pr;

import android.annotation.SuppressLint;
import android.os.Bundle;
import android.util.Log;
import android.widget.ArrayAdapter;
import android.widget.ListView;

import androidx.appcompat.app.AppCompatActivity;

import com.example.pr.data.dbHandler;
import com.example.pr.model.users;

import java.util.ArrayList;
import java.util.List;

public class adminManageUser extends AppCompatActivity {
    ListView listView;

    @SuppressLint("MissingInflatedId")
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.admin_manage_users);

        dbHandler db = new dbHandler(adminManageUser.this);
        ArrayList<String> contacts = new ArrayList<>();
        listView = findViewById(R.id.listview);

        // Get all contacts
        List<users> allContacts = db.getAllUsers();
        for (users contact : allContacts) {
            Log.d("db", "\nId: " + contact.getId() + "\nFirst Name: " + contact.getFirstName() + "\n" +
                    "Last Name: " + contact.getLastName() + "\n" +
                    "Email: " + contact.getEmail() + "\n" +
                    "Password: " + contact.getPassword() + "\n" +
                    "Address: " + contact.getAddress() + "\n" +
                    "Phone Number: " + contact.getPhonenum() + "\n");

            contacts.add(contact.getFirstName() + " " + contact.getLastName() + " |" + contact.getEmail() + " |" + contact.getPhonenum() + "|");
        }

        ArrayAdapter<String> arrayAdapter = new ArrayAdapter<>(this, android.R.layout.simple_list_item_1, contacts);
        listView.setAdapter(arrayAdapter);
    }
}
