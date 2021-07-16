//
//  Home.swift
//  EnimeList
//
//  Created by Farhandika Zahrir Mufti guenia on 11/07/21.
//

import SwiftUI

struct Home: View {
    var body: some View {
        ZStack(alignment:.top){
            VStack{
                TopContent()
                ScrollView(.horizontal, showsIndicators: false){
                    HStack {
                        Tag()
                        Tag(myTag:"action")
                        Tag(myTag:"slice of life")
                    }
                    }
                Divider()
                ScrollView{
                    
                }
                Spacer()
                
            }.padding(.horizontal)
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}

struct TopContent: View {
    var body: some View {
        HStack{
            Image("me")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 60, height: 60, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .clipShape(
                    Circle()
                )
            VStack(alignment:.leading) {
                Text("Good Morning")
                    .font(.footnote)
                    .fontWeight(.medium)
                    .foregroundColor(Color.black.opacity(0.4))
                Text("Farhandika Zahrir")
                    .font(.title3)
                    .fontWeight(.semibold)
            }
            Spacer()
            NavigationLink(
                destination: Search(),
                label: {
                    Image(systemName: "magnifyingglass")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .foregroundColor(Color.black.opacity(0.5))
                        .frame(width: 25, height: 25, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                })
        }.padding(.top)
    }
}

struct Tag: View {
    var myTag:String = "all"
    var body: some View {
        Text(myTag)
            .fontWeight(.semibold)
            .foregroundColor(Color.white)
            .padding(.horizontal)
            .background(Color.purple)
            .cornerRadius(20)
    }
}
