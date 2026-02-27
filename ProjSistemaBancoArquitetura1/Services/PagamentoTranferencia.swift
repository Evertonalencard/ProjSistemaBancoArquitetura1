//
//  Pagemento.swift
//  ProjSistemaBancoArquitetura1
//
//  Created by Éverton Alencar de Lima on 24/02/26.
//

import Foundation

class PagamentoTranferencia: EstrategiaPagamento{
    var nome: String = "Transferência bancaria"
    
    private let taxaTransferencias: Decimal = 0.01
    
    func pagar(valor: Decimal, de origem: ContaCorrente, para destino: Conta) -> Resultado {
        let taxa = taxaTransferencias * valor
        let total = valor + taxa
        
        let resultadoSaque = origem.sacar(valor: total)
        
        switch resultadoSaque {
        case .sucesso:
            _ = destino.depositar(valor: valor)
            return .sucesso(novoValor: origem.saldoAtual())
        case .falha(let erro):
            return .falha(erro: erro)
        }
    }
    
    
}
