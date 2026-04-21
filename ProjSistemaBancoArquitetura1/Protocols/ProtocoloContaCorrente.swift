//
//  ProtocoloContaCorrente.swift
//  ProjSistemaBancoArquitetura1
//
//  Created by Éverton Alencar de Lima on 14/04/26.
//

import Foundation

protocol ProtocoloContaCorrente: ProtocoloConta{
    var salarioAtual: Decimal {get }
    var salarioAnterior: Decimal {get }
    func registraNovoSalario(valor: Decimal) -> Resultado 
}

