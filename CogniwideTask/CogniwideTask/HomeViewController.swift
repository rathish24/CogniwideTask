//
//  HomeViewController.swift
//  CogniwideTask
//
//  Created by Rathish Krish on 22/11/20.
//

import UIKit
import RxSwift
import RxCocoa

class HomeViewController: BaseViewController, UIScrollViewDelegate {
    var postArray = [Post]()
    @IBOutlet weak var tableView: UITableView!

    //Dispose bag
    private let bag = DisposeBag()
    private let viewModel = PostViewModel()
 
  
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Home"
        tableView.register(UINib(nibName: "PostCell", bundle: nil), forCellReuseIdentifier: "PostCell")
       let logoutBtn = UIButton.init(type: .custom)
        logoutBtn.setTitle("Logout", for: .normal)
        logoutBtn.setTitleColor(UIColor.systemBlue, for: .normal)
        logoutBtn.addTarget(self, action: #selector(HomeViewController.didLogout(_:)), for: .touchUpInside)
        logoutBtn.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        let logoutNavItem = UIBarButtonItem(customView: logoutBtn)
        print("logoutNavItem::::: \(logoutNavItem)")
        navigationItem.rightBarButtonItem = logoutNavItem
        tableView.rx.setDelegate(self).disposed(by: bag)
        bindTableView()
    }
    
    @objc func didLogout(_ sender: UIBarButtonItem!) {
        showAlert(title: "", message: "Are your sure want to logout?", alertStyle: .alert, actionTitles: ["OK", "Cancel"], actionStyles: [.default, .cancel],
                  actions: [
                      { _ in
                        
                        CoreDataStack.sharedInstance.deletePostData(entity: "Post", onSuccess: { (success) in
                            if success {
                                print("CoreData post model deleted")
                                UserDefaults.standard.setLoggedIn(value: false)
                                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                                var loginViewController: UIViewController
                                if #available(iOS 13.0, *) {
                                    loginViewController = storyboard.instantiateViewController(identifier: "LoginNavigationController")
                                    // This is to get the SceneDelegate object from your view controller
                                    // then call the change root view controller function to change to main tab bar
                                    (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeRootViewController(loginViewController)
                                } else {
                                    loginViewController = storyboard.instantiateViewController(withIdentifier: "LoginNavigationController")
                                    (UIApplication.shared.delegate as? AppDelegate)?.changeRootViewController(loginViewController)
                                }
                            } else {
                                
                            }
                        })

                      },
                      { _ in

                      }
                  ])
       
    }
    private func bindTableView() {
        viewModel.items.bind(to: tableView.rx.items(cellIdentifier: "PostCell", cellType: PostCell.self)) { (row, item, cell) in
            cell.saveBtnTap
                .subscribe(onNext: {
                    var isFavourite = cell.item.isFavourite
                    print("cell details button tapped \(cell.item.id) is favourite \(cell.item.isFavourite)")
                    if isFavourite {
                        isFavourite = false
                        cell.saveBtn.setImage(UIImage(named: "fav"), for: .normal)
                        self.viewModel.saveFavouritePost(cell.item.id, isFavourite)
                    } else {
                        isFavourite = true
                        cell.saveBtn.setImage(UIImage(named: "fav_fill"), for: .normal)
                        self.viewModel.saveFavouritePost(cell.item.id, isFavourite)
                    }
                })
                .disposed(by: cell.bag)
            cell.item = item as? Post
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
