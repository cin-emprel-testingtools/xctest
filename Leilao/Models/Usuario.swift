//
//  Usuario.swift
//  Usuario
//
//  Created by Alex Silveira on 02/10/22.
//  Copyright © 2022 Alura. All rights reserved.
//

import Foundation

class Usuario {
    let id:Int?
    let nome:String
    
    init(id:Int? = nil, nome:String) {
        self.id = id
        self.nome = nome
    }
}

extension Usuario: Equatable {
    static func == (lhs: Usuario, rhs: Usuario) -> Bool {
        if lhs.id != rhs.id || lhs.nome != rhs.nome {
            return false
        }
        
        return true
    }
}
