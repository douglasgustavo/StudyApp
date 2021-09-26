//
//  TextRectangle.swift
//  StudyApp
//
//  Created by Douglas Santos on 26/09/21.
//

import SwiftUI

struct BtnTextRectangle: View {
    var textoBotao: String = "👄  Texto Exemplo"
    var corTextoBotao: Color = Color("principalTextColor")
    var corBackgroundBotao: Color = Color("btnPrincipalColor")
    
    var body: some View {
        HStack{
            Text(textoBotao)
                .font(.system(size: 17 ,weight: .semibold))
                .foregroundColor(corTextoBotao)
                .padding(18)
        }
        .background(corBackgroundBotao)
        .cornerRadius(15)
        .shadow(color: corBackgroundBotao.opacity(0.3), radius: 5, x: 4, y: 4)
    }
}

struct TextRectangle_Previews: PreviewProvider {
    static var previews: some View {
        BtnTextRectangle()
    }
}
