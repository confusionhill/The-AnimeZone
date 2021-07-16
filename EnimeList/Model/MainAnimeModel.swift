//
//  MainAnimeModel.swift
//  EnimeList
//
//  Created by Farhandika Zahrir Mufti guenia on 10/07/21.
//

import Foundation

class MainAnimeModel:ObservableObject {
    @Published var animeTag:AnimeTag = .action
}



enum AnimeTag {
    case all,action,slice_of_life
}
