//
//  WalletTest.swift
//  WalletPlusTests
//
//  Created by William Ching on 2021-04-20.
//

import XCTest
@testable import WalletPlus

class WalletTest: XCTestCase {
    
    var testData: [Transaction] = [IncomeTransaction(container: "Walltet", date: Date(timeIntervalSinceReferenceDate: 1000000), remoteId: "1", amount: 100.1, category: "Cash"), IncomeTransaction(container: "Wallet", date: Date(timeIntervalSinceReferenceDate: 10000000), remoteId: "2", amount: 99.9, category: "FFF"), ExpenseTransaction(container: "Waller", date: Date(timeIntervalSinceReferenceDate: 1000000), remoteId: "3", amount: -33.3, category: "Car")]

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testCreateEmptyWallet() {
        let name: String = "Cash"
        let wallet: TransactionContainer = Wallet(name: name, transactions: [])
        XCTAssertEqual(wallet.name, name)
        XCTAssertEqual(wallet.currentAmount(), 0.0)
    }
    
    func testWalletAmount() {
        let name: String = "Cash"
        var wallet: TransactionContainer = Wallet(name: name, transactions: [])
        wallet.transactions = testData
        XCTAssertEqual(wallet.currentAmount(), 166.7)
    }
}
