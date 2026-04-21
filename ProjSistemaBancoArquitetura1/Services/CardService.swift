//
//  CardService.swift
//  ProjSistemaBancoArquitetura1
//
//  Created by Éverton Alencar de Lima on 23/02/26.
//

import Foundation

final class CardService {
    private var possuiCartao: Bool
    private var limiteCredito: Decimal
    
    init() {
        self.possuiCartao = false
        self.limiteCredito = 0.0
    }
    
    func solicitarCartao(numero: String, cvv: String, validade: String, titular: String) -> Cartao {
        let cartao = Cartao(numero: numero, cvv: cvv, validade: validade, titular: titular, limite: 0)
        return cartao
    }
    
    func solicitarAumentoDeCredito(cartao: Cartao, para conta: ProtocoloContaCorrente) -> String {
            if conta.salarioAtual > conta.salarioAnterior && cartao.ativo {
                let diferenca = conta.salarioAtual - conta.salarioAnterior
                let limiteAnterior = cartao.limite
                cartao.limite += diferenca
                return "Limite aumentou de R$ \(limiteAnterior) para R$ \(cartao.limite)."
            } else {
                return "Você não é elegível para aumento de limite no momento."
            }
        }
}
