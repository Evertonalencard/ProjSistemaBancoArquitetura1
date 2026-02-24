//
//  ProtocoloConta.swift
//  ProjSistemaBancoArquitetura1
//
//  Created by Éverton Alencar de Lima on 23/02/26.
//

import Foundation

protocol ProtocoloConta {
    var nome: String {get }
    var saldo : Decimal {get }
    func depositar(valor: Decimal)->Resultado
    func sacar(valor: Decimal)->Resultado
}
