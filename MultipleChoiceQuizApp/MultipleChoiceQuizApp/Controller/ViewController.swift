//
//  ViewController.swift
//  MultipleChoiceQuizApp
//
//  Created by IIFLUSER on 12/11/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var scoreLabel: UILabel!
    
    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet weak var firstButton: UIButton!
    
    @IBOutlet weak var secondButton: UIButton!
    
    @IBOutlet weak var thirdButton: UIButton!
    
    @IBOutlet weak var progressBar: UIProgressView!

    var applicationModel = model()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
   
    @IBAction func pressedButton(_ sender: UIButton){
        
        if applicationModel.checkAnswer(userOption: sender)
        {
            sender.backgroundColor = UIColor.green
            scoreLabel.text = String(applicationModel.getScore())
            progressBar.progress += applicationModel.getProgress()
        }
        else
        {
            sender.backgroundColor = UIColor.systemPink
        }
        
        applicationModel.nextQuestion()
        
        Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
    }
    
    @objc func updateUI()
    {
        questionLabel.text = applicationModel.quiz[applicationModel.getQuestionNumber()].text
        firstButton.setTitle(applicationModel.getOptions(buttonNumber: 0), for: .normal)
        secondButton.setTitle(applicationModel.getOptions(buttonNumber: 1), for: .normal)
        thirdButton.setTitle(applicationModel.getOptions(buttonNumber: 2), for: .normal)
        firstButton.backgroundColor = UIColor.systemIndigo
        secondButton.backgroundColor = UIColor.systemIndigo
        thirdButton.backgroundColor = UIColor.systemIndigo
        
        if(applicationModel.getQuestionNumber() == 0)
        {
            progressBar.progress = 0.0
            scoreLabel.text = "Score: 0"
            applicationModel.score = 0
        }
    }

}

