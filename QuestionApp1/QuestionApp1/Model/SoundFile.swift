//
//  SoundFile.swift
//  QuestionApp1
//
//  Created by 玉城秀大 on 2021/04/25.
//

import Foundation

//音声再生の際に使用
import AVFoundation

class SoundFile {
    
    //初めは値が入ってないので「？」を入れる
    var player:AVAudioPlayer?
    
    func playSound(fileName:String, extensionName:String) {
        
        //再生する
        
        //流したいファイルを定数化
        let soundURL = Bundle.main.url(forResource: fileName, withExtension: extensionName)
        
        //do catch文は、通常はdo部分の、エラーが出たらcatch部分の処理を行う
        do {
            
            //効果音を鳴らす
            player = try AVAudioPlayer(contentsOf: soundURL!)
            player?.play()
            
        } catch {
            print("エラーです。")
        }
        
    }
    
}
