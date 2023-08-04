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
    @IBOutlet weak var addButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configTableView()
        configureButton()
        navigationItem.title = "おすすめ"
    }
        
    func configTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.tableFooterView = UIView()
        setTweetData()
        //カスタムセル
        let nib = UINib(nibName: "TweetTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "Cell")
    }
    
    func configureButton() {
        addButton.layer.cornerRadius = addButton.bounds.width / 2
    }
    
    func setTweetData() {
        let tweetDataModel1 = TweetDataModel(name: "ユーザー名1", text: "ツイート内容1, ツイート内容1,ツイート内容1,ツイート内容1,ツイート内容1,ツイート内容1,ツイート内容1,ツイート内容1")
        let tweetDataModel2 = TweetDataModel(name: "ユーザー名2", text: "ツイート内容2")
        let tweetDataModel3 = TweetDataModel(name: "ユーザー名3", text: "ツイート内容3")
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
        // 再利用可能な cell を得る
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! TweetTableViewCell
        let tweetDataModel: TweetDataModel = tweetDataList[indexPath.row]
        cell.setup(username: tweetDataModel.name, detail: tweetDataModel.text)
        // ここにセルに渡す処理を書く
        return cell
    }
}

// MARK: - UITableViewDelegate

extension HomeViewController: UITableViewDelegate {
    /// セルの高さを設定するメソッド
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
