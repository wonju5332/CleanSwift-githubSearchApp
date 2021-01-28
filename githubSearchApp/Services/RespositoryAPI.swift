//
//  RespositoryAPI.swift
//  githubSearchApp
//
//  Created by wjLee-PC on 2021/01/26.
//

import Foundation
import Moya

struct Const {
    static let token = "e95f0c4a783f153a02e6e550242d598467fcb381"
}

enum Github {
    case searchUser(query: String)
}
extension Github: TargetType {
    var baseURL: URL {
        return URL(string: "https://api.github.com")!
    }

    var path: String {
        switch self {
        case .searchUser:
            return "search/repositories"
        }
    }
    
    var method: Moya.Method {
        return .get
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        switch self {
        case .searchUser(let query):
            return .requestParameters(parameters: ["q" : query, "per_page" : 1], encoding: URLEncoding.default)
        }
    }
    
    var validationType: Moya.ValidationType {
        return .successAndRedirectCodes
    }
    
    var headers: [String : String]? {
        return ["accept" : "application/vnd.github.v3+json"]
//        return nil
    }
}

