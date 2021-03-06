//
//  GithubAPI.swift
//  githubSearchApp
//
//  Created by wjLee-PC on 2021/01/28.
//

import Foundation
import Moya

class GithubAPI:RepositoryListEntityHandler{
    
    let provider = MoyaProvider<Github>()
    
    func fetchRepository(query: String, completion: @escaping ([Repository]) -> Void) {
        provider.request(.searchUser(query: query)) { [weak self] result in
            guard let strongSelf = self else { return }
            switch result{
            case .success(let res):
                do {
                    let dict = try JSONSerialization.jsonObject(with: res.data, options: []) as? [String:AnyObject]
                    let result = try strongSelf.mapper(dict: dict)
                    completion(result)
                } catch {
                    completion([])
                    // api 호출횟수 초과에 따른 대응 ?
                }
                break
            case .failure(let _):
                completion([])
                break
            }
        }
    }
    private func mapper(dict:[String:AnyObject]?) throws -> [Repository] {
        guard let dict = dict else { throw DataError.nonExistData }
        guard let items = dict["items"] as? [[String:AnyObject]] else { throw DataError.nonExistData }
        
        var repositories:[Repository] = []
        do {
            try items.forEach { (itemDict) in
                guard let owner = itemDict["owner"] as? [String:AnyObject] else { throw DataError.nonExistData }
                guard let fullName = itemDict["full_name"] as? String else { throw DataError.nonExistData }
                guard let starCount = itemDict["stargazers_count"] as? Int else { throw DataError.nonExistData }
                guard let id = owner["id"] as? Int else { throw DataError.nonExistData }
                guard let htmlUrl = owner["url"] as? String else { throw DataError.nonExistData }
                let desc = itemDict["description"] as? String // nil ok
                let respository = Repository(id: id, fullName: fullName, description: desc, stargazersCount: starCount, htmlUrl: htmlUrl)
                repositories.append(respository)
            }
        } catch {
            throw DataError.nonExistData
        }
        return repositories
    }
}
