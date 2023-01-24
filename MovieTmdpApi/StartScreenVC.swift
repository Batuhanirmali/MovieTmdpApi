//
//  StartScreenVC.swift
//  MovieTmdpApi
//
//  Created by Talha Batuhan Irmalı on 24.01.2023.
//

import UIKit

class StartScreenVC: UIViewController {
    
    private var apiService = ApiService()

    override func viewDidLoad() {
        super.viewDidLoad()
        loadPopularMoviesData()
    }

    private func loadPopularMoviesData() {
        apiService.getPopularMoviesData { [weak self] (result) in
            DispatchQueue.main.async {
                switch result {
                case .success(let listOf):
                    print(result)
                case .failure(let error):
                    self?.showAlertWith(title: "Could not connect!", message: "Plese check your internet connection \n or try again later")
                    print("Error processing json data: \(error)")
                }
            }
        }
    }
    
    // MARK: - Show Alert
    
    func showAlertWith(title: String, message: String, style: UIAlertController.Style = .alert) {
            let alertController = UIAlertController(title: title, message: message, preferredStyle: style)
            let action = UIAlertAction(title: "OK", style: .default) { (action) in
                self.dismiss(animated: true, completion: nil)
            }
            alertController.addAction(action)
            self.present(alertController, animated: true, completion: nil)
        }
}
