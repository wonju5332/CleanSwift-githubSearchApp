//
//  RepositoryListInteractor.swift
//  githubSearchApp
//
//  Created by wjLee-PC on 2021/01/26.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol RepositoryListBusinessLogic
{
  func fetchRepositoryies(request: RepositoryList.Fetch.Request)
}

protocol RepositoryListDataStore
{
    var repository:[Repository]? {get}
  //var name: String { get set }
}

class RepositoryListInteractor: RepositoryListBusinessLogic, RepositoryListDataStore
{
  var presenter: RepositoryListPresentationLogic?
  var worker: RepositoryListWorker?
  var repository: [Repository]?
  // MARK: Do something
  
    func fetchRepositoryies(request: RepositoryList.Fetch.Request)
  {
    
        if worker == nil {
            worker = RepositoryListWorker()
        }
        
        worker?.fetchRepository(query: request.query, completion: {[weak self] (repositories) in
            guard let strongSelf = self else { return }
            let response = RepositoryList.Fetch.Response(repositories: repositories)
            strongSelf.presenter?.presentSomething(response: response)
        })
  }
}
