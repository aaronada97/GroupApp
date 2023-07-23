//
//  LoginViewer.swift
//  LoginPage
//
//  Created by user242205 on 7/22/23.
//


import SwiftUI
import Firebase

struct LoginViewer: View {
    
    @Environment(\.presentationMode)var presentationMode
    
    @State private var isCreatedAccountViewPresented = false
    @State private var isPasswordCorrect: Bool = false
    @State private var showErrorAlert: Bool=false
    
    @State private var username: String = ""
    @State private var verificationResult: String = ""
    @State private var password: String = ""
    
    
    
    var body: some View {
        NavigationStack{
            ZStack{
                Image("ground").resizable().edgesIgnoringSafeArea(.all)
                VStack{
                    Text("Game Portal").font(.largeTitle).bold().foregroundColor(.white)
                    Spacer()
                    
                    
                    HStack{
                        Image(systemName: "username")
                            .foregroundColor(.white)
                        TextField("Username", text:$username)
                            .foregroundColor(.black).font(.title)
                            .fontWeight(.bold)
                        if(username.count != 0){
                            Image(systemName: username.isValidUsername() ? "checkmark" : "xmark")
                                .frame(width:30)
                                .fontWeight(.bold)
                                .foregroundColor(username.isValidUsername() ? .green : .red)
                        }
                    }.padding()
                        .overlay(RoundedRectangle(cornerRadius: 10)
                            .stroke(lineWidth: 2)
                            .foregroundColor(.white)
                        ).padding()
                    HStack{
                        Image(systemName: "lock").foregroundColor(.white)
                        TextField("Password",text:$password).foregroundColor(.white).font(.title).fontWeight(.bold)
                    }.padding()
                        .overlay(RoundedRectangle(cornerRadius: 10)
                            .stroke(lineWidth: 2)
                            .foregroundColor(.white)
                        ).padding()
                    Button(action:{
                        isCreatedAccountViewPresented.toggle()
                    }){
                        Text("Create Account")
                    }.foregroundColor(.white)
                        .font(.title)
                        .sheet(isPresented: $isCreatedAccountViewPresented){
                            NewAccountView()
                        }
                    Spacer()
                    Spacer()
                    
                    Button(action:{
                        Auth.auth().signIn(withEmail: username, password: password){ authResult, error in
                            
                            if let error = error{
                                print(error)
                                username = ""
                                password = ""
                                showErrorAlert.toggle()
                            }
                            
                            if let authResult = authResult{
                                isPasswordCorrect = true
                            }
                            
                        }
                    }){
                        Text("Login")
                            .foregroundColor(.white)
                            .font(.title)
                            .bold()
                            .frame(maxWidth:.infinity)
                            .padding()
                            .background(RoundedRectangle(cornerRadius: 25)
                                .fill(Color.black)
                                .foregroundColor(.black)
                                .opacity(0.5)
                            ).padding(.horizontal)
                            .alert(isPresented: $showErrorAlert, content:{
                                Alert(title:Text("Error login please check username and password"))
                            })
                    }
                    .padding()
                    .padding(.top)
                    }
                    
                }
            }
        }
    }


struct LoginViewer_Previews: PreviewProvider {
    static var previews: some View {
        LoginViewer()
    }
}
