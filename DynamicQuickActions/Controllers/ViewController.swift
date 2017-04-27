//
//  ViewController.swift
//  DynamicQuickActions
//
//  Created by Ivan Kovacevic on 27/04/2017.
//  Copyright © 2017 Ivan Kovacevic. All rights reserved.
//

import UIKit

final class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descLabel: UILabel!
    
    var selectedAnimal: Animal? {
        didSet {
            self.displaySelectedAnimal()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.registerQuickActions()
        
        self.imageView.image = nil
        self.nameLabel.text = nil
        self.descLabel.text = nil
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.displaySelectedAnimal()
    }
    
    @IBAction func registerTapped(_ sender: Any) {
        self.registerQuickActions()
    }
}

extension ViewController {
    
    fileprivate func registerQuickActions() {
        
        // Let's pretend that this json is coming from async network request, and we are just registering quick actions based on this JSON response.
        let animals = JSONService.loadAnimals()
        
        // select random 4 items from array
        let selectedAnimals = animals.choose(4)
        
        // tell the `QuickActionsService` to register our selected animals
        QuickActionsService.registerAnimalsToQuickActions(animals: selectedAnimals)
        
        // show simple alert
        let alert = UIAlertController(title: "Congrats", message: "You've successfully registered your quick actions items:\n\n \(selectedAnimals.map({ $0.name }))", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    fileprivate func displaySelectedAnimal() {
        
        guard let animal = self.selectedAnimal else { return }
        self.imageView.image = UIImage(named: "\(animal.imageName).jpeg")
        self.nameLabel.text = animal.name
        self.descLabel.text = animal.description
    }
}
