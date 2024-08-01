//
//  Endpoint.swift
//  GithubUsers
//
//  Created by David Alarcon on 9/7/24.
//

import Foundation

typealias HTTPParameter = [String: String]

protocol Endpoint {
  var scheme: String { get }
  var host: String { get }
  var baseURLString: String { get }
  var path: String { get }
  var method: HTTPMethod { get }
  var parameters: [HTTPParameter]? { get }
  var headers: [HTTPHeader]? { get }
}
