//
//  Task.swift
//  TaskApp
//
//  Created by 城野 on 2021/02/12.
//

import Foundation

class Task {
    
    let text: String // タスクの内容
    let deadline: Date // タスクの締め切り時間
    
    init(text: String, date: Date) {
        self.text = text
        self.deadline = date
    }
    
    init(from dictionary: [String: Any]) {
        self.text = dictionary["text"] as! String
        self.deadline = dictionary["deadline"] as! Date
    }
    
    
    
}
