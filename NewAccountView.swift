//
//  NewAccountView.swift
//  LoginPage
//
//  Created by user242205 on 7/22/23.
//

import SwiftUI
import FirebaseAuth

struct NewAccountView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    @State private var username: String = ""
    @State private var password: String = ""
    
    
    
    var body: some View {
        ZStack{
            Image("sky").resizable().edgesIgnoringSafeArea(.all)
            
            VStack{
                
                Text("New Account")
                    .font(.largeTitle)
                
                Spacer()
                
                HStack{
                    Image(systemName: "username")
                        .foregroundColor(.gray)
                    TextField("Username", text:$username)
                        .foregroundColor(.gray)
                        .font(.title)
                        .fontWeight(.bold)
                    if(username.count != 0){
                        Image(systemName: username.isValidUsername() ? "checkmark" : "xmark")
                            .frame(width:30)
                            .fontWeight(.bold)
                            .foregroundColor(username.isValidUsername() ? .green : .red)
                    }
                }.padding()
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(lineWidth: 2)
                            .foregroundColor(.black)
                    ).padding()
                HStack{
                    Image(systemName: "lock")
                        .foregroundColor(.gray)
                    TextField("Password", text:$password)
                        .foregroundColor(.gray)
                        .font(.title)
                        .fontWeight(.bold)
                }.padding()
                    .overlay(RoundedRectangle(cornerRadius: 10)
                        .stroke(lineWidth: 2)
                        .foregroundColor(.black)
                    ).padding()
                
                /*
                 
                 //ADD TO CREATE ACCOUNT BUTTON
                 Auth.auth().createUser(withEmail: email, password: password){ authResult, error in
                 
                    if let error = error{
                        print(error)
                        
                        return
                 
                 }
                 
                 if let authResult = authResult{
                        print(*\(authResult.user.uid)")
                    }
                 }
                 
                 
                 */
                
                
                
                
            }
        }
    }
}


struct NewAccountView_Previews: PreviewProvider {
    static var previews: some View {
        NewAccountView()
    }
}
