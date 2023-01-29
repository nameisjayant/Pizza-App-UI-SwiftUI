//
//  PizzaView.swift
//  Pizza App ui
//
//  Created by jayant kumar on 28/01/23.
//


import SwiftUI

struct ContentView: View {

    @State var currentState = "Starters"
    var lists = ["Starters","Asian","Placha & Roast & Gril","Classics","Indian","Italian"]
    
    var body: some View {
        ZStack(alignment: .leading){
    
            VStack(alignment : .leading){
                HStack{
                    HeaderView()
                }.background(.red)
                ScrollView(.horizontal,showsIndicators: false){
                    HStack{
                        ForEach(lists,id: \.self){data in
                            CustomChipView(
                                selected: data == currentState, title: data){value in
                                    currentState = value
                                }
                        }
                    }.frame(maxWidth: .infinity,alignment: .leading)
                        .padding(15)
                }
                Grid() {
                    GridRow {
                        ShowPizzView()
                        ShowPizzView()
                    }
                }
            }
            }.frame(maxWidth: .infinity,maxHeight: .infinity,alignment: .topLeading)
            .background(Color(hex: 0xFFF1F1F1))
    }
}

struct ShowPizzView :View{
    var body: some View{
        ZStack{
            Rectangle()
                .background(.white)
                .foregroundColor(.white)
                .cornerRadius(10)
                .padding()
            VStack(alignment : .center){
                Image("pizza")
                    .resizable()
                    .frame(width: 109,height: 109)
                Text("£14.25")
                    .foregroundColor(.red)
                    .multilineTextAlignment(.center)
                Text("Fresh Farm House")
                    .font(.headline)
                    .multilineTextAlignment(.center)
                    .padding(.vertical,1)
                Text("crisp capsicum, succulent mushrooms and fresh tomatoes")
                    .multilineTextAlignment(.center)
                    .font(.caption)
                    .foregroundColor(.gray)
                    .fontWeight(.light)
                Button{
                    
                } label: {
                    Text("Add")
                        .padding(5)
                        .frame(width: 90)
                        .font(.headline)
                }.buttonStyle(.borderedProminent)
                    .cornerRadius(25)
                    .tint(.red)

            }.padding(.horizontal,10)
        }.frame(width: 230,height: 310)
    }
}


struct CustomChipView : View {
    var selected:Bool
    var title:String
    var onValueChange : (String)->Void
    var body: some View{
        Button{
            onValueChange(title)
        } label: {
            Text(title)
                .padding(15)
                .foregroundColor(selected ? .white : .black)
                .fontWeight(.medium)
                .font(.title3)
                .background(selected ? .red : .white)
                .cornerRadius(25)
                .padding(.trailing,10)
                
        }
    }
}


struct HeaderView : View{
    var body: some View{
            HStack{
                HStack{
                    Button{
                    } label: {
                        Image("menu")
                            .resizable()
                            .foregroundColor(.white)
                            .frame(width: 28,height: 28)
                    }
                    Text("Jayant Kumar")
                        .foregroundColor(.white)
                        .font(.title3)
                        .fontWeight(.semibold)
                        .padding(.leading,15)
                        
                }
                Spacer()
                Button{
                }label: {
                    Image(systemName: "magnifyingglass")
                        .resizable()
                        .foregroundColor(.white)
                        .frame(width: 28,height: 28)
                    
                }
                }.padding(20)
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


extension Color {
    init(hex: Int, opacity: Double = 1.0) {
        let red = Double((hex & 0xff0000) >> 16) / 255.0
        let green = Double((hex & 0xff00) >> 8) / 255.0
        let blue = Double((hex & 0xff) >> 0) / 255.0
        self.init(.sRGB, red: red, green: green, blue: blue, opacity: opacity)
    }
}
