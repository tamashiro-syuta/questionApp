//
//  Human.swift
//  QuestionApp1
//
//  Created by 玉城秀大 on 2021/04/25.
//

import Foundation

class Human: Animal {
    
    
    override func breath() {
        super.breath()
        profile()
    }
    
    func profile() {
        print("私は、玉城秀大です。")
    }
    
    
    //下のように書くと、Humanクラスのbreathを使用しているので、ログには「私は、玉城秀大です。」が出る。
    //var human = Human()
    //human.breath()
    
    //下のように書くと、superで親クラスのbrathが使われるようになったので、ログでは、「息してます。玉城秀大です。」と出る
    //override func breath() {
    //super.breath()
    //profile()
    //}

    //func profile() {
    //    print("私は、玉城秀大です。")
    //}
    
}
