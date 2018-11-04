//
//  Operation.swift
//  NetworkServiceLayer
//
//  Created by Sri Badrinath on 1/10/18.
//  Copyright © 2018 Sri Badrinath. All rights reserved.
//

import Foundation

public typealias RequestCompletion = (_ response : Response) -> ()

// Protocol : Operation

protocol Operation {
    
    associatedtype RequestType : Request
    
    func execute(request : RequestType, completion:@escaping RequestCompletion) throws
    
    func cancel()
    
}
