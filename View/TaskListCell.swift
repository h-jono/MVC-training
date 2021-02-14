//
//  TaskListCellTableViewCell.swift
//  TaskApp
//
//  Created by 城野 on 2021/02/14.
//

import UIKit

class TaskListCell: UITableViewCell {

    private var taskLablel: UILabel!
    private var deadlineLabel: UILabel!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        taskLablel = UILabel()
        taskLablel.textColor = UIColor.black
        taskLablel.font = UIFont.systemFont(ofSize: 14)
        contentView.addSubview(taskLablel)
        
        deadlineLabel = UILabel()
        deadlineLabel.textColor = UIColor.black
        deadlineLabel.font = UIFont.systemFont(ofSize: 14)
        contentView.addSubview(deadlineLabel)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        taskLablel.frame = CGRect(x: 15.0, y: 15.0, width: contentView.frame.width - (15.0 * 2), height: 15)
        
        deadlineLabel.frame = CGRect(x: taskLablel.frame.origin.x, y: taskLablel.frame.maxY + 8.0, width: taskLablel.frame.width, height: 15.0)
        
    }
    
    var task: Task? {
        didSet {
            guard let t = task else { return }
            taskLablel.text = t.text
            
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy/MM/dd"
            deadlineLabel.text = formatter.string(from: t.deadline)
        }
    }

}
