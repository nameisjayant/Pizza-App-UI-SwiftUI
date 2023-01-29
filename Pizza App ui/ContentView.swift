//
//  ContentView.swift
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
    
            VStack(){
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
                Grid {
                    GridRow {
                        ForEach(0..<2) { _ in
                            ShowPizzaView()
                        }
                    }
                    GridRow {
                        ForEach(0..<2) { _ in
                            ShowPizzaView()
                        }
                    }
                }
            }
            }.frame(maxWidth: .infinity,maxHeight: .infinity,alignment: .topLeading)
    }
}

struct ShowPizzaView : View {
    var body: some View{
        ZStack{
            RoundedRectangle(cornerRadius: 5, style: .continuous)
                           .fill(.white)
            
            VStack{
                Image("pizza")
                    .resizable()
                    .frame(width:109,height: 109)
                Text("£14.25")
                    .foregroundColor(.red)
                    .font(.title2)
                    .fontWeight(.medium)
                Text("Fresh Farm House")
                    .foregroundColor(.black)
                    .font(.title2)
                    .fontWeight(.medium)
                Text("crisp capsicum, succulent mushrooms and fresh tomatoes")
                    .foregroundColor(.gray)
                    .font(.subheadline)
                    .fontWeight(.regular)
                    .multilineTextAlignment(.center)
                Button{}label: {
                    Text("Add")
                        .padding(5)
                        .frame(maxWidth: 91)
                        .font(.title3)
                        .fontWeight(.medium)
                        
                }.buttonStyle(.borderedProminent)
                    .tint(.orange)
                
            }.padding(5)
        }.padding(5)
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
