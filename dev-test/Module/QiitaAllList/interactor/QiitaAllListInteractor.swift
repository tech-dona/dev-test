//
//  QiitaAllListInteractor.swift
//  dev-test
//
//  Created by donadona on 2020/03/05.
//  Copyright © 2020 lalala. All rights reserved.
//

import Foundation

protocol QiitaAllListInteractorInterface {
    func fetchAllList(keyword: String,
                      completion: @escaping (Result<[Article], Error>) -> Void)
}

final class QiitaAllListInteractor {
    private let qiitaAPI: QiitaAPIInterface

    init(qiitaAPI: QiitaAPIInterface = QiitaClient()) {
        self.qiitaAPI = qiitaAPI
    }
}

extension QiitaAllListInteractor: QiitaAllListInteractorInterface {
    func fetchAllList(keyword: String = "", completion: @escaping (Result<[Article], Error>) -> Void) {
        qiitaAPI.perform(keyword: keyword) { result in
            print(result)
            switch result {
            case let .success(articles):
                completion(.success(articles))
            case .failure:
                break
            }
        }
    }
}
