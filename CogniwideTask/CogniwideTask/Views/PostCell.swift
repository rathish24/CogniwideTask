//
//  PostCell.swift
//  CogniwideTask
//
//  Created by Rathish Krish on 22/11/20.
//

import UIKit
import RxSwift

class PostCell: UITableViewCell {

    @IBOutlet weak var descLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    var saveBtnTap : Observable<Void>{
      return self.saveBtn.rx.tap.asObservable()
    }
    public let bag = DisposeBag()

    @IBOutlet weak var saveBtn: UIButton!
    
    @IBAction func saveBtnAction(_ sender: UIButton) {
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
     var item: Post! {
         didSet {
             setPostData()
         }
     }

     private func setPostData() {
        
        titleLabel.text = item.title
        descLabel.text = item.body
       
        print("items id == \(item.id)")
        print("items isFave == \(item.isFavourite)")
        print("items title == \(item.title)")
        print("items body == \(item.body)")
        print("items userID == \(item.userID)")
        
     }
}
