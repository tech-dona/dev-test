//
//  QiitaDetailArticleViewController.swift
//  dev-test
//
//  Created by donadona on 2020/03/05.
//  Copyright © 2020 lalala. All rights reserved.
//

import UIKit
import WebKit

protocol QiitaDetailArticleView: AnyObject {
    func show(article: Article)
}

class QiitaDetailArticleViewController: UIViewController {
    @IBOutlet private var webView: WKWebView!

    var presenter: QiitaDetailArticlePresentetation!

    let url: String? = nil

    override func viewDidLoad() {
        super.viewDidLoad()

        print("別画面")
        presenter.viewDidLoad()
    }
}

extension QiitaDetailArticleViewController: QiitaDetailArticleView {
    func show(article: Article) {
        if let url = URL(string: article.url) {
            print("読み込み")
            webView.load(URLRequest(url: url))
        }
    }
}
