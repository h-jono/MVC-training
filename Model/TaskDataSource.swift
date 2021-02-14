//
//  TaskDataSource.swift
//  TaskApp
//
//  Created by 城野 on 2021/02/14.
//

import Foundation

class TaskDataSource: NSObject {
    
    // Task一覧を保持するArray  UITableViewに表示させるためのデータ
    private var tasks = [Task]()
    
    // UserDefaultsから保存したTask一覧を取得
    func loadData() {
        let userDefaults = UserDefaults.standard
        let taskDictionaries = userDefaults.object(forKey: "tasks") as? [[String: Any]]       
        guard let t = taskDictionaries else { return }
        
        for dic in t {
            let task = Task(from: dic)
            tasks.append(task)
        }
    }
    
    // TaskをUserDefaultsに保存
    func save(task: Task) {
        tasks.append(task)
        
        var taskDictionaries = [[String: Any]]()
        for t in tasks {
            let taskDictionary: [String: Any] = ["text": t.text, "deadline": t.deadline]
            taskDictionaries.append(taskDictionary)
        }
        
        let userDefaults = UserDefaults.standard
        userDefaults.set(taskDictionaries, forKey: "tasks")
        userDefaults.synchronize()
    }
    
    // tableviewのセルのカウント用に、Taskの総数をreturn
    func count() -> Int {
        return tasks.count
    }
    
    // 指定したindexに対応するTaskをreturn(indexにはindexPath.rowが来る)
    func data(at index: Int) -> Task? {
        if tasks.count > index {
            return tasks[index]
        }
        return nil
    }
    
}
