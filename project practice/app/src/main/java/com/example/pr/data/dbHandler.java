package com.example.pr.data;

import android.content.ContentValues;
import android.content.Context;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteOpenHelper;
import android.util.Log;

import com.example.pr.model.stations;
import com.example.pr.model.users;
import com.example.pr.params.param;

import java.util.ArrayList;
import java.util.List;

public class dbHandler extends SQLiteOpenHelper {

    public dbHandler(Context context) {
        super(context, param.DB_NAME, null, param.DB_VERSION);
    }

    @Override
    public void onCreate(SQLiteDatabase db) {
        Log.d("db", "onCreate method called");

        String createUserTable = "CREATE TABLE " + param.TABLE_NAME + "("
                + param.KEY_ID + " INTEGER PRIMARY KEY, "
                + param.KEY_FIRST_NAME + " TEXT, "
                + param.KEY_LAST_NAME + " TEXT, "
                + param.KEY_EMAIL + " TEXT, "
                + param.KEY_PASSWORD + " TEXT, "
                + param.KEY_ADDRESS + " TEXT, "
                + param.KEY_PHONE + " TEXT"
                + ")";
        db.execSQL(createUserTable);

        String createStationTable = "CREATE TABLE " + param.TABLE_NAME_STATIONS + "("
                + param.KEY_STATION_ID + " INTEGER PRIMARY KEY, "
                + param.KEY_STATION_NAME + " TEXT, "
                + param.KEY_LOCATION + " TEXT"
                + ")";
        db.execSQL(createStationTable);

        Log.d("db", "Tables created successfully");
    }

    @Override
    public void onUpgrade(SQLiteDatabase db, int oldVersion, int newVersion) {
        // Handle database schema upgrades here if needed

    }

    // Add a user to the database
    public void addUser(users user) {
        SQLiteDatabase db = this.getWritableDatabase();
        ContentValues values = new ContentValues();
        values.put(param.KEY_FIRST_NAME, user.getFirstName());
        values.put(param.KEY_LAST_NAME, user.getLastName());
        values.put(param.KEY_EMAIL, user.getEmail());
        values.put(param.KEY_PASSWORD, user.getPassword());
        values.put(param.KEY_ADDRESS, user.getAddress());
        values.put(param.KEY_PHONE, user.getPhonenum());
        db.insert(param.TABLE_NAME, null, values);
        Log.d("db", "User inserted successfully");
        db.close();
    }

    // Sign in a user and check if the credentials are valid
    public boolean signInUser(String email, String password) {
        SQLiteDatabase db = this.getReadableDatabase();
        String[] columns = {param.KEY_ID};
        String selection = param.KEY_EMAIL + " = ?" + " AND " + param.KEY_PASSWORD + " = ?";
        String[] selectionArgs = {email, password};
        Cursor cursor = db.query(
                param.TABLE_NAME,
                columns,
                selection,
                selectionArgs,
                null,
                null,
                null
        );
        boolean signInSuccess = cursor != null && cursor.moveToFirst();
        if (cursor != null) {
            cursor.close();
        }
        db.close();
        return signInSuccess;
    }

    // Add a station to the database
    public void addStation(stations station) {
        SQLiteDatabase db = this.getWritableDatabase();
        ContentValues values = new ContentValues();
        values.put(param.KEY_STATION_NAME, station.getStationName());
        values.put(param.KEY_LOCATION, station.getLoc());

        try {
            db.insert(param.TABLE_NAME_STATIONS, null, values);
            Log.d("db", "Station inserted successfully");
        } catch (Exception e) {
            Log.e("db", "Error inserting station: " + e.getMessage());
        } finally {
            db.close();
        }
    }
    public List<users> getAllUsers(){
        List<users> contactList = new ArrayList<>();
        SQLiteDatabase db = this.getReadableDatabase();

        // Generate the query to read from the database
        String select = "SELECT * FROM " + param.TABLE_NAME;
        Cursor cursor = db.rawQuery(select, null);

        //Loop through now
        if(cursor.moveToFirst()){
            do{
                users contact = new users();
                contact.setId(Integer.parseInt(cursor.getString(0)));
                contact.setFirstName(cursor.getString(1));
                contact.setLastName(cursor.getString(2));
                contact.setEmail(cursor.getString(3));
                contact.setPassword(cursor.getString(4));
                contact.setAddress(cursor.getString(5));
                contact.setPhonenum(cursor.getString(6));
                contactList.add(contact);
            }while(cursor.moveToNext());
        }
        return contactList;
    }
    // Add this method to your dbHandler class
// Add this method to your dbHandler class
//    public void deleteUser(users user) {
//        SQLiteDatabase db = this.getWritableDatabase();
//        try {
//            db.delete(param.TABLE_NAME, param.KEY_ID + " = ?", new String[]{String.valueOf(user.getId())});
//        } catch (Exception e) {
//            Log.e("db", "Error deleting user: " + e.getMessage());
//        } finally {
//            db.close();
//        }
//    }
//



}
