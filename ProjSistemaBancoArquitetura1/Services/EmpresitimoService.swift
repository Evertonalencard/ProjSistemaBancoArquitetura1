//
//  EmpresitimoService.swift
//  ProjSistemaBancoArquitetura1
//
//  Created by Éverton Alencar de Lima on 23/02/26.
//

import Foundation

final class EmprestimoService {
    private let multiplicadorMaxEmprestimo: Decimal = 10.0
    
    func solicitarEmprestimo(_ emprestimo: Emprestimo, para conta: ProtocoloContaCorrente) -> Resultado {
        guard conta.salarioAtual > 0,
              emprestimo.valorTotal <= multiplicadorMaxEmprestimo * conta.salarioAtual else {
            return .falha(erro: "Você não é elegível para empréstimos nesse valor")
        }
        emprestimo.aprovar()
        return conta.depositar(valor: emprestimo.valorTotal)
    }
}
