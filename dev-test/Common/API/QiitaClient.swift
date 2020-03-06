//
//  QiitaClient.swift
//  dev-test
//
//  Created by donadona on 2020/03/06.
//  Copyright © 2020 lalala. All rights reserved.
//

import Alamofire
import Foundation

protocol QiitaAPIInterface {
    func perform(keyword: String, completion: @escaping (Result<[Article], Error>) -> Void)
}

class QiitaClient {}

extension QiitaClient: QiitaAPIInterface {
    func perform(keyword: String, completion: @escaping (Result<[Article], Error>) -> Void) {
        AF.request(QiitaAPI.url, method: .get, parameters: .none, headers: nil)
            .response { response in
                guard let data = response.data else { return }
                do {
                    let article = try JSONDecoder().decode([Article].self, from: data)
                    completion(.success(article))
                } catch {
                    completion(.failure(error))
                }
            }
    }
}

struct QiitaResponse: Codable {
    let items: [Article]
}
