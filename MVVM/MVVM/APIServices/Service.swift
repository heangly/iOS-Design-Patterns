//
//  Service.swift
//  MVVM
//
//  Created by Heang Ly on 9/23/21.
//
import UIKit

struct Service {
    func fetchData(completion: @escaping ([User]) -> Void) {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/users") else { return }
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else { return }

            do {
                let users = try JSONDecoder().decode([User].self, from: data)
                completion(users)
            } catch {

            }
        }
        task.resume()
    }
}


