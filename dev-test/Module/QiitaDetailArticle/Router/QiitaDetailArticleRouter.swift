//
//  QiitaDetailArticleRouter.swift
//  dev-test
//
//  Created by donadona on 2020/03/07.
//  Copyright © 2020 lalala. All rights reserved.
//

import UIKit

protocol QiitaDetailArticleWireframe: class {}

class QiitaDetailArticleRouter {
    weak var viewController: UIViewController?

    private init(viewController: UIViewController) {
        self.viewController = viewController
    }

    static func assembleModules(article: Article) -> UIViewController {
        let view = R.storyboard.qiitaDetailArticle().instantiateInitialViewController() as! QiitaDetailArticleViewController
        let router = QiitaDetailArticleRouter(viewController: view)
        let presenter = QiitaDetailArticlePresenter(view: view, router: router, article: article)

        view.presenter = presenter

        return view
    }
}

extension QiitaDetailArticleRouter: QiitaDetailArticleWireframe {}
