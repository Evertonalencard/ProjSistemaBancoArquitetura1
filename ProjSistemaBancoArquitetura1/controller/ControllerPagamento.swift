//
//  ControllerPagamento.swift
//  ProjSistemaBancoArquitetura1
//
//  Created by Éverton Alencar de Lima on 15/04/26.
//

import Foundation

/// Controller (GRASP) responsável por orquestrar a ação de pagamento entre contas.
/// Segue SOLID:
/// - SRP: apenas coordena o fluxo de pagamento.
/// - OCP/DIP: depende de abstrações (protocolos) para conta e estratégia de pagamento.
class ControllerPagamento {
    private let controllerOrigem: ControllerContaCorrente
    private let estrategia: EstrategiaPagamento

    init(controllerOrigem: ControllerContaCorrente, estrategia: EstrategiaPagamento) {
        self.controllerOrigem = controllerOrigem
        self.estrategia = estrategia
    }

    @discardableResult
    func controlarPagamento(valor: Decimal, para controllerDestino: ControllerContaCorrente) -> Resultado {
        return estrategia.pagar(valor: valor, de: controllerOrigem, para: controllerDestino)
    }
}

