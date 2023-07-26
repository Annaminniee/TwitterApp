//
//  HomeViewController.swift
//  TwitterApp
//
//  Created by 菊地原杏菜 on 2023/07/23.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var tweetDataList: [TweetDataModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "おすすめ"
        print("HomeViewControllerが表示されました！")
        
        tableView.dataSource = self
        tableView.tableFooterView = UIView()
        setTweetData()
    }
    
    func setTweetData() {
        for i in 1...3 {
            let tweetDataModel = TweetDataModel(text: "ツイート内容")
            tweetDataList.append(tweetDataModel)
        }
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    /// データの数（＝セルの数）を返すメソッド
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tweetDataList.count
    }
    /// 各セルの内容を返すメソッド
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let tweetDataModel: TweetDataModel = tweetDataList[indexPath.row]
        cell.textLabel?.text = tweetDataModel.text
        return cell
    }
}
