//
//  ViewController.swift
//  SRP
//
//  Created by Artur on 18.11.2022.
//

import UIKit




class ViewController: UIViewController {
    let urlFreeGames = "https://rss.applemarketingtools.com/api/v2/us/apps/top-free/10/apps.json"
    let urlString = "https://raw.githubusercontent.com/Softex-Group/task-mobile/master/test.json"
    
    
    var networkDataFetcher = NetworkDataFetcher()
    let dataStore = DataStore()

    @IBOutlet var textLabel: UILabel!
    @IBOutlet weak var myTextField: UITextField!
    @IBOutlet weak var saveButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        saveButton.layer.cornerRadius = saveButton.frame.width / 2
        networkDataFetcher.fetchGames(urlString: urlFreeGames) { freeGames in
            print(freeGames?.feed.results.first?.name)
            print(freeGames?.feed.results.first?.artistName)
        }
        networkDataFetcher.fetchCountry(urlString: urlString) { countries in
            print(countries?.first?.Name)
        }
    }
    func changeName(){
        guard let name = textLabel.text, name != "" else {
            showAlert()
            return
        }
        dataStore.saveNameInCache(name: name)
    }
    func showAlert() {
        let alert = UIAlertController(title: "Warning", message: "Name is wrong", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default)
        alert.addAction(okAction)
        self.present(alert, animated: true)
    }
    

    @IBAction func saveButton(_ sender: UIButton) {
        textLabel.text = myTextField.text
        changeName()
        
    }
    
}

