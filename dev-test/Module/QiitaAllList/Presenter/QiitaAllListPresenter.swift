//
//  QiitaAllListPresenter.swift
//  dev-test
//
//  Created by donadona on 2020/03/04.
//  Copyright © 2020 lalala. All rights reserved.
//

import Foundation

protocol QiitaAllListPresentetation: AnyObject {
    func viewDidLoad()
    func didSelectRow(at indexPath: IndexPath)
}

protocol QiitaAllListView: AnyObject {
    func setQiitaAllList(_ articles: [Article])
}

final class QiitaAllListPresenter: QiitaAllListPresentetation {
    private weak var view: QiitaAllListView?
    private let router: QiitaAllListWireframe
    private let interactor: QiitaAllListInteractorInterface

    init(view: QiitaAllListView, interactor: QiitaAllListInteractorInterface, router: QiitaAllListWireframe) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }

    func viewDidLoad() {
        interactor.fetchAllList(keyword: "") { articles in
            switch articles {
            case let .success(articles):
                self.view?.setQiitaAllList(articles)
            case .failure:
                break
            }
        }
    }

    func didSelectRow(at indexPath: IndexPath) {
        router.showDetailArticle()
    }
}
