//
//  Task.swift
//  NetworkServiceLayer
//
//  Created by Sri Badrinath on 12/9/18.
//  Copyright © 2018 Sri Badrinath. All rights reserved.
//

import Foundation

// Typealias for dictionary headers named under HTTPHeaders
public typealias HTTPHeaders = [String:String]

// Enum : Task
// Responsible for type of task is perfomed for request.
public enum Task {
    
    // A request only case
    case request
    
    // A request parameter case has associated type of information on
    // BodyParameters, Encoding Type and URL Parameters
    
    case requestParameters (bodyParameters : Parameters?,
        bodyEncoding : ParameterEncoding,
        urlParameters : Parameters?)
}
