package com.example.pr.data;


import android.content.ContentValues;
import android.content.Context;
import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteOpenHelper;
import android.util.Log;

import com.example.pr.model.users;
import com.example.pr.params.param;

public class dbHandler extends SQLiteOpenHelper {

    public dbHandler(Context context) {
        super(context, param.DB_NAME, null, param.DB_VERSION);
    }

    @Override
    public void onCreate(SQLiteDatabase db) {
        String create = "CREATE TABLE " + param.TABLE_NAME + "("
                + param.KEY_ID + " INTEGER PRIMARY KEY, "
                + param.KEY_FIRST_NAME + " TEXT, "
                + param.KEY_LAST_NAME + " TEXT, "
                + param.KEY_EMAIL + " TEXT, "
                + param.KEY_PASSWORD + " TEXT, "
                + param.KEY_ADDRESS + " TEXT, "
                + param.KEY_PHONE + " TEXT"
                + ")";
        Log.d("db", "Query being run is: " + create);
        db.execSQL(create);
    }


    @Override
    public void onUpgrade(SQLiteDatabase db, int oldVersion, int newVersion) {
        // Handle database schema upgrades here if needed
    }

    public void addUser(users user) {
        SQLiteDatabase db = this.getWritableDatabase();
        ContentValues value = new ContentValues();
        value.put(param.KEY_FIRST_NAME, user.getFirstName());
        value.put(param.KEY_LAST_NAME,user.getLastName());
value.put(param.KEY_EMAIL,user.getEmail());
value.put(param.KEY_PASSWORD,user.getPassword());
value.put(param.KEY_ADDRESS,user.getAddress());
value.put(param.KEY_PHONE,user.getPhonenum());db.insert(param.TABLE_NAME,null,value); Log.d("db", "Successfully inserted");
db.close();
}}