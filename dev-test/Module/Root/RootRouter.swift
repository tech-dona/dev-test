//
//  RootRouter.swift
//  dev-test
//
//  Created by donadona on 2020/03/04.
//  Copyright © 2020 lalala. All rights reserved.
//

import UIKit

class RootRouter {
    private let window: UIWindow

    init(window: UIWindow) {
        self.window = window
    }

    func showFirstView() {
        let firstView = QiitaAllListRouter.assembleModule()

        window.rootViewController = firstView
        window.makeKeyAndVisible()
    }
}
