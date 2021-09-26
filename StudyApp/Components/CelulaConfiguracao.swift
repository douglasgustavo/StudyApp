//
//  CelulaConfiguracao.swift
//  StudyApp
//
//  Created by Douglas Santos on 26/09/21.
//

import SwiftUI

struct CelulaConfiguracao: View {
    var txtOpcao: String = "Opção"
    var iconeOpcao: String = "heart.fill"
    var corOpcao: Color = Color.red
    
    var body: some View {
        ZStack{
            Color("backgroundCelula")
            NavigationLink {
                
            } label: {
                VStack{
                    
                    Spacer()
                    HStack{
                        ZStack{
                            Rectangle()
                                .fill(corOpcao)
                                .frame(width: 40, height: 40)
                                .cornerRadius(7)
                            
                            Image(systemName: iconeOpcao)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 20, height: 20)
                                .foregroundColor(Color("btnPrincipalTextColor"))
                                .shadow(color: Color("principalTextColor").opacity(0.5), radius: 3, x: 3, y: 3)
                        }
                        .padding(.leading)
                        
                        Text(txtOpcao)
                            .font(.system(size: 20, weight: .semibold))
                            .foregroundColor(Color("principalTextColor"))
                            .lineLimit(1)
                            .padding(.leading)
                        
                        Spacer()
                            Image(systemName: "control")
                                .rotationEffect(.degrees(90))
                                .foregroundColor(Color("secondaryTextColor"))
                                .font(.system(size: 20, weight: .bold))
                                .padding(.trailing)
                        }
                    
                    Spacer()
                    Rectangle()
                        .fill(Color("lineSeparator").opacity(0.3))
                        .frame(height: 2)
                        .padding(.leading)
                }
               
            }
        }
        .frame(height: 90)
    }
}

struct CelulaConfiguracao_Previews: PreviewProvider {
    static var previews: some View {
        CelulaConfiguracao()
    }
}
