//
//  NetworkError.swift
//
//
//  Created by David Alarcon on 29/7/24.
//

import Foundation

import Foundation

public enum NetworkError: Error {
  case unknown
  case noURL
  case couldNotParse
  case invalidError
  case noData
  case noResponse
  case requestFailed(Error)
  case noRequest
  case noHTTPURLResponse
  case invalidImageData
  
  // MARK: - HTTP Status Code errors
  case httpError(HTTPNetworkingError)
  
  // MARK: - URL Errors
  case urlError(URLError)
}
