//
//  ContentView.swift
//  Pizza App ui
//
//  Created by jayant kumar on 28/01/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack(alignment: .leading){
           
            VStack{
                HStack{
                    HStack{
                        HStack{
                            Button{
                            } label: {
                                Image(systemName: "list.bullet.indent")
                                    .resizable()
                                    .foregroundColor(.white)
                                    .frame(width: 20,height: 20)
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
                                .frame(width: 20,height: 20)
                        }
                        }
                    }.padding(20)
                }.background(.red)
            }
        .frame(maxWidth: .infinity,maxHeight: .infinity,alignment: .topLeading)
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
