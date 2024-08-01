//
//  HTTPMethod.swift
//
//
//  Created by David Alarcon on 31/7/24.
//

import Foundation

public enum HTTPMethod: String {
  case get = "GET"
  case put = "PUT"
  case post = "POST"
  case delete = "DELETE"
  
  var string: String { rawValue }
}
