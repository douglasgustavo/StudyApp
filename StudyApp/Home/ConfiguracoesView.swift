//
//  ConfiguracoesView.swift
//  StudyApp
//
//  Created by Douglas Santos on 26/09/21.
//

import SwiftUI

struct ConfiguracoesView: View {
    
    var listaOpcoesPrincipais: [Opcao] = [
        Opcao(txtOpcao: "Minhas Compras", iconeOpcao: "bag.fill", corOpcao: Color(hex: "FF575F")),
        Opcao(txtOpcao: "Meus Cartões", iconeOpcao: "creditcard.fill", corOpcao: Color(hex: "FFC542")),
        Opcao(txtOpcao: "Meus Endereços", iconeOpcao: "globe.americas.fill", corOpcao: Color(hex: "3DD598")),
    ]
    
    var segundaSecaoOpcoes: [Opcao] = [
        Opcao(txtOpcao: "Opção 1", iconeOpcao: "square.and.arrow.down.on.square.fill", corOpcao: Color(hex: "FF575F")),
        Opcao(txtOpcao: "Opção 2", iconeOpcao: "folder.fill.badge.plus", corOpcao: Color(hex: "FFC542")),
        Opcao(txtOpcao: "Opção 3", iconeOpcao: "opticaldiscdrive.fill", corOpcao: Color(hex: "3DD598")),
        Opcao(txtOpcao: "Opção 4", iconeOpcao: "arrow.up.bin.fill", corOpcao: Color(hex: "FF575F")),
        Opcao(txtOpcao: "Opção 5", iconeOpcao: "doc.on.doc.fill", corOpcao: Color(hex: "FFC542"))
    ]
    
    var terceiraSecaoOpcoes: [Opcao] = [
        Opcao(txtOpcao: "Opção 6", iconeOpcao: "book.fill", corOpcao: Color(hex: "FF575F")),
        Opcao(txtOpcao: "Opção 7", iconeOpcao: "book.closed.fill", corOpcao: Color(hex: "FFC542")),
        Opcao(txtOpcao: "Opção 8", iconeOpcao: "square.text.square.fill", corOpcao: Color(hex: "3DD598")),
    ]
    
    var body: some View {
        ZStack{
            ScrollView(.vertical, showsIndicators: false){
                
                VStack(spacing: 0){
                    CelulaPerfilPrincipal()
                    Rectangle()
                        .fill(Color(""))
                        .frame(height: 25)
                    
                    ForEach(0..<listaOpcoesPrincipais.count, id: \.self) { item in
                        CelulaConfiguracao(txtOpcao: listaOpcoesPrincipais[item].txtOpcao,
                                           iconeOpcao: listaOpcoesPrincipais[item].iconeOpcao,
                                           corOpcao: listaOpcoesPrincipais[item].corOpcao)
                    }
                    Rectangle()
                        .fill(Color(""))
                        .frame(height: 25)
                    ForEach(0..<segundaSecaoOpcoes.count, id: \.self) { item in
                        CelulaConfiguracao(txtOpcao: segundaSecaoOpcoes[item].txtOpcao,
                                           iconeOpcao: segundaSecaoOpcoes[item].iconeOpcao,
                                           corOpcao: segundaSecaoOpcoes[item].corOpcao)
                    }
                    Rectangle()
                        .fill(Color(""))
                        .frame(height: 25)
                    ForEach(0..<terceiraSecaoOpcoes.count, id: \.self) { item in
                        CelulaConfiguracao(txtOpcao: terceiraSecaoOpcoes[item].txtOpcao,
                                           iconeOpcao: terceiraSecaoOpcoes[item].iconeOpcao,
                                           corOpcao: terceiraSecaoOpcoes[item].corOpcao)
                    }
                }
            }
        }
    }
}

struct ConfiguracoesView_Previews: PreviewProvider {
    static var previews: some View {
        ConfiguracoesView()
            .preferredColorScheme(.dark)
    }
}

struct Opcao {
    var id: UUID = UUID()
    var txtOpcao: String
    var iconeOpcao: String
    var corOpcao: Color
}
