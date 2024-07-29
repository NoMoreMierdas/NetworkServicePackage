//
//  Endpoint.swift
//  NetworkService
//
//  Created by David Alarcon on 18/7/24.
//

import Foundation

import Foundation

enum Method: String {
  case get = "GET"
  case put = "PUT"
  case post = "POST"
  case delete = "DELETE"
  
  var string: String { rawValue }
}

protocol Endpoint {
  var scheme: String { get }
  var host: String { get }
  var baseURLString: String { get }
  var path: String { get }
  var method: Method { get }
  var parameters: [String: String]? { get }
  var headers: [String: String]? { get }
  var authorizationToken: String? { get set }
}
