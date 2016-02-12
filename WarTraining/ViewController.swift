//
//  ViewController.swift
//  WarTraining
//
//  Created by Cloud Strife on 08/02/16.
//  Copyright © 2016 Bastien VINH. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // Region Components ViewModel from Main View
    
    @IBOutlet weak var firstCardImageView: UIImageView!
    @IBOutlet weak var secondCardImageView: UIImageView!
    @IBOutlet weak var DealButton: UIButton!
    @IBOutlet weak var backgroundImageView: UIImageView!
    
    
    @IBOutlet weak var playerScoreLabel: UILabel!
    
    @IBOutlet weak var ennemiScoreLabel: UILabel!
    // Endregion
    
    
    static let MAX_CARDS : UInt32 = 13
    
    
    private var _firstScore : Int = 0
    private var _secondScore : Int = 0
    
    private var _currentSecondCard : Int = 0
    private var _currentFirstCard : Int = 0
    
    
    private let TabImagesCard : [String] = ["card2", "card3", "card4", "card5","card6",
                                        "card7", "card8", "card9", "card10", "cardJack", "cardQueen", "cardKing",
                                        "cardAce"]

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // Action when we tapped the deal button
    @IBAction func DealButtonTapped(sender: UIButton) {
        
        FirstDrawACard()
        SecondDrawACard()
        ManageScore()
        UpdateScoreLabels()
        
    }
    
    
    private func FirstDrawACard() {
        _currentFirstCard = ViewController.RamdonNumberCard()
        firstCardImageView.image = UIImage(named: TabImagesCard[_currentFirstCard])
    }
    
    private func SecondDrawACard() {
         _currentSecondCard = ViewController.RamdonNumberCard()
        secondCardImageView.image = UIImage(named: TabImagesCard[_currentSecondCard])
    }
    
    private func ManageScore() {
        if (_currentFirstCard > _currentSecondCard) {
            _firstScore += 1
        }
        else if (_currentFirstCard < _currentSecondCard)  {
            _secondScore += 1
        }
    }
    
    private func UpdateScoreLabels() {
        playerScoreLabel.text = String(_firstScore)
        ennemiScoreLabel.text = String(_secondScore)
    }
    
    // Region Utils
    
    private class func RamdonNumberCard() -> Int {
        return Int(arc4random_uniform(MAX_CARDS))
    }
    
    // End Region Utils

}

