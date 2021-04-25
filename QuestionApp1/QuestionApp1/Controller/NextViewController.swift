//
//  NextViewController.swift
//  QuestionApp1
//
//  Created by 玉城秀大 on 2021/04/25.
//

import UIKit

protocol nowScoreDlegate {
    func nowScore(score:Int)
}

class NextViewController: UIViewController {
    
    
    @IBOutlet weak var correctLabel: UILabel!
    @IBOutlet weak var wrongLabel: UILabel!
    
    var correctedCount = Int()
    var wrongCount = Int()
    
    var delegate:nowScoreDlegate?
    
    var beforeCount = Int()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        correctLabel.text = String(correctedCount)
        wrongLabel.text = String(wrongCount)

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func back(_ sender: Any) {
        //もし、最高得点であれば入れ替え
        if beforeCount < correctedCount {
            //UserDefaults.standardは、一度アプリを画面から消しても残る値
            UserDefaults.standard.set(correctedCount, forKey: "beforeCount")
            delegate?.nowScore(score: correctedCount)
        }else if beforeCount > correctedCount {
            //そうでなければ入れ替えない
            UserDefaults.standard.set(beforeCount, forKey: "beforeCount")
        }
        //画面遷移
        dismiss(animated: true, completion: nil)
    }
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
