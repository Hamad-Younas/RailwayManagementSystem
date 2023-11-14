package com.example.pr.data;


import android.content.ContentValues;
import android.content.Context;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteOpenHelper;
import android.util.Log;

import com.example.pr.model.users;
import com.example.pr.params.param;
import com.example.pr.model.stations;
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


        String createStationTable = "CREATE TABLE " + param.TABLE_NAME_STATIONS + "("
                + param.KEY_STATION_ID + " INTEGER PRIMARY KEY, "
                + param.KEY_STATION_NAME + " TEXT, "
                + param.KEY_LOCATION + " TEXT"
                + ")";
        db.execSQL(createStationTable);

        Log.d("db", "Station created successfully");
    }


    @Override
    public void onUpgrade(SQLiteDatabase db, int oldVersion, int newVersion) {
        // Handle database schema upgrades here if needed
    }
    public boolean signInUser(String email, String password) {
        SQLiteDatabase db = this.getReadableDatabase();

        // Define the columns you want to retrieve
        String[] columns = {param.KEY_ID};

        // Define the selection criteria
        String selection = param.KEY_EMAIL + " = ?" + " AND " + param.KEY_PASSWORD + " = ?";

        // Define the selection arguments
        String[] selectionArgs = {email, password};

        // Query the database
        Cursor cursor = db.query(
                param.TABLE_NAME,  // Table to query
                columns,            // Columns to return
                selection,          // Columns for the WHERE clause
                selectionArgs,      // Values for the WHERE clause
                null,               // Don't group the rows
                null,               // Don't filter by row groups
                null                // The sort order
        );

        // Check if the cursor has a valid row (user found)
        boolean signInSuccess = cursor != null && cursor.moveToFirst();

        // Close the cursor and the database
        if (cursor != null) {
            cursor.close();
        }
        db.close();

        return signInSuccess;
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



}
    public void addStation(stations station) {
        SQLiteDatabase db = this.getWritableDatabase();
        ContentValues values = new ContentValues();
        values.put(param.KEY_STATION_NAME, station.getStationName());
        values.put(param.KEY_LOCATION, station.getLoc());

        db.insert(param.TABLE_NAME_STATIONS, null, values);
        Log.d("db", "Station inserted successfully");
        db.close();
    }
}