//
//  AnimeSearchModel.swift
//  EnimeList
//
//  Created by Farhandika Zahrir Mufti guenia on 13/07/21.
//

import Foundation

struct SearchingAnime:Codable {
    var results:[SearchedAnime]
}

struct SearchedAnime:Codable,Hashable,Identifiable {
    var mal_id:Int
    var image_url:String
    var title:String
    var airing:Bool
    var type:String
    var score:Float16
    
    var id:Int {
        mal_id
    }
}
