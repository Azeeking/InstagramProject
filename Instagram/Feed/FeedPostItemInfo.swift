//
//  FeedPostItemInfo.swift
//  Instagram
//
//  Created by Azik on 01.02.2023.
//

import Foundation
import UIKit

struct FeedPostItemInfo {
    let userImage : UIImage
    let username : String
    let postSubtitle : String
    let postImage : UIImage
    let numberOfLikes : Int
    let comment: CommentShortInfo?
}

struct CommentShortInfo {
    let username : String
    let commentText : String
}
