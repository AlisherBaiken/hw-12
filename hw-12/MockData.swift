//
//  TestData.swift
//  hw-12
//
//  Created by rbkuser on 19.07.2024.
//

import UIKit

struct MockData {
    static let shared = MockData()
    
    let albums: [SectionItem] = [
        SectionItem(image: UIImage(named: "nat")!, title: "Recent", subTitle: "235"),
        SectionItem(image: UIImage(named: "nat4")!, title: "Wallpapers", subTitle: "5"),
        SectionItem(image: UIImage(named: "nat3")!, title: "Paris", subTitle: "23"),
        SectionItem(image: UIImage(named: "nat2")!, title: "Instagram", subTitle: "54"),
        SectionItem(image: UIImage(named: "london")!, title: "Place", subTitle: "21"),
        SectionItem(image: UIImage(named: "ind")!, title: "Singapore", subTitle: "76"),
        SectionItem(image: UIImage(named: "ala")!, title: "Whats App", subTitle: "46"),
        SectionItem(image: UIImage(named: "pepnat")!, title: "Food", subTitle: "4")
    ]
    
    let peopleAndPlaces: [SectionItem] = [
        SectionItem(image: UIImage(named: "people")!, title: "People", subTitle: "5"),
        SectionItem(image: UIImage(named: "pepnat")!, title: "Places", subTitle: "90"),
        SectionItem(image: UIImage(named: "square")!, title: "Square", subTitle: "13")
    ]
    
    let mediaTypes: [MediaFileTypeItem] = [
        MediaFileTypeItem(tittle: "Video", image: UIImage(systemName: "video")!, type: SubtitleType.text("5"), accessoryImage: UIImage(systemName: "chevron.compact.right")!),
        MediaFileTypeItem(tittle: "Selfie", image: UIImage(systemName: "person.crop.square")!, type: SubtitleType.text("15"), accessoryImage: UIImage(systemName: "chevron.compact.right")!),
        MediaFileTypeItem(tittle: "Live Photo", image: UIImage(systemName: "livephoto")!, type: SubtitleType.text("10"), accessoryImage: UIImage(systemName: "chevron.compact.right")!),
        MediaFileTypeItem(tittle: "Portraits", image: UIImage(systemName: "f.cursive.circle")!, type: SubtitleType.text("3"),  accessoryImage: UIImage(systemName: "chevron.compact.right")!),
        MediaFileTypeItem(tittle: "Panoramas", image: UIImage(systemName: "pano")!, type: SubtitleType.text("7"), accessoryImage: UIImage(systemName: "chevron.compact.right")!),
        MediaFileTypeItem(tittle: "Timelapse", image: UIImage(systemName: "timelapse")!, type: SubtitleType.text("2"), accessoryImage: UIImage(systemName: "chevron.compact.right")!),
        MediaFileTypeItem(tittle: "Slowmotion", image: UIImage(systemName: "slowmo")!, type: SubtitleType.text("1"), accessoryImage: UIImage(systemName: "chevron.compact.right")!),
        MediaFileTypeItem(tittle: "Movie effect", image: UIImage(systemName: "arrow.up.right.video")!, type: SubtitleType.text("18"),  accessoryImage: UIImage(systemName: "chevron.compact.right")!),
        MediaFileTypeItem(tittle: "Screenshots", image: UIImage(systemName: "camera.viewfinder")!, type: SubtitleType.text("65"),  accessoryImage: UIImage(systemName: "chevron.compact.right")!),
        MediaFileTypeItem(tittle: "Screen captures", image: UIImage(systemName: "record.circle")!, type: SubtitleType.text("21"), accessoryImage: UIImage(systemName: "chevron.compact.right")!),
        MediaFileTypeItem(tittle: "Animated", image: UIImage(systemName: "square.stack.3d.forward.dottedline")!, type: SubtitleType.text("17"), accessoryImage: UIImage(systemName: "chevron.compact.right")!),
        MediaFileTypeItem(tittle: "RAW", image: UIImage(systemName: "r.square.on.square")!, type: SubtitleType.text("5"), accessoryImage: UIImage(systemName: "chevron.compact.right")!),
    ]
    
    let others: [MediaFileTypeItem] = [
        MediaFileTypeItem(tittle: "Imported", image: UIImage(systemName: "square.and.arrow.down")!, type: SubtitleType.text("10"), accessoryImage: UIImage(systemName: "chevron.compact.right")!),
        MediaFileTypeItem(tittle: "Hidden", image: UIImage(systemName: "eye.slash")!, type: SubtitleType.iconImage(UIImage(systemName: "lock.fill")!), accessoryImage: UIImage(systemName: "chevron.compact.right")!),
        MediaFileTypeItem(tittle: "Recently deleted", image: UIImage(systemName: "trash")!, type: SubtitleType.iconImage(UIImage(systemName: "lock.fill")!), accessoryImage: UIImage(systemName: "chevron.compact.right")!)
        
    ]
}

struct PhotoAssets {
    static let mediaStore = [
        "nat", "nat2", "nat3", "nat4", "ala",
        "ind", "london", "people", "pepnat"
    ]
    
    static let forYouAlbum = ["ala", "ind", "london", "pepnat", "nat"]
    static let searchAlbum = ["nat", "nat2", "nat3", "nat4", "people"]
    
}

