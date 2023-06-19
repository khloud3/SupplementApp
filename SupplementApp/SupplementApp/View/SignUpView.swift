//
//  SignUpView.swift
//  SupplementApp
//
//  Created by khloud on 22/11/1444 AH.
//

import SwiftUI
import FirebaseCore
import FirebaseAuth



struct SignUpView: View {
    
    @State private var email: String = ""
    @State private var password: String = ""
    
    var body: some View {
        NavigationStack{
            ScrollView{
                VStack{
                   
                    Text("Email")
                        .font(.title3)
                        .padding()
                        .padding(.leading,-180)
                    
                    Divider()
                    TextField("Email", text: $email)
                        .keyboardType(.emailAddress)
                        .padding()
                    Divider()
                    
                    Text("Password")
                        .font(.title3)
                        .padding()
                        .padding(.leading,-180)
                    Divider()
                    SecureField("Password " , text: $password)
                        .keyboardType(.numberPad)
                        .padding()
                    Divider()
                    
                    NavigationLink(destination:AddSupplement()){
                        Button{
                            SignUp()
                        }label: {
                            Text("Sign up")
                                .frame(width: 200,height: 50)
                                .background(
                                    RoundedRectangle(cornerRadius: 10 ,style: .continuous)
                                        .fill(.linearGradient(colors: [.orange], startPoint: .top, endPoint: .bottomTrailing))
                                )
                                .foregroundColor(.white)
                        }.padding()
                    }
                    
                    
                }.padding(.top,100)
                    .navigationTitle("Sign Up")
            }
        }
    }
    
    func SignUp(){
        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
            if error != nil{
                print("Error\(error!)")
       
            }else{
                print("Sign in successfully ")
                email = ""
                password = ""
            }
        }
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
