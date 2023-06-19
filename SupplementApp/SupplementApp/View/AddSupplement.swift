//
//  AddSupplement.swift
//  SupplementApp
//
//  Created by khloud on 21/11/1444 AH.
//

import SwiftUI
import FirebaseFirestore
import FirebaseCore

struct AddSupplement: View {
    
    @State var weekDays = ["Every Day", "Sunday", "Monday", "Tuesday","Wednesday", "Thursday","Friday","Saturday"]
    @State var selectedDays = "Every Day"
    @State var supplementTextField = ""
    @State var servingSize = ""
    
    let db = Firestore.firestore()
    
    var body: some View {
        NavigationStack{
          
            VStack{
                Form{
                    Text("Supplement Name")
                        .padding()
                        .font(.title3)
                    TextField("Enter Name", text: $supplementTextField)
                    
                    Text("Serving Size")
                        .padding()
                        .font(.title3)
                    TextField("Enter serving size ", text: $servingSize)
                    
                    
                    
                    VStack{
                        List{
                            Picker(selection: $selectedDays , label: Text("Days")){
                                ForEach(weekDays , id:\.self){
                                    Text($0)
                                }
                                
                            }
                        }
                    }
                    .padding()
                    
                }
                Button("Remindr me"){
                    let content = UNMutableNotificationContent()
                    content.title = "Time to take your "
                    content.subtitle = "Omega 3"
                    content.sound = UNNotificationSound.default
                    
                    let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
                    let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
                    UNUserNotificationCenter.current().add(request)
                    
                }
                
                Button ("Request Permission") {
                    UNUserNotificationCenter.current().requestAuthorization(options: [.alert,.badge,.sound]) { success, error in
                        if success{
                            print("All set!")
                        }else if let error = error{
                            print(error.localizedDescription)
                        }
                    }
                }
                Button ("Save"){
                    db.collection("Supplement")
                        .addDocument(data:
                    [
                        "Supplement Name": supplementTextField,
                        "Serving size": servingSize,
                        "Week Day": selectedDays
                    ])
                    {error in
                        if let error = error{
                            print("Error\(error)")
                        }else{
                            print("save data successfully")
                            supplementTextField = ""
                            servingSize = ""
                            selectedDays = "Every Day"
                        }
                    }
                    
                }.background(.orange)
                    .cornerRadius(10)
                    .foregroundColor(.white)
                    .font(.title)
                    .buttonStyle(.bordered)
                
            }
            
            .navigationTitle("Add Supplement")
            .padding(.bottom )
        }
    
   

    }
}

struct AddSupplement_Previews: PreviewProvider {
    static var previews: some View {
        AddSupplement()
    }
}
