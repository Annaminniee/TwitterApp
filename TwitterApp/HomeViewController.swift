//
//  HomeViewController.swift
//  TwitterApp
//
//  Created by 菊地原杏菜 on 2023/07/23.
//

import UIKit

class HomeViewController: UIViewController {
    
    var userNameDataList: [UserNameDataModel] = []
    var tweetDataList: [TweetDataModel] = []
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "おすすめ"
        
        tableView.dataSource = self
        tableView.tableFooterView = UIView()
        tableView.rowHeight = 100
        setUserNameData()
        setTweetData()
        tableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "TableViewCell")
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func setUserNameData() {
        let userNameDataModel1 = UserNameDataModel(text: "ユーザー名1")
        let userNameDataModel2 = UserNameDataModel(text: "ユーザー名2")
        let userNameDataModel3 = UserNameDataModel(text: "ユーザー名3")
        userNameDataList.append(contentsOf: [userNameDataModel1, userNameDataModel2, userNameDataModel3])
    }
    
    func setTweetData() {
        let tweetDataModel1 = TweetDataModel(text: "ツイート内容1")
        let tweetDataModel2 = TweetDataModel(text: "ツイート内容2")
        let tweetDataModel3 = TweetDataModel(text: "ツイート内容3")
        tweetDataList.append(contentsOf: [tweetDataModel1, tweetDataModel2, tweetDataModel3])
        }
    }

extension HomeViewController: UITableViewDataSource {
    /// データの数（＝セルの数）を返すメソッド
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userNameDataList.count
        return tweetDataList.count
    }
    /// 各セルの内容を返すメソッド
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // 再利用可能な cell を得る
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! TweetTableViewCell
        cell.setup(username: tweetDataModel.name, detail: tweetDataModel.text)
        let userNameDataModel: UserNameDataModel = userNameDataList[indexPath.row]
        let tweetDataModel: TweetDataModel = tweetDataList[indexPath.row]
        cell.usernameLabel?.text = userNameDataModel.text
        cell.detailTextView?.text = tweetDataModel.text
        return cell
    }
}
