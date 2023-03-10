//
//  FeedViewController.swift
//  Instagram
//
//  Created by Azik on 01.02.2023.
//

import Foundation
import UIKit
import SnapKit

class FeedViewController : UIViewController {
    //MARK: - View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        initialize()
    }
    
    //MARK: - Private properties
    private let tableView = UITableView()
    private var items : [FeedItemType] = [
        .stories([
            FeedStoriesItemCellInfo(image: UIImage(named: "dog")!, username: "user", isAddButtonVisible: true, isNewStory: false),
            FeedStoriesItemCellInfo(image: UIImage(named: "dog")!, username: "user", isAddButtonVisible: false, isNewStory: true),
            FeedStoriesItemCellInfo(image: UIImage(named: "dog")!, username: "user", isAddButtonVisible: false, isNewStory: true),
            FeedStoriesItemCellInfo(image: UIImage(named: "dog")!, username: "user", isAddButtonVisible: false, isNewStory: true),
            FeedStoriesItemCellInfo(image: UIImage(named: "dog")!, username: "user", isAddButtonVisible: false, isNewStory: true),
            FeedStoriesItemCellInfo(image: UIImage(named: "dog")!, username: "user", isAddButtonVisible: false, isNewStory: false),
            FeedStoriesItemCellInfo(image: UIImage(named: "dog")!, username: "user", isAddButtonVisible: false, isNewStory: false)
        ]),.post(FeedPostItemInfo(userImage: UIImage(named: "dog")!, username: "SomeUser", postSubtitle: "Sponsored", postImage: UIImage(named: "dog")!, numberOfLikes: 123, comment: CommentShortInfo(username: "SomeUser", commentText: "hahaha lol =)"))),
        .post(FeedPostItemInfo(userImage: UIImage(named: "dog")!, username: "SomeUser", postSubtitle: "Sponsored", postImage: UIImage(named: "dog")!, numberOfLikes: 13, comment: CommentShortInfo(username: "SomeUser", commentText: "hahaha nice ava xd"))),
        .post(FeedPostItemInfo(userImage: UIImage(named: "dog")!, username: "SomeUser", postSubtitle: "Sponsored", postImage: UIImage(named: "dog")!, numberOfLikes: 153, comment: CommentShortInfo(username: "SomeUser", commentText: "hahaha nice ava xd"))),
        .post(FeedPostItemInfo(userImage: UIImage(named: "dog")!, username: "SomeUser", postSubtitle: "Sponsored", postImage: UIImage(named: "dog")!, numberOfLikes: 223, comment: CommentShortInfo(username: "SomeUser", commentText: "hahaha nice ava xd")))
             ]
}


//MARK: - Private methods
private extension FeedViewController {
    func initialize() {
        view.backgroundColor = .white
        navigationController?.navigationBar.tintColor = .black
        navigationItem.leftBarButtonItems = makeLeftBarButton()
        navigationItem.rightBarButtonItems = makeRightBarButton()
        tableView.dataSource = self
        tableView.separatorColor = .clear
        tableView.register(FeedStoriesSetCell.self, forCellReuseIdentifier: String(describing: FeedStoriesSetCell.self))
        tableView.register(FeedPostCell.self, forCellReuseIdentifier: String(describing: FeedPostCell.self))
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            
        }
    }
    
    func makeLeftBarButton()-> [UIBarButtonItem] {
        let logoBarButtonItem = UIBarButtonItem(customView: LogoView())
        let dropDownButtonItem = UIBarButtonItem(title: nil, image: UIImage(systemName: "chevron.down"), target: self, action: nil, menu: makeDropDownMenu())
        return [logoBarButtonItem,dropDownButtonItem]
    }
                                                
    func makeRightBarButton() -> [UIBarButtonItem] {
        let addBarButtonItem  = UIBarButtonItem(image: UIImage(systemName: "plus.app"), style: .plain, target: self, action: #selector(didTapPlusButton))
        let directBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "paperplane"), style: .plain, target: self, action: #selector(didTapDirectButton))
        return [directBarButtonItem,addBarButtonItem]
        }
    @objc func didTapPlusButton() {
        print("Add")
    }
    @objc func didTapDirectButton() {
        print("Direct")
    }
    
    func makeDropDownMenu() -> UIMenu {
        let subItem = UIAction(title:"????????????????", image: UIImage(systemName: "person.2")) { _ in
            print("Subs")
        }
        let favsItem = UIAction(title:"??????????????????", image: UIImage(systemName: "star")) { _ in
            print("Favourites")
        }
        return UIMenu(title: "",children: [subItem,favsItem])
    }
}

extension FeedViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        items.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = items[indexPath.row]
        switch item {
        case .stories(let info):
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: FeedStoriesSetCell.self), for: indexPath) as! FeedStoriesSetCell
            cell.configure(with: info)
            return cell
        case .post(let post):
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: FeedPostCell.self), for: indexPath) as! FeedPostCell
            cell.configure(with: post)
            return cell
        }
    }
}
