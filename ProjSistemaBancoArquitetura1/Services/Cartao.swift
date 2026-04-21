//
//  Cartao.swift
//  ProjSistemaBancoArquitetura1
//
//  Created by Éverton Alencar de Lima on 16/04/26.
//

import Foundation

public class Cartao: Codable {
    public var numero: String
    public var cvv: String
    public var validade: String
    public var titular: String
    public var limite: Decimal
    public var ativo: Bool
    
    public init(numero: String, cvv: String, validade: String, titular: String, limite: Decimal = 0) {
        self.numero = numero
        self.cvv = cvv
        self.validade = validade
        self.titular = titular
        self.limite = limite
        self.ativo = true
    }
}
