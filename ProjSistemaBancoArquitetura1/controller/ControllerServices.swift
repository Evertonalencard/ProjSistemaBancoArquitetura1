//
//  ControllerServices.swift
//  ProjSistemaBancoArquitetura1
//
//  Created by Éverton Alencar de Lima on 15/04/26.
//

import Foundation

class ControllerServices {
    private let conta: ProtocoloConta
    private let emprestimoService = EmprestimoService()
    private let cardService = CardService()
    
    init(conta: ProtocoloConta) {
        self.conta = conta
    }
    
    func controlaSolicitarCartao(Numero: String, Cvv: String, Validade: String, Titular: String) -> Cartao {
        return cardService.solicitarCartao(numero: Numero, cvv: Cvv, validade: Validade, titular: Titular)
    }
    
    func controlaSolicitarAumentoDeCredito(para Conta: ContaCorrente, Cartao: Cartao) -> String {
        return cardService.solicitarAumentoDeCredito(cartao: Cartao, para: Conta)
    }
    
    func controlaSolicitarEmprestimo(valor: Decimal, para Conta: ContaCorrente) -> Resultado {
        let emprestimo = Emprestimo(valorTotal: valor)

        return emprestimoService.solicitarEmprestimo(emprestimo, para: Conta)
    }
}

