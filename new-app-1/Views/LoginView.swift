//
//  LoginView.swift
//  new-app-1
//
//  Created by Mickale Saturre on 3/25/21.
//

import SwiftUI

struct LoginView: View {
    @State var color = Color.black.opacity(0.7)
    @State var email = ""
    @State var password = ""
    @State var visible = false
//    @Binding var show: Bool
    @State var alert = false
    @State var error = ""
    
    var body: some View {
        ZStack {
            ZStack(alignment: .topTrailing) {
                GeometryReader{_ in
                    VStack {
                        Image("logo")
                        Text("Login")
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(self.color)
                            .padding(.top, 35)
                        
                        TextField("Email", text: self.$email)
                            .autocapitalization(.none)
                            .padding()
                            .background(RoundedRectangle(cornerRadius: 4).stroke(self.email != "" ? Color(.blue) : self.color, lineWidth: 3))
                            .padding(.top, 25)
                        
                        HStack(spacing: 15) {
                            VStack {
                                if self.visible {
                                    TextField("Password", text: self.$password)
                                        .autocapitalization(.none)
                                } else {
                                    SecureField("Password", text: self.$password)
                                        .autocapitalization(.none)
                                }
                            }
                            
                            Button(action: {
                                self.visible.toggle()
                            }) {
                                Image(systemName: self.visible ? "eye.slash.fill" : "eye.fill")
                                    .foregroundColor(self.color)
                            }
                        }
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 4).stroke(self.email != "" ? Color("defaultColor") : self.color, lineWidth: 3))
                        .padding(.top, 25)
                        
                        HStack {
                            Spacer()
                            Button(action: {
                                
                            }) {
                                Text("Forget Password")
                                    .fontWeight(.bold)
                                    .foregroundColor(Color("defaultColor"))
                                    
                            }
                        }
                        .padding(.top, 20)
                        
                        Button(action: {
                            
                        }) {
                            Text("Login")
                                .foregroundColor(.white)
                                .padding(.vertical)
                                .frame(width: UIScreen.main.bounds.width - 50)
                        }
                        .background(Color("defaultColor"))
                        .cornerRadius(10)
                        .padding(.top, 25)
                    }
                    .padding(.horizontal, 25)
                    
                }
            }
            
            Button(action: {
                
            }) {
                Text("Register")
                    .fontWeight(.bold)
                    .foregroundColor(Color("defaultColor"))
            }
            .padding()
        }
        
        if (self.alert) {
            ErrorView()
        }
    }
}


struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
