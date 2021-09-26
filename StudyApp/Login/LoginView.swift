//
//  LoginView.swift
//  StudyApp
//
//  Created by Douglas Santos on 26/09/21.
//

import SwiftUI

struct LoginView: View {
    var body: some View {
        NavigationView{
            ZStack{
                Color("backgroundPrincipal")
                    .ignoresSafeArea(.all)
                VStack {
                    Spacer()
                    HeaderLoginView()
                    Spacer()
                    LoginFormView()
                    Spacer()
                    BotoesLogin()
                        .padding(.bottom, 30)
                }
                .padding(.horizontal, 40)
            }
            .navigationBarHidden(true)
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
            .preferredColorScheme(.dark)
            
    }
}

struct BotoesLogin: View {
    var body: some View {
        VStack (spacing: 20){
            NavigationLink {
                HomeView()
            } label: {
                ZStack{
                        Rectangle()
                            .fill(Color("principal"))
                            .frame(width: 315, height: 58, alignment: .center)
                    Text("Entrar")
                        .foregroundColor(Color("principalTextColor"))
                        .font(.system(size: 20, weight: .semibold, design: .default))
                }
                .cornerRadius(15)
                .shadow(color: Color("principal").opacity(0.3),
                        radius: 5, x: 4, y: 4)
            }
            
            NavigationLink {
                
            } label: {
                Text("Esqueci a Senha")
                    .foregroundColor(Color("secondaryTextColor"))
                    .font(.system(size: 15, weight: .semibold, design: .default))
            }
            
            NavigationLink {
                
            } label: {
                ZStack{
                        Rectangle()
                            .fill(Color("secondary"))
                            .frame(width: 315, height: 58, alignment: .center)
                    Text("Criar uma Conta")
                        .foregroundColor(Color("terciaryTextColor"))
                        .font(.system(size: 20, weight: .semibold, design: .default))
                }
                .cornerRadius(15)
                .shadow(color: Color("secondary").opacity(0.3),
                        radius: 5, x: 4, y: 4)
                .padding(.top, 30)
            }
        }
    }
}

struct HeaderLoginView: View {
    var body: some View {
        HStack{
            VStack (alignment: .leading, spacing: 10){
                Color("principal")
                    .frame(width: 45, height: 43)
                    .cornerRadius(10)
                    .shadow(color: Color("principal").opacity(0.2), radius: 5, x: 3, y: 3)
                    .padding(.bottom, 30)
                
                Text("Bem Vindo(a)!")
                    .font(.system(size: 40, weight: .bold, design: .default))
                
                Text("Entre para continuar")
                    .font(.system(size: 30, weight: .semibold, design: .rounded))
                    .foregroundColor(Color("secondaryTextColor"))
            }
            Spacer()
        }
        
    }
}

struct LoginFormView: View {
    var icone: String = ""
    
    @State var email: String = ""
    @State var senha: String = ""
    
    var body: some View {
        VStack(spacing: 40) {
            TextInputField(
                tipo: .email,
                placeholder: "Seu e-mail...",
                iconeLateral: "person.fill",
                corFundoIcone: Color("iconeEmailBackgroundColor"),
                corIcone: Color("iconeEmailColor"),
                valorCampo: $email
            )
            
            TextInputField(
                tipo: .senha,
                placeholder: "Sua senha...",
                iconeLateral: "lock.fill",
                corFundoIcone: Color("iconeSenhaBackgroundColor"),
                corIcone: Color("iconeSenhaColor"),
                valorCampo: $senha
            )
        }
    }
}

struct TextInputField: View {
    var tipo: TipoInput
    var placeholder: String = ""
    var iconeLateral: String = "keyboard"
    var corFundoIcone: Color = Color(hex: "#EDF1FA")
    var corIcone: Color = Color(hex: "#899A96")
    
    @Binding var valorCampo: String
    
        init(
            tipo: TipoInput = .texto,
            placeholder: String = "",
            iconeLateral: String = "",
            corFundoIcone: Color = Color(hex: "#EDF1FA"),
            corIcone: Color = Color(hex: "#899A96"),
            valorCampo: Binding<String>
        ) {
            self.tipo = tipo
            self.placeholder = placeholder
            self.iconeLateral = iconeLateral
            self.corFundoIcone = corFundoIcone
            self.corIcone = corIcone
            self._valorCampo = valorCampo
        }
    
    @State var mostrandoSenha: Bool = false
    
    var body: some View {
        HStack{
            if iconeLateral != "" {
                ZStack{
                    Rectangle()
                        .fill(corFundoIcone)
                        .frame(width: 48, height: 48)
                        .cornerRadius(10)
                    Image(systemName: iconeLateral)
                        .foregroundColor(corIcone)
                }
                .padding(.trailing, 5)
            }
            
            VStack{
                switch tipo {
                case .texto:
                    TextField(placeholder, text: $valorCampo)
                        .foregroundColor(Color("secondaryTextColor"))
                        .font(.system(size: 20, weight: .semibold, design: .default))
                case .email:
                        TextField(placeholder, text: $valorCampo)
                            .foregroundColor(Color("secondaryTextColor"))
                            .font(.system(size: 20, weight: .semibold, design: .default))
                            .textContentType(.emailAddress)
                case .senha:
                HStack{
                    if mostrandoSenha {
                        TextField(placeholder, text: $valorCampo)
                            .foregroundColor(Color("secondaryTextColor"))
                            .font(.system(size: 20, weight: .semibold, design: .default))
                    } else {
                        SecureField(placeholder, text: $valorCampo)
                            .foregroundColor(Color("secondaryTextColor"))
                            .font(.system(size: 20, weight: .semibold, design: .default))
                    }
                    Button {
                        self.mostrandoSenha.toggle()
                    } label: {
                        Image(systemName: mostrandoSenha ? "eye.slash.fill" : "eye.fill")
                            .foregroundColor(Color("secondaryTextColor"))
                            .padding(.bottom, 3)
                    }
                }
                case .numero:
                    TextField(placeholder, text: $valorCampo)
                        .foregroundColor(Color("secondaryTextColor"))
                        .font(.system(size: 20, weight: .semibold, design: .default))
                        .textContentType(.telephoneNumber)
                }
                Rectangle()
                    .frame(height: 1.5, alignment: .bottom)
                    .foregroundColor(Color("TextInputUnderline").opacity(0.2))
            }
        }
    }
}
