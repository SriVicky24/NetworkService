//
//  ParameterEncoding.swift
//  NetworkServiceLayer
//
//  Created by Sri Badrinath on 12/9/18.
//  Copyright © 2018 Sri Badrinath. All rights reserved.
//

import Foundation

// A alias for DIctionary Parameters
public typealias Parameters = [String : Any]

// Protocol : Parameter Encoder
// Responsible for the inheriting class to confirm the protocol which encodes url request with parameters

public protocol ParameterEncoder {
    
    // Method : Encode URL Request
    // Args : URLRequest, Parameters
    // Throws : Throws Encoding Error
    
    func encode(urlRequest : inout URLRequest, with parameters : Parameters) throws
}

//  Enum : Parameter Encoder Error
public enum NetworkError : String, Error {
    case parametersNil = "Parameters were nil."
    case encodingFailed = "Parameter encoding failed"
    case missingURL = "URL is nil"
}


public enum ParameterEncoding {
    case urlEncoding
    case jsonEncoding
    case none
    
    public func encode(urlRequest : inout URLRequest,
                       urlParameters : Parameters?,
                       bodyParameters : Parameters?) throws {
        
        do {
            switch self {
            case .urlEncoding:
                guard let urlParameters = urlParameters else { return }
                try URLParameterEncoder().encode(urlRequest: &urlRequest, with: urlParameters)
            case .jsonEncoding:
                guard let bodyParameters = bodyParameters else { return }
                try JSONParameterEncoder().encode(urlRequest: &urlRequest, with: bodyParameters)
            case .none:
                break
            }
            
        }
        catch {
            throw error
        }
    }
}
