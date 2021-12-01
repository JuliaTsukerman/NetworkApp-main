//
//  RandomCat.swift
//  NetworkApp
//
//  Created by Test on 11/28/21.
//

import Foundation

struct RandomCat: Codable {
    let id: Int
    let url: String
    let webpurl: String
}
enum Link: String {
    case catApi = "https://thatcopy.pw/catapi/rest/"
}
