//
//  APIClient.swift
//  PersonalRecipes
//
//  Created by Javier Giner Alvarez on 04/05/2020.
//  Copyright © 2020 jginerafatimagc.com. All rights reserved.
//

import Foundation
import RxSwift

class APIClient {
    private let baseURL = URL(string: "http://localhost:4000/")!

    func send<T: Codable>(apiRequest: APIRequest) -> Observable<T> {
        Current.showLoading.accept(true)
        return Observable<T>.create { observer in
            let request = apiRequest.request(with: self.baseURL)
            let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
                do {
                    let model: T = try JSONDecoder().decode(T.self, from: data ?? Data())
                    observer.onNext(model)
                } catch let error {
                    observer.onError(error)
                }
                observer.onCompleted()
                Current.showLoading.accept(false)
            }
            task.resume()

            return Disposables.create {
                task.cancel()
            }
        }
    }
}
