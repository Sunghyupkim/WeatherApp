//
//  ViewController.swift
//  Weather
//
//  Created by Sunghyup Kim on 2020/06/12.
//  Copyright © 2020 SunghyupKim. All rights reserved.
//

import UIKit
import SkeletonView

class WeatherViewController: UIViewController {

    @IBOutlet weak var conditionImageView: UIImageView!
    @IBOutlet weak var temparatureLabel: UILabel!
    @IBOutlet weak var conditionLabel: UILabel!
    
    private let weatherManager = WeatherManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showAnimation()
        fetchWeather()
        // weatherManager.fetchWeather(byCity: <#T##String#>, completion: <#T##(Result<Double, Error>) -> Void#>)
        
    }
    
    private func fetchWeather() {
        
        weatherManager.fetchWeather(byCity: "new york") { [weak self] (result) in
            guard let this = self else { return }
            switch result {
            case .success(let model):
                this.updateView(with: model)
            case .failure(let error):
                print("\(error.localizedDescription)")
            }
        }
    }
    
    private func updateView(with model: WeatherModel) {
        hideAnimataion()
        
        temparatureLabel.text = model.temp.toString().appending("℃")
        conditionLabel.text = model.conditionDescription
        navigationItem.title = model.countryName
        conditionImageView.image = UIImage(named: model.conditionImage)
        
//        temparatureLabel.text = data.main.temp.toString().appending("℃")
//        conditionLabel.text = data.weather.first?.description
//        navigationItem.title = data.name
    }
    
    private func hideAnimataion() {
        
        temparatureLabel.hideSkeleton()
        conditionLabel.hideSkeleton()
        conditionImageView.hideSkeleton()
        
    }
    
    private func showAnimation() {
        conditionImageView.showAnimatedGradientSkeleton()
        temparatureLabel.showAnimatedGradientSkeleton()
        conditionLabel.showAnimatedGradientSkeleton()
    }
        
    @IBAction func addCityButtonTapped(_ sender: Any) {
        performSegue(withIdentifier: "showAddCity", sender: nil)
    }
    
    @IBAction func locationButtonTapped(_ sender: Any) {
    }
    
    
    
}

