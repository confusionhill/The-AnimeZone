//
//  AnimeViewModel.swift
//  EnimeList
//
//  Created by Farhandika Zahrir Mufti guenia on 10/07/21.
//

import Foundation

public class Anime:ObservableObject {
    @Published var animeData:MyAnime = MyAnime(mal_id: -1, image_url: "nil", title: "Neon Genesis Evangelion", episodes: 2, rating: "a", score: 8, synopsis: "Sed ut perspiciatis, unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam eaque ipsa, quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt, explicabo. Nemo enim ipsam voluptatem, quia voluptas sit, aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos, qui ratione voluptatem sequi nesciunt, neque porro quisquam est, qui dolorem ipsum, quia dolor sit amet consectetur adipisci[ng] velit, sed quia non numquam [do] eius modi tempora inci[di]dunt, ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum[d] exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? [D]Quis autem vel eum iure rep", premiered: "j")
    
    private let myApi = "https://api.jikan.moe/"
    
    
    func grabAnime(id:Int = 1){
        let theURl:String = "\(self.myApi)v3/anime/\(id)"
        guard let url = URL(string: theURl) else {
            print("error, items not loaded")
            return
        }
        let session = URLSession(configuration: .default)
        let request = session.dataTask(with: url) { (data,response,error) in
            if error == nil {
                if let safeData = data {
                    let decoder = JSONDecoder()
                    do{
                        let result =  try decoder.decode(MyAnime.self, from: safeData)
                        DispatchQueue.main.async {
                            self.animeData = result
                            print(self.animeData as Any)
                         //   print("Berhasil?")
                        }
                    } catch {
                        print(error)
                    }
                }
            }
        }
        request.resume()
    }
}
