//
//  QiitaAllListViewController.swift
//  dev-test
//
//  Created by donadona on 2020/03/04.
//  Copyright © 2020 lalala. All rights reserved.
//

import UIKit

class QiitaAllListViewController: UIViewController {
    @IBOutlet var qiitaAllListTable: UITableView!
    var presenter: QiitaAllListPresentetation!

    override func viewDidLoad() {
        super.viewDidLoad()

        print("aaa")
        
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
        return 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "QiitaCell", for: indexPath)

        cell.textLabel?.text = "aaaa"
        cell.detailTextLabel?.text = "bbb\nccccc"

        return cell
    }
}

extension QiitaAllListViewController: QiitaAllListView {}
