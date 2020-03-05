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

protocol QiitaAllListView: AnyObject {}

final class QiitaAllListPresenter: QiitaAllListPresentetation {
    private weak var view: QiitaAllListView?
    private let router: QiitaAllListWireframe

    init(view: QiitaAllListView, router: QiitaAllListWireframe) {
        self.view = view
        self.router = router
    }

    func viewDidLoad() {}

    func didSelectRow(at indexPath: IndexPath) {
        router.showDetailArticle()
    }
}
