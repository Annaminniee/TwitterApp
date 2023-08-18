//
//  EditorViewController.swift
//  TwitterApp
//
//  Created by 菊地原杏菜 on 2023/08/06.
//

import UIKit
import RealmSwift

class EditorViewController: UIViewController, UITextViewDelegate {
    
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
    //textview文字数制限
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        return textView.text.count + (text.count - range.length) <= 140 //140文字に制限
    }
    
    func onValidation(text: Int) {
        if text > 0 {
            tweetData = TweetDataModel()
        } else if text == 0 {
            //投稿できない
            //警告文を出す
        }
    }
    
    @objc func tweetButtonTapped() {
        let realm = try! Realm()
        try! realm.write {
            tweetData.name = self.userNameTextField.text ?? ""
            tweetData.text = self.textView.text ?? ""
            realm.add(tweetData)
            // 前の画面に戻る
            dismiss(animated: true, completion: nil)
        }
    }
}
