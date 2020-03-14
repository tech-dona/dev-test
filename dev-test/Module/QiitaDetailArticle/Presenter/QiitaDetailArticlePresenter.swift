//
//  QiitaDetailArticlePresenter.swift
//  dev-test
//
//  Created by donadona on 2020/03/07.
//  Copyright © 2020 lalala. All rights reserved.
//

import Foundation

protocol QiitaDetailArticlePresentetation {
    func viewDidLoad()
}

class QiitaDetailArticlePresenter {
    private weak var view: QiitaDetailArticleView?
    private let router: QiitaDetailArticleWireframe
    private let article: Article

    init(view: QiitaDetailArticleView, router: QiitaDetailArticleWireframe, article: Article) {
        self.view = view
        self.router = router
        self.article = article
    }
}

extension QiitaDetailArticlePresenter: QiitaDetailArticlePresentetation {
    func viewDidLoad() {
        view?.show(article: article)
    }
}
