//
//  QiitaAllListViewController.swift
//  dev-test
//
//  Created by donadona on 2020/03/04.
//  Copyright © 2020 lalala. All rights reserved.
//

import Alamofire
import SDWebImage
import SkeletonView
import UIKit

class QiitaAllListViewController: UIViewController {
    @IBOutlet private var qiitaAllListTable: UITableView!

    var presenter: QiitaAllListPresentetation!

    // キャッシュがない場合の画像
    let emptyImage = UIImage()

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

        cell.imageView?.showAnimatedSkeleton()

        cell.imageView?.sd_setImage(with: URL(string: articles[indexPath.row].user.iconUrl)) { [weak self] _, _, _, _ in

            cell.imageView?.hideSkeleton()
            cell.setNeedsLayout()
        }

        return cell
    }
}

extension QiitaAllListViewController: QiitaAllListView {
    func setQiitaAllList(_ articles: [Article]) {
        self.articles = articles
        qiitaAllListTable.reloadData()
    }
}

// 文字列からURLを生成
extension UIImage {
    public convenience init(url: String) {
        let url = URL(string: url)
        do {
            let data = try Data(contentsOf: url!)
            self.init(data: data)!
            return
        } catch let err {
            print("Error : \(err.localizedDescription)")
        }
        self.init()
    }
}
