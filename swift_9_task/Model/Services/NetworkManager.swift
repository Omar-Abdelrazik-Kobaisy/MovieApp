//
//  NetworkManager.swift
//  swift_9_task
//
//  Created by Omar on 22/02/2023.
//

import Foundation


protocol NetworkService {
    static func fetchData<T : Decodable>(url : String ,complition : @escaping (T?) ->Void )
}


class NetworkManager : NetworkService
{
    static func fetchData<T>(url: String, complition: @escaping (T?) -> Void) where T : Decodable {
        let url = URL(string: url)
        guard let myurl = url else{return}
        
        let req = URLRequest(url: myurl)
        
        let session = URLSession(configuration: URLSessionConfiguration.default)
        
        let task = session.dataTask(with: req) { data, response, error in
            do
            {
                let res = try JSONDecoder().decode(T.self, from: data!)
                complition(res)
                
            }catch{
                complition(nil)
                print(error.localizedDescription)
            }
        }
        task.resume()
    }
    
    
}
