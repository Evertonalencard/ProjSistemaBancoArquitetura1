//
//  pagEspecie.swift
//  ProjSistemaBancoArquitetura1
//
//  Created by Éverton Alencar de Lima on 24/02/26.
//

import Foundation

class PagEspecie: EstrategiaPagamento {
    
    
    func pagar(valor: Decimal, de origem: ProtocoloContaCorrente, para destino: ProtocoloContaCorrente) -> Resultado {//alterar para controller
        let resultadoSaque = origem.sacar(valor: valor)
        
        switch resultadoSaque {
        case .sucesso:
            _ = destino.depositar(valor: valor)
            return .sucesso(novoValor: origem.saldo)//alterar no futuro
        case .falha(let erro):
            return .falha(erro: erro)
        }
    }
}
