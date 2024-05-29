//
//  UserServiceTest.swift
//  DesafioTecnicoTests
//
//  Created by Manuela on 29/05/2024.
//

import Foundation
import XCTest
@testable import DesafioTecnico

class UsersServiceTests: XCTestCase {
    
    private var service: UserService!
    
    override func setUpWithError() throws {
        service = UserService()
    }
    
    func test_getUsers_success() {
        
        let expectation = expectation(description: "Llamando a servicio")
        
        service.getUsers { result in
            switch result {
            case .success(let users):
                XCTAssertEqual(users.count, 30)
            case .failure:
                XCTFail("Fallo. Resultado no esperado")
            }
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 1)
    }

}
