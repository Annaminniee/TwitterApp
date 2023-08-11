//
//  EditorViewController.swift
//  TwitterApp
//
//  Created by 菊地原杏菜 on 2023/08/06.
//

import UIKit

class EditorViewController: UIViewController {
    
    var text: String = ""

    @IBOutlet weak var userName: UITextField!
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var tweetButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        displayData()
        setDoneButton()
        configureCancelButtonItem()
        configureBarButtonItems()
    }
    
    /// キャンセルボタンの設定
    func configureCancelButtonItem() {
        let closeButton = UIBarButtonItem(title: "キャンセル",
                                          style: .plain,
                                          target: self,
                                          action: #selector(closeButtonTapped))
        navigationItem.leftBarButtonItem = closeButton
    }
    
    @objc func closeButtonTapped() {
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
    
    func configureBarButtonItems() {
        let barButtonItem = UIBarButtonItem(customView: createCustomButton())
        navigationItem.rightBarButtonItem = barButtonItem
    }
    
    @objc func tweetButtonTapped() {
        // ボタンがタップされたときの処理をここに記述
        // TODO: 保存して閉じる処理
    }
    
    func displayData() {
        userName.text = "ユーザー名"
        textView.text = text
    }
    
    func transitionToHomeView() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let homeViewController = storyboard.instantiateInitialViewController() as?
                HomeViewController else { return }
        present(homeViewController, animated: true)
    }
    
    @objc func tapDoneButton() {
        view.endEditing(true)
    }
    
    func setDoneButton() {
        let toolBar = UIToolbar(frame: CGRect(x: 0, y: 0, width: 320, height: 40))
        let commitButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(tapDoneButton))
        toolBar.items = [commitButton]
        textView.inputAccessoryView = toolBar
    }
}
