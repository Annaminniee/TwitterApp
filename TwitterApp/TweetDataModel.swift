//
//  TweetDataModel.swift
//  TwitterApp
//
//  Created by 菊地原杏菜 on 2023/07/26.
//

import Foundation
import RealmSwift

class TweetDataModel: Object {
    @Persisted var id: String = UUID().uuidString //データを一意に識別するための識別子
    @Persisted var name: String = ""
    @Persisted var text: String = ""
}
