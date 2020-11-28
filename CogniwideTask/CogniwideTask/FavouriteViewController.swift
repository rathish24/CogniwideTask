//
//  FavouriteViewController.swift
//  CogniwideTask
//
//  Created by Rathish Krish on 22/11/20.
//

import UIKit
import RxSwift
import RxCocoa


class FavouriteViewController: BaseViewController, UIScrollViewDelegate {
    var postArray = [Post]()
    @IBOutlet weak var tableView: UITableView!

    //Dispose bag
    private let bag = DisposeBag()
    private let viewModel = FavouriteViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Favourite"
        tableView.register(UINib(nibName: "PostCell", bundle: nil), forCellReuseIdentifier: "PostCell")
        tableView.rx.setDelegate(self).disposed(by: bag)
        tableView.tableFooterView = UIView()
        bindTableView()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel.fetchPostList()
        
        
    }

    private func bindTableView() {
        viewModel.items.bind(to: tableView.rx.items(cellIdentifier: "PostCell", cellType: PostCell.self)) { (row, item, cell) in
            cell.saveBtn.isHidden = true
            print(" item as? Post ::: \(item as? Post)")
            cell.item = item as? Post
        }.disposed(by: bag)       
    }
}
extension FavouriteViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }

}
