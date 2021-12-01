//
//  ViewController.swift
//  NetworkApp
//
//  Created by Test on 11/28/21.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var catImageView: UIImageView!

    
    private var spinnerView = UIActivityIndicatorView()
    private var randomCat: RandomCat?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showSpinner(in: view)
        
    }
    
    @IBAction func showButtonPressed(_ sender: UIButton) {
        fetchCatImage(from: Link.catApi.rawValue)
        DispatchQueue.global().async {
            guard let imageData = ImageManager.shared.fetchImage(from: self.randomCat?.webpurl) else { return }
            DispatchQueue.main.async {
                self.catImageView.image = UIImage(data: imageData)
                self.spinnerView.stopAnimating()
            }
        }
    }
    private func fetchCatImage(from url: String?){
        NetworkManager.shared.fetchCatImage(from: url) {  randomCat in
            self.randomCat = randomCat
        }
    }
    private func showSpinner(in view: UIView) {
        spinnerView = UIActivityIndicatorView(style: .large)
        spinnerView.color = .white
        spinnerView.startAnimating()
        spinnerView.center = catImageView.center
        spinnerView.hidesWhenStopped = true
        
        view.addSubview(spinnerView)
    }
}
    
    
    
