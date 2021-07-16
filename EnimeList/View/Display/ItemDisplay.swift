//
//  Home.swift
//  EnimeList
//
//  Created by Farhandika Zahrir Mufti guenia on 10/07/21.
//


///PERLU DI KERJAIN BROWWW
import SwiftUI

struct ItemDisplay: View {
    @ObservedObject var myanime:Anime = Anime()
    var animeIDX:Int = 11757
    var body: some View {
        VStack {
            if myanime.animeData.mal_id == -1 {
                ProgressView()
            } else {
                Done(myanime: self.myanime)
            }
        }
        .frame(width: UIScreen.width, height: UIScreen.height, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
        .background(Color.black.ignoresSafeArea(edges: .top))
        .onAppear{
           myanime.grabAnime(id: animeIDX)
        }
    }
}

//When done
struct Done: View {
    @ObservedObject var myanime:Anime
    var body: some View {
        ZStack(){
            //https://cdn.myanimelist.net/images/anime/1548/116226.jpg
           // ImageView(imeg: myanime.animeData.image_url)
           RemoteImage(url: myanime.animeData.image_url)
                .aspectRatio(contentMode: .fill)
                .frame(width:UIScreen.width,height: UIScreen.height)
                //.padding()
            VStack {
               Spacer()
                //Mark: Bottom Drawer
                BottomDrawer(myanime: myanime)
            }
        }
        .animation(.linear)
    }
}

struct ItemDisplay_Previews: PreviewProvider {
    static var previews: some View {
        ItemDisplay()
    }
}


struct BottomDrawer: View {
    @State var isScroll:Bool = false
    @State var offset:CGFloat = UIScreen.height/2 - 80
    @ObservedObject var myanime:Anime
    var body: some View {
        VStack {
            Capsule()
                .fill(Color.black.opacity(0.2))
                .frame(width: 90, height: 10, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
           Divider()
            Text(myanime.animeData.title)
                    .font(.system(.title, design: .rounded))
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                    .padding(.bottom,5)
                    //.frame(height:100)
            ScrollView{
                Text("Hideki Anno")
                    .foregroundColor(.black.opacity(0.4))
                    .font(.subheadline)
                    .fontWeight(.bold)
                    .padding()
                Text(myanime.animeData.synopsis)
                Rectangle()
                    .fill(Color.white)
                    .frame(height:50)
                    
            }
            //.padding(.bottom,35)
            .onTapGesture {
               // isScroll.toggle()
            }
            Spacer()
        }
        .frame(height:500)
        .padding()
        .background(Color.white)
        .cornerRadius(20)
        .gesture(
            DragGesture()
                .onChanged{val in
                    let startLoc = val.startLocation
                    let pindah = startLoc.y + val.translation.height
                   // self.offset = pindah
                    if (pindah > 0 && self.isScroll == false) {
                        self.offset = pindah
                    }
                }
                .onEnded{val in
                    if self.offset > 150 {
                        self.offset = UIScreen.height/2 - 65
                    } else {
                        self.offset = CGFloat.zero
                    }
                }
        )
        .offset(y:offset)
        .animation(/*@START_MENU_TOKEN@*/.easeIn/*@END_MENU_TOKEN@*/)
        
    }
}


struct ImageView: View {
    var imeg:String
    var body: some View {
        RoundedRectangle(cornerRadius: 15)
            .foregroundColor(.white)
            .padding(.horizontal)
            .frame(height:UIScreen.width)
            .overlay(VStack{
                RemoteImage(url: imeg)
                    .aspectRatio(contentMode: .fit)
                    .frame(width:UIScreen.width,height: UIScreen.height)
                    /*
                    .resizable()
                    .aspectRatio(contentMode: .fit)*/
            }.padding()
            )
    }
}
