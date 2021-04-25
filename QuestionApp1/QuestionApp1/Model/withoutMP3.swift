//
//  withoutMP3.swift
//  QuestionApp1
//
//  Created by 玉城秀大 on 2021/04/25.
//

import Foundation

class WithoutMP3: SoundFile {
    
    override func playSound(fileName: String, extensionName: String) {
        
        if extensionName == "mp3" {
            
            print("このファイルは再生できません。")
            
        }
        
        player?.stop()
    }
    
}
