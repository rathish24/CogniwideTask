//
//  HomeViewController.swift
//  CogniwideTask
//
//  Created by Rathish Krish on 22/11/20.
//

import UIKit
import RxSwift
import RxCocoa

class HomeViewController: UIViewController, UIScrollViewDelegate {
    var postArray = [Post]()
    @IBOutlet weak var tableView: UITableView!

    //Dispose bag
    private let bag = DisposeBag()
    private let viewModel = PostViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Home"
        tableView.register(UINib(nibName: "PostCell", bundle: nil), forCellReuseIdentifier: "PostCell")
        tableView.rx.setDelegate(self).disposed(by: bag)
        bindTableView()
    }

    private func bindTableView() {
        viewModel.items.bind(to: tableView.rx.items(cellIdentifier: "PostCell", cellType: PostCell.self)) { (row, item, cell) in
            cell.saveBtnTap
                .subscribe(onNext: { print("cell details button tapped") })
                .disposed(by: cell.bag)
            cell.item = item
        }.disposed(by: bag)

        tableView.rx.modelSelected(Post.self).subscribe(onNext: { item in
            //  print("SelectedItem: title \(item.title)")
        }).disposed(by: bag)
        viewModel.fetchPostList()
    }
}
extension HomeViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }

}
