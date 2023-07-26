//
//  HomeViewController.swift
//  TwitterApp
//
//  Created by 菊地原杏菜 on 2023/07/23.
//

import UIKit

class HomeViewController: UIViewController {
    
    var tweetDataList: [TweetDataModel] = []
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "おすすめ"
        
        tableView.dataSource = self
        tableView.tableFooterView = UIView()
        setTweetData()
        tableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "TableViewCell")
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
        return tweetDataList.count
    }
    /// 各セルの内容を返すメソッド
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as! TableViewCell
        let tweetDataModel: TweetDataModel = tweetDataList[indexPath.row]
        cell.textLabel?.text = tweetDataModel.text
        return cell
    }
}
