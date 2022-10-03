//
//  Avaliador.swift
//  Avaliador
//
//  Created by Alex Silveira on 02/10/22.
//  Copyright © 2022 Alura. All rights reserved.
//

import Foundation

class Avaliador {
    private var maiorLanceDeTodos = Double.leastNonzeroMagnitude
    private var menorLanceDeTodos = Double.greatestFiniteMagnitude
    
    func avalia( leilao: Leilao ) {
        guard let lances = leilao.lances else { return }
        
        for lance in lances {
            if lance.valor > maiorLanceDeTodos {
                maiorLanceDeTodos = lance.valor
            }
            if lance.valor < menorLanceDeTodos {
                menorLanceDeTodos = lance.valor
            }
        }
    }
    
    func maiorLance() -> Double {
        return maiorLanceDeTodos
    }
    
    func menorLance() -> Double {
        return menorLanceDeTodos
    }
}
