//
//  RestController.swift
//  SomeApp
//
//  Created by Олександр Палагнюк on 13.11.2020.
//

import Foundation

class RestController {
    private let session = URLSession.shared
    private let baseUrl : String = "https://dummy.restapiexample.com/api/v1/"
    
    init() {}
    
    static var shared: RestController = {
        let instance = RestController()
        return instance
    }()
    
    func request<T: Decodable>(of _: T.Type, requestMethod: String, result : @escaping result<T>){
        print("request:" + requestMethod)
        session.dataTask(with: URLRequest(url: URL.init(string: baseUrl + requestMethod)!), completionHandler: { data, response, error in
            if error != nil {
                if let e = error {
                    result(.failure(e))
                }
            } else {
                do {
                    let responseBody = try JSONDecoder().decode(T.self, from: data!)
                    DispatchQueue.main.async {
                        result(.success(responseBody))
                    }
                    print(responseBody)
                } catch {
                    result(.failure(error))
                }
            }
        }).resume()
    }

    typealias result<T> = (Result<T, Error>) -> Void
}
