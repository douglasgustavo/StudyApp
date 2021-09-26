//
//  CelulaLista.swift
//  StudyApp
//
//  Created by Douglas Santos on 26/09/21.
//

import SwiftUI

struct CelulaPerfilPrincipal: View {
    var nome: String = "Nome pessoa"
    var telefone: String = "Telefone"
    var email: String = "Email"
    var foto: String = "profile"
    
    var body: some View {
        ZStack{
            Color("backgroundCelula")
            NavigationLink {
                ConfiguracoesView()
            } label: {
                VStack{
                    Rectangle()
                        .fill(Color("lineSeparator").opacity(0.3))
                        .frame(height: 1)
                    
                    Spacer()
                    HStack{
                        Image(foto)
                            .resizable()
                            .scaledToFill()
                            .clipShape(Circle())
                            .frame(width: 100, height: 100)
                            .padding(.leading)
                        
                        VStack (alignment: .leading){
                            Text(nome)
                                .font(.system(size: 20, weight: .bold))
                                .foregroundColor(Color("principalTextColor"))
                                .lineLimit(1)
                            Spacer()
                            Text(telefone)
                                .font(.system(size: 20, weight: .regular))
                                .foregroundColor(Color("principalTextColor"))
                                .lineLimit(1)
                            Spacer()
                            Text(email)
                                .font(.system(size: 20, weight: .regular))
                                .foregroundColor(Color("principalTextColor"))
                                .lineLimit(1)
                        }
                        .padding(.leading, 10)
                        .frame(height: 80)
                        Spacer()
                        }
                    Spacer()
                    Rectangle()
                        .fill(Color("lineSeparator").opacity(0.3))
                        .frame(height: 1)
                }
               
            }
        }
        .frame(height: 120)
    }
}

struct CelulaLista_Previews: PreviewProvider {
    static var previews: some View {
        CelulaPerfilPrincipal()
            .preferredColorScheme(.dark)
    }
}
