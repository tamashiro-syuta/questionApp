//
//  ViewController.swift
//  QuestionApp1
//
//  Created by 玉城秀大 on 2021/04/25.
//

import UIKit

class ViewController: UIViewController,nowScoreDlegate {
    
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var maxScorelabel: UILabel!
    
    var correctCount = 0
    var wrongCount = 0
    var maxScore = 0
    var questionNumber = 0
    
    let imagesList = ImagesList() //初期化しているので、modelクラスで書いた処理(配列に答えが入っている状態)が行われてる
    
    //IBActionで検知した正答がどちらなのかを取得する変数
    var pickedAnswer = false
    
    var soundFile = SoundFile()
    
    var changeColor = ChangeColor()
    var gradientLayer = CAGradientLayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView.layer.cornerRadius = 20.0
        gradientLayer = changeColor.changeColor(topR: 0.07, topG: 0.13, topB: 0.26, topAlpha: 1.0, bottomR: 0.54, bottomG: 0.74, bottomB: 0.74, bottomAlpha: 1.0)
        gradientLayer.frame = view.bounds
        view.layer.insertSublayer(gradientLayer, at: 0)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        correctCount = 0
        wrongCount = 0
        questionNumber = 0
        
        imageView.image = UIImage(named: imagesList.list[0].imageText!)
        
        //アプリ内の保存されている値をmaxScoreに入れる
        if UserDefaults.standard.object(forKey: "beforeCount") != nil {
            maxScore = UserDefaults.standard.object(forKey: "beforeCount") as! Int
        }
        
        maxScorelabel.text = String(maxScore)
        
    }
    
    //どのボタンが押されたかをタグで管理
    @IBAction func answer(_ sender: Any) {
        //丸ボタンはタグ１、罰ボタンはタグ２
        
        if (sender as AnyObject).tag == 1 {
            pickedAnswer = true
            //丸ボタンの処理
            
            soundFile.playSound(fileName: "maruSound", extensionName: "mp3")
            
            //ユーザーが押したボタンが丸ボタンだった
            
            //丸ボタンの音声を流す
            
        }else if (sender as AnyObject).tag == 2 {
            pickedAnswer = false
            //罰ボタンの処理
            
            soundFile.playSound(fileName: "batsuSound", extensionName: "mp3")

            //ユーザーが押したボタンが罰ボタンだった
            
            //罰ボタンの音声を流す
        }
        
        //チェック 回答があっているか（pickedAnswerとImagesListのcorrectOrNotの値と一致しているかどうかで確認）
        check()
        nextQuestions()
        
        
    }
    
    func check() {
        let correctAnswer = imagesList.list[questionNumber].answer
        if correctAnswer == pickedAnswer {
            //正解
            correctCount += 1
        }else {
            //不正解
            wrongCount += 1
        }
        
    }
    
    func nextQuestions() {
        if questionNumber <= 9 {
            questionNumber += 1
            imageView.image = UIImage(named: imagesList.list[questionNumber].imageText!)
        }else{
            //問題終了
            
            //画面遷移
            performSegue(withIdentifier: "next", sender: nil)
        }
    }
    
    func nowScore(score: Int) {
        
        soundFile.playSound(fileName: "sound", extensionName: "mp3")
        maxScorelabel.text = String(score)
        
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let nextVC = segue.destination as! NextViewController
        nextVC.correctedCount = correctCount
        nextVC.wrongCount = wrongCount
        nextVC.delegate = self
    }
    
}

