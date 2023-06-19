//
//  SupplementViewModel.swift
//  SupplementApp
//
//  Created by khloud on 21/11/1444 AH.
//

import Foundation
import SwiftUI
import FirebaseFirestore

@MainActor class SupplementViewModel: ObservableObject {
    
    @Published var supplements = [Supplements]()
    let db = Firestore.firestore()
    
    func getData() {
        
        db.collection("Supplement").getDocuments() { (querySnapshot, error) in
            if let error = error  {
                print("Error \(error)")
                
            }else {
                
                for document in querySnapshot!.documents {
                    print("\(document.documentID) => \(document.data())")
                    let data = document.data()
                    let id = document.documentID
                    let supplementName = data["Supplement Name"] as? String ?? ""
                    let servingSize = data["Serving size"] as? String ?? ""
                    let weekDay = data["Week Days"] as? String ?? ""
                    let Supp = Supplements(
                        id: id ,
                        supplementName: supplementName,
                        servingSize: servingSize,
                        weekDay: weekDay)
                    print(Supplements.self)
                    self.supplements.append(Supp)
                }
            }
        }
        
    }
    
    
    func askPermission() {
        UNUserNotificationCenter.current ( ).requestAuthorization(options:
                                                                    [.alert, .badge, .sound]) { success, error in
            
            if success {
                
                print("Access granted!")
                
            } else if let error = error {
                
                print (error.localizedDescription)
            }
        }
    }
}

