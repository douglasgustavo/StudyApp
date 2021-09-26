//
//  ItemListaVitrine.swift
//  StudyApp
//
//  Created by Douglas Santos on 26/09/21.
//

import SwiftUI

struct ItemListaVitrine: View {
    var imagem: String = "img1"
    var titulo: String = "Teste"
    var valor: String = "R$ 100"
    
    @State var tamanhoNum: Int = 0
    @State var parcelasNum: Int = 0
    
    
    var tamanhos: [String] = [
        "P",
        "M",
        "G",
        "GG",
        "XG"
    ]
    
    var quantidade: [String] = [
        "1x",
        "2x",
        "3x",
        "6x",
        "9x",
        "12x"
    ]
    
    func alteraTamanho(){
        if self.tamanhoNum == 4 {
            tamanhoNum = 0
        } else {
            tamanhoNum += 1
        }
    }
    
    func alteraParcelas(){
        if self.parcelasNum == 5 {
            parcelasNum = 0
        } else {
            parcelasNum += 1
        }
    }
    
    var body: some View {
        HStack{
            Image(imagem)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 100, height: 120, alignment: .center)
                .clipShape(RoundedRectangle(cornerRadius: 25))
            
            VStack {
                Spacer()
                Text(titulo)
                    .lineLimit(2)
                    .font(.system(size: 18, weight: .semibold, design: .default))
                    .frame(maxWidth: UIScreen.main.bounds.width, alignment: .leading)
                    .foregroundColor(Color("principalTextColor"))
                Spacer()
                Text(valor)
                    .lineLimit(2)
                    .font(.system(size: 18, weight: .bold, design: .default))
                    .frame(maxWidth: UIScreen.main.bounds.width, alignment: .leading)
                    .foregroundColor(Color("principalTextColor"))
                Spacer()
            }
            .frame(height: 120)
            .padding(.trailing)
            
            VStack{
                
                
                Button {
                    alteraParcelas()
                } label: {
                    ZStack{
                        Circle()
                            .strokeBorder(Color("terciaryTextColor").opacity(0.5), lineWidth: 2.5)
                            .frame(width: 35, height: 35)
                            
                        Text(quantidade[parcelasNum])
                            .font(.system(size: 13, weight: .bold, design: .default))
                            .foregroundColor(Color("secondary"))
                    }
                }

                Button {
                    alteraTamanho()
                } label: {
                    ZStack{
                        Circle()
                            .fill(Color("terciaryTextColor"))
                            .frame(width: 35, height: 35)
                            
                        Text(tamanhos[self.tamanhoNum])
                            .font(.system(size: 15, weight: .bold, design: .default))
                            .foregroundColor(Color("principalTextColor"))
                    }
                }
                
            }
        }
        .padding(.vertical)
    }
        
}

struct ItemListaVitrine_Previews: PreviewProvider {
    static var previews: some View {
        ItemListaVitrine()
    }
}
