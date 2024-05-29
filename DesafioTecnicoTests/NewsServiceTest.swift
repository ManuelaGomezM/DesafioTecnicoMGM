//
//  NewsServiceTest.swift
//  DesafioTecnicoTests
//
//  Created by Manuela on 29/05/2024.
//

import Foundation
import XCTest
@testable import DesafioTecnico

class NewsServiceTests: XCTestCase {
    
    private var service: NewsService!
    
    override func setUpWithError() throws {
        service = NewsService()
    }
    
    func test_getNews_success() {
        
        let expectation = expectation(description: "Llamando a servicio")
        
        service.getNews { result in
            switch result {
            case .success(let news):
                XCTAssertEqual(news.count, 30)
            case .failure:
                XCTFail("Fallo. Resultado no esperado")
            }
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 1)
    }

}
