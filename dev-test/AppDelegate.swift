//
//  AppDelegate.swift
//  dev-test
//
//  Created by donadona on 2020/03/02.
//  Copyright © 2020 lalala. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    let rootRouter = RootRouter(window: UIWindow(frame: UIScreen.main.bounds))

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        rootRouter.showFirstView()

        return true
    }
}
