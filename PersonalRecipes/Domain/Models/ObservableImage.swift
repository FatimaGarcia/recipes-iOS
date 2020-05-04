//
//  ObservableImage.swift
//  PersonalRecipes
//
//  Created by Javier Giner Alvarez on 04/05/2020.
//  Copyright © 2020 jginerafatimagc.com. All rights reserved.
//

import Foundation
import UIKit
import RxSwift

class ObservableImage: UIImageView {
    let disposeBag = DisposeBag()
    
    func fetchImage(from url: String){
        guard let url = URL(string: url) else { return }
        self.downloadImage(url)
            .bind(to: self.rx.image)
            .disposed(by: disposeBag)
    }
    
    private func downloadImage(_ url: URL) -> Observable<UIImage?> {
        let urlRequest = URLRequest(url: url)
        return URLSession.shared.rx
            .data(request: urlRequest)
            .map { data in UIImage(data: data) }
            .catchErrorJustReturn(UIImage(named: "food"))
    }
}
