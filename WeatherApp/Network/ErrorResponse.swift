//
//  NetworkError.swift
//  API Demo
//
//  Created by Kodal, Ilayda(AWF) on 17.12.2020.
//  Copyright © 2020 Kodal, Ilayda(AWF). All rights reserved.
//

import Foundation

enum NetworkResult<T> {
    case success(T)
    case failure(NetworkError)
}

enum NetworkError: Error {
    case failedSession
    case invalidResponse 
    case invalidEntry //404
    case exceedingCallAllowance //429
    case unknown
}
