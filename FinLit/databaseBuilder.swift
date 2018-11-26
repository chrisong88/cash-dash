//
//  databaseBuilder.swift
//  Financial Literacy
//
//  Created by Eric Hansen on 11/24/18.
//  Copyright © 2018 Eric Hansen. All rights reserved.
//

import SQLite3
import UIKit

class defnDatabase
{
    init()
    {
        var db: OpaquePointer?
        let dbURL = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false).appendingPathComponent("defnDatabase.sqlite")
        if sqlite3_open(dbURL.path, &db) != SQLITE_OK
        {
            print("Database could not be opened")
        }
        
        let createTableQuery = "CREATE TABLE IF NOT EXISTS definitions (id INTEGER PRIMARY KEY AUTOINCREMENT, word VARCHAR(255), definition TEXT)"
        
        if sqlite3_exec(db, createTableQuery, nil, nil, nil) != SQLITE_OK
        {
            print("Database could not be created")
        }
        
        var definitions: Array<String> = ["..."]
        for i in 0..<words.count
        {
            let fillTableQuery = "INSERT INTO definitions (word, definition) VALUES (\(words[i]), \(definitions[i]))"
            sqlite3_exec(db, fillTableQuery, nil, nil, nil)
        }
        
        
    }
}
