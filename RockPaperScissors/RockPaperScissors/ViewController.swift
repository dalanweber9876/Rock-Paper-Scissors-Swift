//
//  ViewController.swift
//  RockPaperScissors
//
//  Created by Dalan Weber on 11/11/23.
//

import UIKit

class ViewController: UIViewController {
    
    var userScore = 0
    var computerScore = 0
    
    private let winnerView: UILabel = {
        let winnerView = UILabel()
        winnerView.contentMode = .scaleAspectFill
        return winnerView
    }()
    
    private let userView: UILabel = {
        let userView = UILabel()
        userView.contentMode = .scaleAspectFill
        return userView
    }()
    
    private let computerView: UILabel = {
        let computerView = UILabel()
        computerView.contentMode = .scaleAspectFill
        return computerView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        view.addSubview(userView)
        userView.frame = CGRect(x: 50, y: 250, width: view.frame.size.width, height: 50)
        userView.backgroundColor = .white
        
        view.addSubview(computerView)
        computerView.frame = CGRect(x: 50, y: 300, width: view.frame.size.width, height: 50)
        computerView.backgroundColor = .white
        
        
        view.addSubview(winnerView)
        winnerView.frame = CGRect(x: 50, y: 400, width: 300, height: 300)
        
        view.addSubview(rock)
        view.addSubview(paper)
        view.addSubview(scissors)
        
        rock.addTarget(self, action: #selector(whoWins(_:)), for: .touchUpInside)
        paper.addTarget(self, action: #selector(whoWins(_:)), for: .touchUpInside)
        scissors.addTarget(self, action: #selector(whoWins(_:)), for: .touchUpInside)
    }
    
    private let rock: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemGray3
        button.setTitle("Rock", for: .normal)
        button.setTitleColor(.black, for: .normal)
        return button
    }()
    
    private let paper: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemGray3
        button.setTitle("Paper", for: .normal)
        button.setTitleColor(.black, for: .normal)
        return button
    }()
    
    private let scissors: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemGray3
        button.setTitle("Scissors", for: .normal)
        button.setTitleColor(.black, for: .normal)
        return button
    }()
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        rock.frame = CGRect(x: 35, y: view.frame.size.height-100-view.safeAreaInsets.bottom, width: 100, height: 55)
        
        paper.frame = CGRect(x: 155, y: view.frame.size.height-100-view.safeAreaInsets.bottom, width: 100, height: 55)
        
        scissors.frame = CGRect(x: 275, y: view.frame.size.height-100-view.safeAreaInsets.bottom, width: 100, height: 55)
    }
    
    @objc func whoWins(_ sender: UIButton) {
        if sender == rock {
            checkResult(playerChoice: 1)
        } else if sender == paper {
            checkResult(playerChoice: 2)
        }else if sender == scissors {
            checkResult(playerChoice: 3)
        }
    }
    
    func checkResult(playerChoice: Int) {
        let computer = Int.random(in: 1...3)
        let fontSize: CGFloat = 40.0
        if playerChoice == computer {
            winnerView.text = "It's a Tie!"
            winnerView.backgroundColor = .systemYellow
            
        } else if playerChoice == 1 && computer == 2 {
            winnerView.text = "You Lose!"
            winnerView.backgroundColor = .systemRed
            computerScore += 1
            
        } else if playerChoice == 1 && computer == 3 {
            winnerView.text = "You Win!"
            winnerView.backgroundColor = .systemGreen
            userScore += 1
            
        } else if playerChoice == 2 && computer == 1 {
            winnerView.text = "You Win!"
            winnerView.backgroundColor = .systemGreen
            userScore += 1
            
        } else if playerChoice == 2 && computer == 3 {
            winnerView.text = "You Lose!"
            winnerView.backgroundColor = .systemRed
            computerScore += 1
            
        } else if playerChoice == 3 && computer == 1 {
            winnerView.text = "You Lose!"
            winnerView.backgroundColor = .systemRed
            computerScore += 1
            
        } else if playerChoice == 3 && computer == 2{
            winnerView.text = "You Win!"
            winnerView.backgroundColor = .systemGreen
            userScore += 1
            
        } else {
            return
        }
        
        winnerView.font = UIFont.systemFont(ofSize: fontSize)
        winnerView.textAlignment = .center
        userView.font = UIFont.systemFont(ofSize: fontSize)
        computerView.font = UIFont.systemFont(ofSize: fontSize)
        
        userView.text = "You: \(userScore)"
        computerView.text = "Computer: \(computerScore)"
    }
}

