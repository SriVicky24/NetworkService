//
//  Router.swift
//  NetworkServiceLayer
//
//  Created by Sri Badrinath on 1/10/18.
//  Copyright © 2018 Sri Badrinath. All rights reserved.
//

import Foundation


// Class : Router
// Router class is responsible to execute the request that's been initiated by Network Manager
// Creates session, executes and also cancel the request.



class Router <RequestType : Request> : Operation {
    
    // A variable has a sessionTask of URLSessionTask Type
    private var sessionTask : URLSessionTask?
    
    func execute(request: RequestType, completion: @escaping RequestCompletion) throws {
        
        let session = URLSession.shared
        
        do {
            
            let requestURL = try self.buildRequest(from : request)
            sessionTask = session.dataTask(with: requestURL, completionHandler: { (data, response, error) in
                let response = Response((response as? HTTPURLResponse, data, error),
                                        for: request)
                completion(response)
            })
            
        }
        catch {
            throw error
        }
        
        self.sessionTask?.resume()
    }
    
    func cancel() {
        self.sessionTask?.cancel()
    }
    
    
    fileprivate func buildRequest(from request : RequestType) throws -> URLRequest {
        
        var urlRequest = URLRequest(url: request.baseURL.appendingPathComponent(request.path),
                                 cachePolicy: .reloadIgnoringLocalAndRemoteCacheData,
                                 timeoutInterval: 10.0)
        
        urlRequest.httpMethod = request.method.rawValue
        
        do {
        
            switch request.task {
            case .request:
                urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
                
            case .requestParameters(let bodyParameters, let bodyEncoding, let urlParameters):
                try self.configureParameters(bodyParameters: bodyParameters,
                                             bodyEncoding: bodyEncoding,
                                            urlParameters: urlParameters,
                                            request: &urlRequest)
            
            }
            
            return urlRequest
            
        }
        catch {
            throw error
        }
    }
    
    
    fileprivate func configureParameters(bodyParameters: Parameters?,
                                         bodyEncoding: ParameterEncoding,
                                         urlParameters: Parameters?,
                                         request: inout URLRequest) throws {
        do {
            try bodyEncoding.encode(urlRequest: &request,
                                    urlParameters: urlParameters, bodyParameters: bodyParameters)
        } catch {
            throw error
        }
    }
}
