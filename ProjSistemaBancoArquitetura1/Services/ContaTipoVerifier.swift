//
//  ContaTipoVerifier.swift
//  ProjSistemaBancoArquitetura1
//
//  Created by Éverton Alencar de Lima on 23/02/26.
//

import Foundation

class ContaTipoVerifier {
    func verificarTipoDeConta(_ conta: ProtocoloConta) {
        switch conta{
            case is ContaCorrenteInternacional: print("É uma conta internacional")
            case is ContaCorrente : print("É uma conta corrente")
            case is ContaPoupanca: print("É uma conta poupança")
        default:
            print("Nao é uma conta")
        }
    }
}
