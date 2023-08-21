//
//  EditorViewController.swift
//  TwitterApp
//
//  Created by 菊地原杏菜 on 2023/08/06.
//

import UIKit
import RealmSwift

class EditorViewController: UIViewController {
    
    var tweetData = TweetDataModel()

    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var textView: PlaceTextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureCancelButtonItem()
        configureTweetButtonItem()
        textView.placeHolder = "いまどうしてる？"
        textView.delegate = self
    }
    
    /// キャンセルボタンの設定
    func configureCancelButtonItem() {
        let cancelButton = UIBarButtonItem(title: "キャンセル",
                                          style: .plain,
                                          target: self,
                                          action: #selector(cancelButtonTapped))
        navigationItem.leftBarButtonItem = cancelButton
    }
    
    @objc func cancelButtonTapped() {
        // 前の画面に戻る
        dismiss(animated: true, completion: nil)
    }
    
    // ツイートボタンの設定
    func createCustomButton() -> UIButton {
        let customButton = UIButton(type: .custom)
        customButton.setTitle("ツイートする", for: .normal)
        customButton.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        customButton.backgroundColor = UIColor.systemBlue
        customButton.layer.cornerRadius = 16
        customButton.addTarget(self,
                               action: #selector(tweetButtonTapped),
                               for: .touchUpInside)
        customButton.frame = CGRect(x: 0, y: 0, width: 115, height: 32)
        return customButton
    }
    
    func configureTweetButtonItem() {
        let barButtonItem = UIBarButtonItem(customView: createCustomButton())
        navigationItem.rightBarButtonItem = barButtonItem
    }
    
    /// 「ツイートする」ボタンをタップ
    @objc func tweetButtonTapped() {
        guard let userName = self.userNameTextField.text,
              let tweetText = self.textView.text else { return }
        
        if userName.isEmpty || tweetText.isEmpty {
            showAlert()
        } else {
            saveData(userName: userName, tweetText: tweetText)
            // 前の画面に戻る
            dismiss(animated: true, completion: nil)
        }
    }
    
    /// アラートを表示
    func showAlert() {
        let alert = UIAlertController(title: "項目が空です",
                                      message: "ユーザー名とツイート文を入力してください。",
                                      preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        self.present(alert, animated: true, completion: nil)
    }
    
    /// データを保存
    func saveData(userName: String, tweetText: String) {
        let realm = try! Realm()
        try! realm.write {
            tweetData.name = userName
            tweetData.text = tweetText
            realm.add(tweetData)
        }
    }
}

// MARK: - Extension UITextViewDelegate
extension EditorViewController: UITextViewDelegate {
    
    /// textview文字数制限
    func textView(_ textView: UITextView,
                  shouldChangeTextIn range: NSRange,
                  replacementText text: String) -> Bool {
        // 140文字以下の場合
        if textView.text.count + (text.count - range.length) <= 140 {
            // 入力を続ける
            return true
        } else {
            // 文字数制限アラートを表示
            showCharacterLimitAlert()
            // 入力を止める
            return false
        }
    }
    
    /// アラートを表示
    func showCharacterLimitAlert() {
        let alert = UIAlertController(title: "文字数制限オーバー",
                                      message: "ツイートは140文字以内にしてください。",
                                      preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        self.present(alert, animated: true, completion: nil)
    }
}
