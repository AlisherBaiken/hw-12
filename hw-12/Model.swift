//
//  Model.swift
//  hw-12
//
//  Created by rbkuser on 16.07.2024.
//

import UIKit

struct SectionItem {
    let image: UIImage
    let title: String
    let subTitle: String
}

enum SubtitleType {
    case text(String)
    case iconImage(UIImage)
}

struct MediaFileTypeItem {
    let tittle: String
    let image: UIImage
    let type: SubtitleType
    let accessoryImage: UIImage
}

enum Orientation {
    case horizontal, vertical
}
