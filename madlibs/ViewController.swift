//
//  ViewController.swift
//  madlibs
//
//  Created by Ali Dinc on 06/04/2021.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var locationTextField: UITextField!
    @IBOutlet weak var verbTextField: UITextField!
    @IBOutlet weak var ageTextField: UITextField!
    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var numberOfPetsLabel: UILabel!
    @IBOutlet weak var animalSegmentedControl: UISegmentedControl!
    @IBOutlet weak var numberSlider: UISlider!
    @IBOutlet weak var numberOfPetsStepper: UIStepper!
    @IBOutlet weak var happyEndingSwitch: UISwitch!
    @IBOutlet weak var containerView: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        containerView.isHidden = true
        numberLabel.text = ""
        numberOfPetsLabel.text = ""
    }
    
    @IBAction func lessOrMoreValueDidChanged(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            containerView.isHidden = true
        } else if sender.selectedSegmentIndex == 1 {
            containerView.isHidden = false
        }
    }
    
    
    @IBAction func sliderDidChanged(_ sender: UISlider) {
        numberLabel.text = String(Int(sender.value))
    }
    
    @IBAction func stepperDidChanged(_ sender: UIStepper) {
        numberOfPetsLabel.text = String(Int(sender.value))
    }
    
    @IBAction func createStoryDidTapped(_ sender: UIButton) {
        
        var pets: String? { Int(numberOfPetsStepper.value) <= 1 ? "pet" : "pets"}
        
        let animal = animalSegmentedControl.titleForSegment(at: animalSegmentedControl.selectedSegmentIndex)
        let happyEnding = happyEndingSwitch.isOn ? "Now they live happily ever after" : "Things didn't turn out too well.."
        let story = "At the age of \(ageTextField.text!), \(firstNameTextField.text!) took a trip to \(locationTextField.text!) with \(Int(numberOfPetsStepper.value)) \(pets!) in order to \(verbTextField.text!) with a \(animal!). \(firstNameTextField.text!) decided to buy \(Int(numberSlider.value)). \(happyEnding)"
        
        print(story)
        
        let alertController = UIAlertController(title: "My Story", message: story, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(action)
        present(alertController, animated: true, completion: nil)
        
    }
    
    
}






