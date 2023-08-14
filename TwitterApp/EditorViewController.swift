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
        userNameTextField.delegate = self
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
    
    @objc func tweetButtonTapped(with text: String) {
        let realm = try! Realm()
        try! realm.write {
            tweetData.text = text
            realm.add(tweetData)
        }
        print("text: \(tweetData.text)")
    }
}

extension EditorViewController: UITextViewDelegate {
    func textViewDidChange(_ textView: UITextView) {
        let updatedText = textView.text ?? ""
        tweetButtonTapped(with: updatedText)
    }
}

extension EditorViewController: UITextFieldDelegate {
    func userNameTextfieldDidChange(_ usernametextfield: UITextField) {
        let updatedText = usernametextfield.text ?? ""
        tweetButtonTapped(with: updatedText)
    }
}
