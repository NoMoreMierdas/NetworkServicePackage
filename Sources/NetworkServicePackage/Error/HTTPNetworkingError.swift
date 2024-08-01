//
//  HTTPNetworkingError.swift
//
//
//  Created by David Alarcon on 31/7/24.
//

import Foundation

public enum HTTPNetworkingError: Int, Error {
  // Successful Responses (200-299)
  case ok = 200 // TODO: Delete after refactor network
  
  // Redirection Messages (300-399)
  case multipleChoices = 300
  case movedPermanently
  case found
  case seeOther
  case notModified
  case useProxy
  case temporaryRedirect
  case permanentRedirect
  
  // Client Errors (400-499)
  case badRequest = 400
  case unauthorized
  case paymentRequired
  case forbidden
  case notFound
  case methodNotAllowed
  case notAcceptable
  case proxyAuthenticationRequired
  case requestTimeout
  case conflict
  case gone
  case lengthRequired
  case preconditionFailed
  case payloadTooLarge
  case uriTooLong
  case unsupportedMediaType
  case rangeNotSatisfiable
  case expectationFailed
  case imATeapot
  case misdirectedRequest
  case unprocessableEntity
  case locked
  case failedDependency
  case tooEarly
  case upgradeRequired
  case preconditionRequired
  case tooManyRequests
  case requestHeaderFieldsTooLarge = 431
  case unavailableForLegalReasons = 451
  
  // Server Errors (500-599)
  case internalServerError = 500
  case notImplemented
  case badGateway
  case serviceUnavailable
  case gatewayTimeout
  case httpVersionNotSupported
  case variantAlsoNegotiates
  case insufficientStorage
  case loopDetected
  case notExtended
  case networkAuthenticationRequired
  
  case unknown // TODO: Delete after refactoring
  
  var statusCode: Int {
    rawValue
  }
}
