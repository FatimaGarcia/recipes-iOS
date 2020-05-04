//
//  RecipesListViewController.swift
//  PersonalRecipes
//
//  Created by Javier Giner Alvarez on 03/05/2020.
//  Copyright © 2020 jginerafatimagc.com. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class RecipesListViewController: UIViewController {
    
    @IBOutlet weak var recipesTableView: UITableView!
    
    private let apiClient = APIClient()
    private let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        loadRecipes()
        setTableAction()
    }
    
    private func loadRecipes(){
        Current.recipes.map { _ in RecipesRequest() }
            .flatMap { request -> Observable<[RecipeModel]> in
                return self.apiClient.send(apiRequest: request)
            }
            .bind(to: recipesTableView.rx.items(cellIdentifier: "simpleCell")) { row, model, cell in
                cell.textLabel?.text = "\(model.name)"
        }
        .disposed(by: disposeBag)
    }
    
    private func setTableAction(){
        recipesTableView.rx.modelSelected(RecipeModel.self)
            .subscribe(onNext: { [weak self] model in
                guard let self = self else { return}
                let vc = UIViewController()
                vc.view.backgroundColor = .red
                let backItem = UIBarButtonItem()
                backItem.title = "Atrás"
                self.navigationItem.backBarButtonItem = backItem
                print("Seleccionado: \(model.name)")
                self.navigationController?.pushViewController(vc, animated: true)
            })
            .disposed(by: disposeBag)
    }
    
}

