//
//  LeilaoTests.swift
//  LeilaoTests
//
//  Created by Alex Silveira on 02/10/22.
//  Copyright © 2022 Alura. All rights reserved.
//

import XCTest
@testable import Leilao

class LeilaoTests: XCTestCase {
    private var joao: Usuario!
    private var jose: Usuario!
    private var maria: Usuario!
    private var leilaoPS5: Leilao!
    private var leilaoIphone14: Leilao!
    private var leilaoMacbook: Leilao!
    
    override func setUpWithError() throws {
        joao = Usuario(nome: "Joao")
        jose = Usuario(nome: "Jose")
        maria = Usuario(nome: "Maria")
        leilaoPS5 = Leilao(descricao: "Playstaion 5")
        leilaoIphone14 = Leilao(descricao: "Iphone 14 Pro")
        leilaoMacbook = Leilao(descricao: "Macbook Pro 16")
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testDeveReceberUmLance() {
        XCTAssertEqual(0, leilaoPS5.lances?.count)
        leilaoPS5.propoe(lance: Lance(maria, 3000))
        
        XCTAssertEqual(1, leilaoPS5.lances?.count)
        XCTAssertEqual(3000, leilaoPS5.lances?.first?.valor)
    }
        
    func testDeveReceberVariosLances() {
        leilaoIphone14.propoe(lance: Lance(joao, 7000))
        leilaoIphone14.propoe(lance: Lance(jose, 9000))
        
        XCTAssertEqual(2, leilaoIphone14.lances?.count)
        XCTAssertEqual(7000, leilaoIphone14.lances?.first?.valor)
        XCTAssertEqual(9000, leilaoIphone14.lances?[1].valor)
    }
    
    func testDeveIgnorarDoisLancesSeguidosDoMesmoUsuario() {
        leilaoMacbook.propoe(lance: Lance(maria, 10000))
        leilaoMacbook.propoe(lance: Lance(maria, 10500))
        
        XCTAssertEqual(1, leilaoMacbook.lances?.count)
        XCTAssertEqual(10000, leilaoMacbook.lances?.first?.valor)
    }
}
