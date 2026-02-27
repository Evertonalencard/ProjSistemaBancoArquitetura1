//
//  pix.swift
//  ProjSistemaBancoArquitetura1
//
//  Created by Éverton Alencar de Lima on 24/02/26.
//

import Foundation

class PagPix: PagamentoTranferencia {
    
    
    override func pagar(valor: Decimal, de origem: ContaCorrente, para destino: Conta) -> Resultado {
        let resultadoSaque = origem.sacar(valor: valor)
        
        switch resultadoSaque {
        case .sucesso:
            _ = destino.depositar(valor: valor)
            return .sucesso(novoValor: origem.saldoAtual())
        case .falha(let erro):
            return .falha(erro: erro)
        }
    }
}
