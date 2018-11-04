//
//  Response.swift
//  NetworkServiceLayer
//
//  Created by Sri Badrinath on 1/10/18.
//  Copyright © 2018 Sri Badrinath. All rights reserved.
//

import Foundation

// Enum : Response

public enum Response {
    
    case data (_ : Data)
    case error (_: Int?, _: Error?)
    
    init (_ response:(r : HTTPURLResponse?, data : Data?, error : Error?), for request : Request) {
        
        guard response.r?.statusCode == 200 , response.error == nil else {
            self = .error(response.r?.statusCode, response.error)
            return
        }
        
        guard let data = response.data else {
            self = .error(response.r?.statusCode,
                          nil)
            
            return
        }
        
       self = .data(data)
        
    }
}
