//
//  rockPaperScissors.swift
//  RockPaperScissors
//
//  Created by 林祐辰 on 2020/8/24.
//

import UIKit

class rockPaperScissors: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    var timer :Timer?
    var cpuScore = 0
    var playerScore = 0
    
    @IBOutlet weak var startBtn: UIButton!

    @IBOutlet weak var cpuRollLabel: UILabel!
 
    @IBOutlet weak var rockBtn: UIButton!
    @IBOutlet weak var paperBtn: UIButton!
    @IBOutlet weak var scissorsBtn: UIButton!
    
    @IBOutlet weak var cpuScoreLabel: UILabel!
    @IBOutlet weak var playerScoreLabel: UILabel!
    @IBOutlet weak var resultLabel: UILabel!
    
    
    func startGame(decide:GestureSign){
        let cpuPick = roll()
        cpuRollLabel.text = cpuPick.sign
        let gameResult = decide.changePlayerToCpu(cpuPick)

        
        switch gameResult {
          case .win:
            resultLabel.isHidden = false
            resultLabel.text = "Got em!"
            playerScore+=10
            cpuScore+=0
            playerScoreLabel.text = String(playerScore)
            cpuScoreLabel.text = String(cpuScore)
            timer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(self.sortRenderScreen), userInfo: nil, repeats: false)
          case .lose:
            resultLabel.isHidden = false
            resultLabel.text = "Nani!?"
            playerScore+=0
            cpuScore+=10
            playerScoreLabel.text = String(playerScore)
            cpuScoreLabel.text = String(cpuScore)
            timer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(self.sortRenderScreen), userInfo: nil, repeats: false)
         case .draw :
            resultLabel.isHidden = false
            resultLabel.text = "Fair Enough"
            timer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(self.sortRenderScreen), userInfo: nil, repeats: false)
        }
        
        if playerScore == 100{
            let winAlert = UIAlertController(title: "End Game", message: "You Win!", preferredStyle: .alert)
            let okBtn = UIAlertAction(title: "Let's Play Again !", style: .default) { (UIAlertAction) in
                self.restartGame()
            }
            winAlert.addAction(okBtn)
            self.present(winAlert, animated: true, completion: nil)
        }else if cpuScore == 100{
            let loseAlert = UIAlertController(title: "End Game", message: "You Lose!", preferredStyle: .alert)
            let failBtn = UIAlertAction(title: "Restart!", style: .default) { (UIAlertAction) in
                self.restartGame()
            }
            loseAlert.addAction(failBtn)
            self.present(loseAlert, animated: true, completion: nil)
        }

        
    }
    
 @objc func sortRenderScreen(){
        cpuRollLabel.text = "📱"
        resultLabel.isHidden = true
        rockBtn.isHidden = false
        paperBtn.isHidden = false
        scissorsBtn.isHidden = false
    }
    
    func restartGame(){
        cpuRollLabel.text = "📱"
        cpuScore = 0
        playerScore = 0
        cpuScoreLabel.text = String(cpuScore)
        playerScoreLabel.text = String(playerScore)
        resultLabel.isHidden = true
        rockBtn.isHidden = false
        paperBtn.isHidden = false
        scissorsBtn.isHidden = false
        
    }
  
    
    
    @IBAction func startPlay(_ sender: Any) {
        startBtn.isHidden = true
    }
    
    
    @IBAction func playRock(_ sender: Any) {
        startGame(decide:.rock)
        paperBtn.isHidden = true
        scissorsBtn.isHidden = true
    }
    
    @IBAction func playPaper(_ sender: Any) {
        startGame(decide:.paper)
        rockBtn.isHidden = true
        scissorsBtn.isHidden = true
    }
    
    @IBAction func playScissors(_ sender: Any) {
        startGame(decide:.scissors)
        rockBtn.isHidden = true
        paperBtn.isHidden = true
    }
    
    
    
}


