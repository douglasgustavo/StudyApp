//
//  NavBar.swift
//  StudyApp
//
//  Created by Douglas Santos on 26/09/21.
//

import SwiftUI
import SwiftUIVisualEffects

struct NavBar: View {
    
    @Binding var menuSelecionado: Int
    
    var itensMenu: [String] = [
        "house.fill",
        "heart.fill",
        "text.bubble.fill",
        "gearshape.circle.fill"
    ]
    
    var body: some View {
        ZStack(alignment: .top){
            
            Rectangle()
                  .vibrancyEffect()
                  .vibrancyEffectStyle(.tertiaryFill)
                  .background(BlurEffect())
                  .clipShape(RoundedSolid(radius: 50, corners: [.topRight, .topLeft]))
                  .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height / 7)
            
            HStack{
                ForEach(0..<itensMenu.count, id: \.self){ pos in
                    Spacer()
                    Button {
                        menuSelecionado = pos
                    } label: {
                        ZStack{
                            Circle()
                                .foregroundColor(self.menuSelecionado == pos ? Color("principal") : Color(""))
                                .frame(width: 75, height: 75)
                            
                            Image(systemName: itensMenu[pos])
                                .font(.system(size: 30))
                                .foregroundColor(self.menuSelecionado == pos ? Color.white : Color("btnUnselectedNavbar"))
                        }
                    }
                    Spacer()
                }
            }
            .padding(.top)
            
        }
        .edgesIgnoringSafeArea(.bottom)
    }
}
