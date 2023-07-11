//
//  Datas.swift
//  SwiftUIExample
//
//  Created by 최최광현 on 2023/07/11.
//

import Foundation

class Datas: ObservableObject {
    @Published var jsonData = [DataType]()
    
    init() {
        let session = URLSession(configuration: .default)
        session.dataTask(with: URL(string: "https://api.github.com/users/hadley/orgs")!) { data, response, error in
            guard let data else { return }
            do {
                let fetch = try JSONDecoder().decode([DataType].self, from: data)
                DispatchQueue.main.async  {
                    self.jsonData = fetch
                }
            } catch {
                print(error.localizedDescription)
            }
        }.resume()
    }
}

struct DataType: Identifiable, Codable {
    var id: Int
    var login: String
    var node_id: String
    var avatar_url: String
}
