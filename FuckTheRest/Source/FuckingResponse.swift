//
//  FuckingResponse.swift
//  FuckTheRest
//
//  Created by Fabrício Santos on 1/24/17.
//  Copyright © 2017 dede.exe. All rights reserved.
//

import Foundation

open class FuckingResponse
{
    private var request:URLRequest
    
    public init(request:URLRequest) {
        self.request = request
    }
    
    internal func getData(completion:@escaping (FuckingResult<Data>) -> Void)
    {
        let session = URLSession(configuration: URLSessionConfiguration.default)
        
        let task = session.dataTask(with: request) { (data, response, error) in
            if let error = error as? NSError {
                let result = FuckingResult<Data>.error(error)
                completion(result)
                return
            }
            
            let data = data ?? Data()
            let response = response as! HTTPURLResponse
            let result = FuckingResult<Data>.success(response.statusCode, data)
            completion(result)
        }
        
        task.resume()
    }
}
