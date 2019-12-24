//
//  AppDelegate.swift
//  RestaurantApp
//
//  Created by mac on 11/5/19.
//  Copyright © 2019 mac. All rights reserved.
//
import Foundation
import Moya

//#error("Enter a Yelp API key by visiting yelp.com/developers .")
private let apiKey = "L0zB--b0PdEvo6y-4IPEuXelfS2uBPlq2XN2KdB8VxuCCnAWBgzGb6xs1zk5jt5JYEVtfrJ9b2NJm0z3Hk2uL4UM8BNMzsL2r1dBcw6zW2EWpzCtj2TeJzvrbzHZXXYx"

enum YelpService {
    enum BusinessesProvider: TargetType {
        case search(lat: Double, long: Double)
        case details(id: String)
        
        var baseURL: URL {
            return URL(string: "https://api.yelp.com/v3/businesses")!
        }

        var path: String {
            switch self {
            case .search:
                return "/search"
            case let .details(id):
                return "/\(id)"
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
            case let .search(lat, long):
                return .requestParameters(
                    parameters: ["latitude": lat, "longitude": long, "limit": 10], encoding: URLEncoding.queryString)
            case .details:
                return .requestPlain
            }
            
        }

        var headers: [String : String]? {
            return ["Authorization": "Bearer \(apiKey)"]
        }
    }
}
