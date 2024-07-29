//
//  URLRequestAdapter.swift
//  NetworkService
//
//  Created by David Alarcon on 18/7/24.
//

import Foundation

protocol Adapter {
  associatedtype Target
  
  func adapt() throws -> Target
}

class URLRequestAdapter {
  private let adaptee: Endpoint;
  
  init(endpoint: Endpoint) {
    self.adaptee = endpoint
  }
}

extension URLRequestAdapter: Adapter {
  func adapt() throws -> URLRequest {
    var components = URLComponents()
    components.scheme = adaptee.scheme
    components.host = adaptee.host
    components.path = adaptee.baseURLString + adaptee.path
    
    if adaptee.method == .get {
      components.queryItems = adaptee.parameters?.map { URLQueryItem(name: $0.key, value: $0.value) }
    }
    
    guard let url = components.url else { throw NetworkError.invalidURL }
    
    var request = URLRequest(url: url)
    request.httpMethod = adaptee.method.string
    
    if adaptee.method == .post, let parameters = adaptee.parameters {
      let jsonData = try JSONSerialization.data(withJSONObject: parameters, options: [])
      request.httpBody = jsonData
    }
    
    if let token = adaptee.authorizationToken {
      request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
    }
    
    if let headers = adaptee.headers {
      for header in headers {
        request.addValue(header.value, forHTTPHeaderField: header.key)
      }
    }
    
    return request
  }
}
