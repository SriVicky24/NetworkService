//
//  Request.swift
//  NetworkServiceLayer
//
//  Created by Sri Badrinath on 12/9/18.
//  Copyright © 2018 Sri Badrinath. All rights reserved.
//

import Foundation

// Enum : HTTPMethod
// Description: HTTP Request method. Is an enum containing type of method that is been requested against endpoint url.


public enum HTTPMethod : String {
    case get = "GET"
    case post = "POST"
    case delete = "DELETE"
    case update = "PUT"
}


// Protocol : Request

// Description : Base protocol for network request.

public protocol Request {
    
    // A base url for endpoint
    var baseURL : URL { get }
    
    // A request path for enpoint url
    var path : String { get }
    
    // A method for the reqeust
    var method : HTTPMethod { get }
    
    // A type of task for the request
    var task : Task { get }
    
    // Contains header information for the request
    var headers : HTTPHeaders? { get }
    
}
