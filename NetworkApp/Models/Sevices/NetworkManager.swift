//
//  NetworkManager.swift
//  NetworkApp
//
//  Created by Test on 11/28/21.
//

import Foundation

class NetworkManager {
    
    static let shared = NetworkManager()
    
    private init() {}
    
    func fetchCatImage(from url: String?, with completion: @escaping(RandomCat) -> Void) {
        guard let url = URL(string: url ?? "") else { return }
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else {
                print(error?.localizedDescription ?? "No error description")
                return
            }
            
            do {
                let randomCat = try JSONDecoder().decode(RandomCat.self, from: data)
                DispatchQueue.main.async {
                    completion(randomCat)
                }
            } catch let error {
                print(error)
            }
        } .resume()
    }
}

class ImageManager {
    static var shared = ImageManager()
    
    private init() {}
    
    func fetchImage(from url: String?) -> Data? {
        guard let stringURL = url else { return nil }
        guard let imageURL = URL(string: stringURL) else { return nil }
        return try? Data(contentsOf: imageURL)
    }
}
