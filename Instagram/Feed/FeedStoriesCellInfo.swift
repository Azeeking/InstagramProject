//
//  FeedStoriesCellInfo.swift
//  Instagram
//
//  Created by Azik on 01.02.2023.
//

import Foundation
import UIKit

struct FeedStoriesItemCellInfo {
    let image : UIImage
    let username : String
    let isAddButtonVisible : Bool
    let isNewStory : Bool
}

typealias FeedStoriesCellInfo = [FeedStoriesItemCellInfo]
