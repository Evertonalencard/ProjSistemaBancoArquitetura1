//
//  CardService.swift
//  ProjSistemaBancoArquitetura1
//
//  Created by Éverton Alencar de Lima on 23/02/26.
//

import Foundation

class CardService {
    private var possuiCartao: Bool
    private var limiteCredito: Decimal
    
    init() {
        self.possuiCartao = false
        self.limiteCredito = 0.0
    }
    
    public func solicitarCartao() -> String{
        if !possuiCartao{
            possuiCartao = true
            return "Parabéns, seu cartão chega em 30 dias"
        }else{
            return"Você já possui um cartão"
        }
    }
    
    public func solicitarAumentoDeCredito(para conta:ContaCorrente) -> String{
        if conta.salarioAtual > conta.salarioAnterior && possuiCartao == true{
            let limiteAnterior = limiteCredito
            let diferencaSalario = conta.salarioAtual - conta.salarioAnterior
            limiteCredito += diferencaSalario
            
            
            
            
            return "Parabéns, seu limite aumentou de R$ \(limiteAnterior) para R$ \(limiteCredito)."
        } else {
            return "Você não é elegível para aumento de limite no momento."
        }
    }
}
