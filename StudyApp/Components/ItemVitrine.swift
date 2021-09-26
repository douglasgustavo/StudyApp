//
//  ItemVitrine.swift
//  StudyApp
//
//  Created by Douglas Santos on 26/09/21.
//

import SwiftUI

struct ItemVitrine: View {
    var nomeImagem: String = "img6"
    var tituloAnuncio: String = "Titulo"
    var valorAnuncio: String = "Valor"
    var tipoItem: TipoItemVitrine = .grande
    
    @State var width: CGFloat = 0
    @State var height: CGFloat = 0
    @State var radius: CGFloat = 0
    @State var tamanhoFonte: CGFloat = 0
    @State var favorito: Bool = false
    
    var backgroundShadow: Color = Color.black
    var corTextoTitulo: Color = Color("secondaryTextColor")
    
    var body: some View {
        VStack (alignment: .leading, spacing: 6){
            ZStack{
                Image(nomeImagem)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: width, height: height)
                    .clipShape(RoundedRectangle(cornerRadius: radius))
                    .shadow(color: backgroundShadow.opacity(0.2), radius: 10, x: 5, y: 10)
                    .padding(.bottom, 6)
                
                HStack{
                    Spacer()
                    VStack{
                        Spacer()
                        Button {
                            withAnimation {
                                self.favorito.toggle()
                            }
                        } label: {
                            ZStack{
                                Circle()
                                    .frame(width: 45, height: 45)
                                    .foregroundColor(Color("principal"))
                                    .shadow(color: Color.black.opacity(0.4), radius: 4, x: 3, y: 3)
                                
                                Image(systemName: favorito ? "heart.fill" : "heart" )
                                    .font(.system(size: 26))
                                    .foregroundColor(favorito ? Color(hex: "FF464F"): Color.white)
                                    .shadow(color: favorito ? Color.black.opacity(0.25) : Color(""), radius: 2, x: 2, y: 3)
                            }
                        }
                        Spacer()
                            .frame(width: 0, height: tipoItem == .grande ? 30 : tipoItem == .medio ? 20 : 15)
                    }
                    Spacer()
                        .frame(width: tipoItem == .grande ? 30 : tipoItem == .medio ? 20 : 15, height: 0)
                }
                .frame(width: width, height: height)
            }
            
            
            Text(tituloAnuncio)
                .lineLimit(1)
                .font(.system(size: tamanhoFonte, weight: .semibold, design: .rounded))
                
                .foregroundColor(corTextoTitulo)
                .frame(minWidth: 0, maxWidth: self.width, alignment: .leading)
            
            Text(valorAnuncio)
                .lineLimit(1)
                .font(.system(size: tamanhoFonte * 1.35, weight: .bold, design: .default))
                .foregroundColor(corTextoTitulo)
                .frame(minWidth: 0, maxWidth: self.width, alignment: .leading)
        }
        .padding()
        .onAppear(perform: verificaTamanho)
    }
    
    func verificaTamanho(){
        switch tipoItem {
        case .padrao:
            self.width = 170
            self.height = 230
            self.radius = 25
            self.tamanhoFonte = 15
        case .medio:
            self.width = 319
            self.height = 210
            self.radius = 35
            self.tamanhoFonte = 15
        case .grande:
            self.width = UIScreen.main.bounds.width
            self.height = 400
            self.radius = 45
            self.tamanhoFonte = 23
        }
        
        if UIScreen.main.bounds.width <= 640 {
            self.width = self.width * 0.85
            self.height = self.height * 0.85
            
        } else if (UIScreen.main.bounds.width >= 641 && UIScreen.main.bounds.width >= 750) {
            self.width = self.width * 0.95
            self.height = self.height * 0.95
        } else {
            self.width = self.width * 1.15
        }
    }
}

struct ItemVitrine_Previews: PreviewProvider {
    static var previews: some View {
        ItemVitrine()
            .preferredColorScheme(.dark)
    }
}
