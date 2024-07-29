//
//  NetworkService.swift
//  NetworkService
//
//  Created by David Alarcon on 18/7/24.
//

import Foundation

enum NetworkError: Error {
  case invalidURL
  case requestFailed(Error)
  case invalidResponse
  case decodingFailed(Error)
}

class NetworkService {
  private let authorizationToken: String
  
  init(authorizationToken: String) {
    self.authorizationToken = authorizationToken
  }
  
  func request<T: Decodable>(_ endpoint: Endpoint, responseType: T.Type) async throws -> T {
    
    let request = try URLRequestAdapter(endpoint: endpoint).adapt()
    
    do {
      let (data, response) = try await URLSession.shared.data(for: request)
      
      guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
        throw NetworkError.invalidResponse
      }
      
      do {
        let decodedResponse = try JSONDecoder().decode(T.self, from: data)
        return decodedResponse
      } catch {
        throw NetworkError.decodingFailed(error)
      }
    } catch {
      throw NetworkError.requestFailed(error)
    }
  }
}
