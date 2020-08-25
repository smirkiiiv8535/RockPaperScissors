//
//  tossCoin.swift
//  RockPaperScissors
//
//  Created by 林祐辰 on 2020/8/24.
//

import UIKit

class tossCoin: UIViewController {

    var timer:Timer? // 得分後的Timer
    var cpuScore = 0
    var ourScore = 0
    
    @IBOutlet weak var upBtn: UIButton!
    @IBOutlet weak var downBtn: UIButton!
    @IBOutlet weak var leftBtn: UIButton!
    @IBOutlet weak var rightBtn: UIButton!
    @IBOutlet weak var startBtn: UIButton!
    
    
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var robotLabel: UILabel!
    @IBOutlet weak var robotScore: UILabel!
    @IBOutlet weak var playerScore: UILabel!
    
    
    func startGame(play:Toss){
        upBtn.isEnabled = false
        downBtn.isEnabled = false
        leftBtn.isEnabled = false
        rightBtn.isEnabled = false
        
        
        // 電腦隨機選
        let cpuChoose = decideToss()
        // 將電腦選的結果渲染到label上
        robotLabel.text = cpuChoose.emoji
        // gameResult 為處理完輸贏的結果
        let gameResult = play.takeTurns(cpuChoose)
        
        switch gameResult{
        case .win:
            statusLabel.isHidden = false
            statusLabel.text = "Got Em!"
            ourScore+=10
            playerScore.text=String(ourScore)
            timer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(sortScreen), userInfo: nil, repeats: false)
        case .lose:
            statusLabel.isHidden = false
            statusLabel.text = "Not Good"
            cpuScore+=10
            robotScore.text = String(cpuScore)
            timer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(sortScreen), userInfo: nil, repeats: false)
        case .draw:
            statusLabel.isHidden = false
            statusLabel.text = "Fair Enough"
            timer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(sortScreen), userInfo: nil, repeats: false)
        }
        
        if ourScore == 100{
            let successController = UIAlertController(title: "End Game", message: "You Win", preferredStyle: .alert)
            let successBtn = UIAlertAction(title: "再玩一次", style: .default) { (UIAlertAction) in
                self.restartGame()
            }
            
            successController.addAction(successBtn)
            present(successController, animated: true, completion: nil)
            
        }else if cpuScore == 100{
            let failedController = UIAlertController(title: "End Game", message: "You Lose", preferredStyle: .alert)
            let successBtn = UIAlertAction(title: "再玩一次", style: .default) { (UIAlertAction) in
                self.restartGame()
            }
            
            failedController.addAction(successBtn)
            present(failedController, animated: true, completion: nil)
        }
        
        
    }
    
    // 重新開始畫面要有的樣子
    func restartGame(){
        statusLabel.isHidden = true
        robotLabel.text = "🤖"
        cpuScore = 0
        ourScore = 0
        robotScore.text = String(cpuScore)
        playerScore.text = String(ourScore)
    }
    
    
    
    // 此function為 過兩秒後畫面要轉回原本的樣子
    @objc func sortScreen(){
        statusLabel.isHidden = true
        robotLabel.text="🤖"
        upBtn.isHidden = false
        downBtn.isHidden = false
        leftBtn.isHidden = false
        rightBtn.isHidden = false
        upBtn.isEnabled = true
        downBtn.isEnabled = true
        leftBtn.isEnabled = true
        rightBtn.isEnabled = true
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func clickUp(_ sender: Any) {
        startGame(play: .up)
        downBtn.isHidden = true
        leftBtn.isHidden = true
        rightBtn.isHidden = true
    }
    
    
    @IBAction func clickDown(_ sender: Any) {
        startGame(play: .down)
        upBtn.isHidden = true
        leftBtn.isHidden = true
        rightBtn.isHidden = true
    }
    
    @IBAction func clickLeft(_ sender: Any) {
        startGame(play: .left)
         upBtn.isHidden = true
         downBtn.isHidden = true
         rightBtn.isHidden = true
    }
    
    
    @IBAction func clickRight(_ sender: Any) {
        startGame(play: .right)
        upBtn.isHidden = true
        downBtn.isHidden = true
        leftBtn.isHidden = true
    }
    
    @IBAction func clickToStart(_ sender: Any) {
        startBtn.isHidden = true
    }
    
    
    
}
