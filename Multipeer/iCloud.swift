//
//  iCloud.swift
//  Multipeer
//
//  Created by Luciano Gucciardo on 07/03/2018.
//  Copyright © 2018 Luciano Gucciardo. All rights reserved.
//

import Foundation
import CloudKit

class Sync {

    static let shared = Sync()
    var receivedValue:Double = 0
    let publicDatabase = CKContainer.default().publicCloudDatabase
    var retrievedRecords : [CKRecord] = []
    var selectedRecord : CKRecord?
//    var refresh: UIRefreshControl!
    
    func startLoadData() -> Int {
        let avgValue = 0
        let allPredicate = NSPredicate(value: true)
        let query = CKQuery(recordType: "Value", predicate: allPredicate)
        publicDatabase.perform(query, inZoneWith: nil) { (records, error) in
            if (error != nil) {
                print(error ?? "")
            }
            else{
//                save to the variable
                self.retrievedRecords = records ?? []
//                process the records here to extract values
                DispatchQueue.main.async {
                    for record in records! {
                        print(record.object(forKey: "Value") as? Int64 ?? 0 )
                    }
                }
            }
        }
        
        return avgValue
    }
    
    func send(data: Int) {
        let record = CKRecord(recordType: "Value")
        record.setObject(data as CKRecordValue, forKey: "Value")
        publicDatabase.save(record) { (record, error) in
            if (error != nil) {
                print(error ?? "")
            }
            else{
                DispatchQueue.main.async {
                    print(record!)
                }
            }
        }
    }
    func deleteAll() {
        let userID = UserDefaults.shared.userId
        let predicate = NSPredicate(format: "createdBy == \(userID)", argumentArray: [userID])
        let query = CKQuery(recordType: "Value", predicate: predicate)
        publicDatabase.perform(query, inZoneWith: nil) { (records, error) in
            for record in records! {
                print(record)
//                self.publicDatabase.delete(withRecordID: record.recordID, completionHandler: { ( record, error) in
//                    print("record deleted")
//                })
            }
        }
    }
}


