//
//  SceneDelegate.swift
//  hw-12
//
//  Created by rbkuser on 15.07.2024.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        window?.rootViewController =  AlbumViewController()
        window?.makeKeyAndVisible()
    }
    
}

