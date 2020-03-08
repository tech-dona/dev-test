//
//  QiitaAllListRouter.swift
//  dev-test
//
//  Created by donadona on 2020/03/04.
//  Copyright © 2020 lalala. All rights reserved.
//

import UIKit

protocol QiitaAllListWireframe {
    var viewController: UIViewController? { get set }

    func showDetailArticle(_ article: Article)
}

class QiitaAllListRouter: QiitaAllListWireframe {
    weak var viewController: UIViewController?

    private init(viewController: UIViewController?) {
        self.viewController = viewController
    }

    static func assembleModule() -> UIViewController {
        let view = R.storyboard.qiitaAllList().instantiateInitialViewController() as! QiitaAllListViewController
        let router = QiitaAllListRouter(viewController: view)
        let interactor = QiitaAllListInteractor()

        let presenter = QiitaAllListPresenter(view: view, interactor: interactor, router: router)

        view.presenter = presenter

        return view
    }

    func showDetailArticle(_ article: Article) {
        let detailArticleVC = QiitaDetailArticleRouter.assembleModules(article: article) as! QiitaDetailArticleViewController

        viewController?.present(detailArticleVC, animated: true, completion: nil)

    }
}
