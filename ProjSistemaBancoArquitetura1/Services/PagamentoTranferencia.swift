//
//  Pagemento.swift
//  ProjSistemaBancoArquitetura1
//
//  Created by Éverton Alencar de Lima on 24/02/26.
//

import Foundation

class PagamentoTranferencia: EstrategiaPagamento {
    var nome: String = "Transferência bancária"
    private let taxaTransferencias: Decimal = 0.01

    func pagar(valor: Decimal, de origem: ControllerContaCorrente, para destino: ControllerContaCorrente) -> Resultado {
        let taxa = taxaTransferencias * valor
        let total = valor + taxa

        let resultadoSaque = origem.controlaSacar(valor: total)  // ← passa pelo CoR
        switch resultadoSaque {
        case .sucesso:
            _ = destino.controlaDepositar(valor: valor)
            return origem.controlaSaldoAtual()
        case .falha(let erro):
            return .falha(erro: erro)
        }
    }
}
