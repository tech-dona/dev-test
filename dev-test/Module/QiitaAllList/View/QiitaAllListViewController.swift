//
//  QiitaAllListViewController.swift
//  dev-test
//
//  Created by donadona on 2020/03/04.
//  Copyright © 2020 lalala. All rights reserved.
//

import Alamofire
import UIKit

class QiitaAllListViewController: UIViewController {
    @IBOutlet private var qiitaAllListTable: UITableView!

    var presenter: QiitaAllListPresentetation!

    private var articles: [Article] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        presenter.viewDidLoad()

        qiitaAllListTable.estimatedRowHeight = 60
        qiitaAllListTable.rowHeight = UITableView.automaticDimension
    }
}

extension QiitaAllListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter.didSelectRow(at: indexPath)
    }
}

extension QiitaAllListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articles.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "QiitaCell", for: indexPath)

        cell.textLabel?.text = articles[indexPath.row].title
        cell.detailTextLabel?.text = articles[indexPath.row].user.id.description

        return cell
    }
}

extension QiitaAllListViewController: QiitaAllListView {
    func setQiitaAllList(_ articles: [Article]) {
        self.articles = articles
        qiitaAllListTable.reloadData()
    }
}
