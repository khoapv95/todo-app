//
//  CallListViewModelTests.swift
//  TodoAppTests
//
//  Created by Khoa Pham on 04/04/2022.
//

import XCTest

class CallListViewModelTests: XCTestCase {
    
    private enum GetCallListUseCaseError: Error {
        case someError
    }
    
    let persons = [Person(id: 1, name: "Jason White", number: "9993456665"),
                   Person(id: 2, name: "Wasim Khan", number: "2345677890"),
                   Person(id: 3, name: "Amir Khan", number: "987654320")]

    class GetCallListUseCaseMock: GetCallListUseCase {
        var expectation: XCTestExpectation?
        var error: Error?
        var persons = [Person]()

        func execute(completion: @escaping (Result<[Person], Error>) -> Void) -> Cancellable? {
            if let error = error {
                completion(.failure(error))
            } else {
                completion(.success(persons))
            }
            expectation?.fulfill()
            return nil
        }
    }
    
    func test_whenGetCallListUseCaseRetrievesPersons_thenShowThesePersons() {
        // given
        let getCallListUseCaseMock = GetCallListUseCaseMock()
        getCallListUseCaseMock.expectation = self.expectation(description: "Call list loaded")
        getCallListUseCaseMock.persons = persons
        let viewModel = CallListViewModelImpl(getCallListUseCase: getCallListUseCaseMock)
        // when
        viewModel.viewDidLoad()
        
        // then
        waitForExpectations(timeout: 5, handler: nil)
        XCTAssertEqual(viewModel.items.value.count, 3)
        XCTAssertEqual(viewModel.items.value.map { $0.name }, persons.map { "Name: \($0.name)" })
    }

}
