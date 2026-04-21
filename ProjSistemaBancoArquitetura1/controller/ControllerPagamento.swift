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
    
    private let contaOrigem: ProtocoloContaCorrente
    private let estrategia: EstrategiaPagamento
    
    /// Injeta dependências por protocolo para manter baixo acoplamento.
    init(contaOrigem: ProtocoloContaCorrente, estrategia: EstrategiaPagamento) {
        self.contaOrigem = contaOrigem
        self.estrategia = estrategia
    }
    
    /// Orquestra o pagamento da conta de origem para a conta de destino usando a estratégia fornecida.
    @discardableResult
    func controlarPagamento(valor: Decimal, para contaDestino: ProtocoloContaCorrente) -> Resultado {
        return estrategia.pagar(valor: valor, de: contaOrigem, para: contaDestino)
    }
}
