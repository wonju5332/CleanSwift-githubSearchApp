//
//  RepositoryListWorker.swift
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

protocol RepositoryListEntityHandler {
    func fetchRepository(query:String,completion:@escaping ([Repository]) -> Void)
}

class RepositoryListWorker
{
    let networkAPI:RepositoryListEntityHandler = GithubAPI()
    func fetchRepository(query:String,completion:@escaping ([Repository]) -> Void){
        networkAPI.fetchRepository(query: query, completion: completion)
    }
}
enum DataError:Error {
    case nonExistData
}
