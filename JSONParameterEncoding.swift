//
//  JSONParameterEncoding.swift
//  PlayDayMeet
//
//  Created by Sri Badrinath on 22/10/18.
//  Copyright © 2018 Sri Badrinath. All rights reserved.
//

import Foundation

// Structure : JSONParameterEncoder
// Protocol : ParameterEncoder
// Responsible to encode parameter that passed on to the request with confirming the protocol


public struct JSONParameterEncoder: ParameterEncoder {
    
    // Method : Encode URL Request
    // Args : URLRequest, Parameters
    // Description : Creates URLRequest with encoding parameters that's been passed as JSON body. It also throws error while encoding.
    
    
    public func encode(urlRequest: inout URLRequest, with parameters: Parameters) throws {
        do {
            let jsonAsData = try JSONSerialization.data(withJSONObject: parameters, options: .prettyPrinted)
            urlRequest.httpBody = jsonAsData
            if urlRequest.value(forHTTPHeaderField: "Content-Type") == nil {
                urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
            }
        }catch {
            throw NetworkError.encodingFailed
        }
    }
}
