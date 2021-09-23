//
//  EmployeeViewModel.swift
//  MVVM
//
//  Created by Heang Ly on 9/23/21.
//

import Foundation

struct UserListViewModel {
    var users: Observable<[UserTableViewCellViewModel]> = Observable([])
    
    init() {
        fetchAPI()
    }

    func fetchAPI() {
        Service().fetchData { users in
            self.users.value = users.compactMap {
                UserTableViewCellViewModel(name: $0.name)
            }
        }
    }
}

struct UserTableViewCellViewModel {
    let name: String
}


