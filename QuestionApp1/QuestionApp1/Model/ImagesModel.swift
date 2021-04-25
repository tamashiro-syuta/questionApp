//
//  ImagesModel.swift
//  QuestionApp1
//
//  Created by 玉城秀大 on 2021/04/25.
//

import Foundation

class ImagesModel {
    //画像名を取得して、その画像名が人間かそうでないかをフラグによって判定するための機能
    
    let imageText:String?
    let answer:Bool
    
    //String型のimageNameと、Bool型のcorrectOrNotを引数として、イニシャライズされた時、imageTextにimageName,answerにcorrectOrNotが入る
    init(imageName:String, correctOrNot:Bool) {
        
        imageText = imageName
        answer = correctOrNot
        
    }
}
