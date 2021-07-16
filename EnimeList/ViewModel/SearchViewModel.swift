//
//  SearchViewModel.swift
//  EnimeList
//
//  Created by Farhandika Zahrir Mufti guenia on 12/07/21.
//

import Foundation

public class AnimeSearch:ObservableObject{
    @Published var searched:String = ""
    @Published var result = [SearchedAnime]()
    @Published var isLoading:Bool = false
    private let myApi = "https://api.jikan.moe/v3/"
    // https://api.jikan.moe/v3/search/anime?q=Fate/Zero&page=1
    public func fetchSearch() {
        self.isLoading = true
        guard searched != "" else {
            self.result = []
            self.isLoading = false
            return
        }
        guard let url = URL(string: "\(myApi)search/anime?q=\(searched)&page=1") else {
            print("API not fetched")
            self.result = []
            self.isLoading = false
            return
        }
        getData(url: url)
        self.isLoading = false
    }
    
    private func getData(url:URL){
        let session = URLSession(configuration: .default)
        let request = session.dataTask(with: url) { (data,_,error) in
            if error == nil {
                if let safeData = data {
                    do {
                        let myresult =  try JSONDecoder().decode(SearchingAnime.self, from: safeData)
                        DispatchQueue.main.async {
                            self.result = myresult.results
                        }
                    } catch {
                        print(error)
                    }
                }
            } else {
                print(error ?? "error but unknown")
            }
        }
        request.resume()
    }
    
}
