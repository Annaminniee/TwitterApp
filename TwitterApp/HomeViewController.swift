//
//  HomeViewController.swift
//  TwitterApp
//
//  Created by 菊地原杏菜 on 2023/07/23.
//

import UIKit
import RealmSwift

class HomeViewController: UIViewController {
    
    var tweetDataList: [TweetDataModel] = []
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var addButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        configureButton()
        navigationItem.title = "おすすめ"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setTweetData()
        tableView.reloadData()
    }
    
    // ツイートボタンを押した処理
    @IBAction func tapAddButton(_ sender: UIButton) {
        let vc = EditorViewController()
        let navi = UINavigationController(rootViewController: vc)
        navi.modalPresentationStyle = .fullScreen
        navigationController?.present(navi, animated: true)
    }
    
    func configureTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.tableFooterView = UIView()
        //カスタムセル
        let nib = UINib(nibName: "TweetTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "Cell")
    }
    
    func configureButton() {
        addButton.layer.cornerRadius = addButton.bounds.width / 2
    }
    
    func transitionToEditorView() {
        let vc = EditorViewController()
        let navi = UINavigationController(rootViewController: vc)
        navi.modalPresentationStyle = .fullScreen
        navigationController?.present(navi, animated: true)
    }
    
    func setTweetData() {
        let realm = try! Realm()
        let result = realm.objects(TweetDataModel.self)
        tweetDataList = Array(result)
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
