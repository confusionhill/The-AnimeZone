//
//  Search.swift
//  EnimeList
//
//  Created by Farhandika Zahrir Mufti guenia on 12/07/21.
//

import SwiftUI

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

struct Search: View {
    @StateObject var animeSearch:AnimeSearch = AnimeSearch()
    var body: some View {
        VStack{
            //Mark : TopBar
           /* HStack{
                Image(systemName: "arrow.backward")
                Spacer()
            }
            .padding(.bottom)*/
            TopBar(animeSearch: animeSearch)
            Divider()
            if animeSearch.isLoading == false {
                Spacer()
                ProgressView()
            } else {
                List{
                    //Mark : AnimeList  wkkwkwkwkwkwk
                    ForEach(animeSearch.result,id:\.self){val in
                        NavigationLink(
                            destination: ItemDisplay(animeIDX:val.mal_id),
                            label: {
                                AnimeList(imglink: val.image_url,title: val.title,type: val.type)
                            })
                    }

                }
            }
            Spacer()
        }
        .onAppear{
            animeSearch.fetchSearch()
        }
        .navigationTitle("Search")
        //.navigationBarHidden(true)
        .padding()
    }
}


struct Search_Previews: PreviewProvider {
    static var previews: some View {
        Search()
    }
}

struct TopBar: View {
    @ObservedObject var animeSearch:AnimeSearch
   // @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    var body: some View {
        HStack {
            TextField("Search...",text:$animeSearch.searched)
                .padding()
                .background(Color.black.opacity(0.08))
                .cornerRadius(15)
            Button("Search"){
                UIApplication.shared.endEditing()
                animeSearch.fetchSearch()
               // self.presentationMode.wrappedValue.dismiss()
            }
        }
    }
}

struct AnimeList: View {
    var imglink:String = ""
    var title:String = ""
    var airing:Bool = false
    var type:String = ""
    var score:Float16 = 0
    var body: some View {
        HStack {
            RemoteImage(url:imglink)
                .aspectRatio(contentMode: .fill)
                .frame(width:UIScreen.width/4,height:100)
                .padding(.trailing)
            VStack(alignment:.leading) {
                Text(title)
                    .font(.title)
                    .fontWeight(.bold)
                Text(type)
                    .font(.headline)
                Text("Score")
                    .font(.footnote)
            }
        }.padding([.bottom,.top],25)
    }
}
