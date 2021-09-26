//
//  HomeView.swift
//  StudyApp
//
//  Created by Douglas Santos on 26/09/21.
//

import SwiftUI

struct HomeView: View {
    @State var menuSelecionado: Int = 0
    
    init() {
            UINavigationBar.appearance().backgroundColor = UIColor(named: "backgroundPrincipal")
            UINavigationBar.appearance().barTintColor = UIColor(named: "backgroundPrincipal")
            UINavigationBar.appearance().isOpaque = true
        }
    
    var body: some View {
        
        ZStack{
            NavigationView{
                switch menuSelecionado {
                case 0:
                    ScrollView(.vertical, showsIndicators: false){
                        ListaBotoesHeader()
                        VitrinePrincipal()
                    }
                case 1:
                    ScrollView(.vertical, showsIndicators: true) {
                        PreferidosView()
                    }
                case 2:
                    ScrollView(.vertical, showsIndicators: true) {
                        ChatView()
                    }
                case 3:
                    ScrollView(.vertical, showsIndicators: true) {
                        ConfiguracoesView()
                            .padding(.top, 30)
                            .padding(.bottom, UIScreen.main.bounds.height / 7)
                            .navigationBarHidden(true)
                    }
                    .navigationTitle("Configurações")
                    .navigationBarHidden(false)
                    .background(Color("backgroundPrincipal"))
                    
                default:
                    ScrollView(.vertical, showsIndicators: false){
                        ListaBotoesHeader()
                        VitrinePrincipal()
                    }
                }
            }
            
            VStack{
                Spacer()
                NavBar(menuSelecionado: $menuSelecionado)
            }
            .edgesIgnoringSafeArea(.all)
            
        }
        .navigationBarHidden(true)
    }
    
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .preferredColorScheme(.dark)
    }
}

struct ListaBotoesHeader: View {
    @State var botaoSelecionado: Int = 0
    
    var listaBotoes = [
        "Todos",
        "👨  Masculino",
        "👩  Feminino",
        "🧒  Infantil",
        "Atacado"
    ]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            
            HStack{
                ForEach(0..<listaBotoes.count, id: \.self) {item in
                    Button {
                        self.botaoSelecionado = item
                    } label: {
                        BtnTextRectangle(
                            textoBotao: listaBotoes[item],
                            corTextoBotao: botaoSelecionado == item ? Color("btnPrincipalTextColor") : Color("btnPrincipalTextUnselectColor"),
                            corBackgroundBotao: botaoSelecionado == item ? Color("btnPrincipalColor") : Color("btnPrincipalUnselectColor")
                        )
                    }
                }
            }
            .padding()
            
        }
    }
}

struct VitrinePrincipal: View {
    var body: some View {
        VStack (alignment: .center){
            HStack{
                Text("Em Promoção")
                    .font(.system(size: 35, weight: .bold, design: .default))
                    .padding(.leading)
                Spacer()
            }
            .frame(width: UIScreen.main.bounds.width)
            
            
            HStack{
                ItemVitrine(
                    nomeImagem: "img1",
                    tituloAnuncio: "Blusa Feminina",
                    valorAnuncio: "R$ 100,00",
                    tipoItem: .padrao
                )
                ItemVitrine(
                    nomeImagem: "img2",
                    tituloAnuncio: "Blusa Feminina",
                    valorAnuncio: "R$ 120,00",
                    tipoItem: .padrao
                )
            }
            HStack{
                ItemVitrine(
                    nomeImagem: "img8",
                    tituloAnuncio: "Blusa Masculina",
                    valorAnuncio: "R$ 49,90",
                    tipoItem: .padrao
                )
                ItemVitrine(
                    nomeImagem: "img4",
                    tituloAnuncio: "Bermuda Masculina",
                    valorAnuncio: "R$ 89,90",
                    tipoItem: .padrao
                )
            }
            
            ItemVitrine(
                nomeImagem: "img6",
                tituloAnuncio: "Blusa Masculina",
                valorAnuncio: "R$ 49,90",
                tipoItem: .grande
            )
            
            HStack{
                Text("Ultimos Adicionados!")
                    .font(.system(size: 35, weight: .bold, design: .default))
                    .padding(.leading)
                Spacer()
            }
            
            ForEach(0..<9, id: \.self){ i in
                ItemListaVitrine(imagem: "img" + String(i + 1), titulo: "Item " + String(i+1), valor: "R$ 120,00")
                    .padding(.horizontal)
            }
            
        }
        .navigationBarHidden(true)
        .frame(width: UIScreen.main.bounds.width)
    }
}
