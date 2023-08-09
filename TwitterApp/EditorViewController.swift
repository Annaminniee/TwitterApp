//
//  EditorViewController.swift
//  TwitterApp
//
//  Created by 菊地原杏菜 on 2023/08/06.
//

import UIKit

class EditorViewController: UIViewController {
    
    var text: String = ""

    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var tweetButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        displayData()
        configureTweetButton()
        setDoneButton()
    }
    
    func displayData() {
        textView.text = "ユーザー名"; text
    }
    
    func configureTweetButton() {
        tweetButton.layer.cornerRadius = 20.0
    }
    
    @IBAction func tapCancelButton(_ sender: UIButton) {
        transitionToHomeView()
    }
    
    @IBAction func tapTweetButton(_ sender: UIButton) {
        // TODO: 保存して閉じる処理
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
