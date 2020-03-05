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

    func showDetailArticle()
}

class QiitaAllListRouter: QiitaAllListWireframe {
    weak var viewController: UIViewController?

    private init(viewController: UIViewController?) {
        self.viewController = viewController
    }

    static func assembleModule() -> UIViewController {
        let view = R.storyboard.qiitaAllList().instantiateInitialViewController() as! QiitaAllListViewController
        let router = QiitaAllListRouter(viewController: view)

        let presenter = QiitaAllListPresenter(view: view, router: router)

        view.presenter = presenter

        return view
    }

    func showDetailArticle() {
        print(#function)
        viewController?.performSegue(withIdentifier: "toQiitaDetailArticle", sender: "")
//        let navview = R.storyboard.qiitaDetailArticle().instantiateInitialViewController() as! UINavigationController
//        let view = navview.topViewController as! QiitaDetailArticleViewController
//        viewController?.navigationController?.pushViewController(view, animated: true)
//        viewController?.present(view, animated: true, completion: nil)
    }
}
