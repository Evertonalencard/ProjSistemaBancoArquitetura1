//
//  EmpresitimoService.swift
//  ProjSistemaBancoArquitetura1
//
//  Created by Éverton Alencar de Lima on 23/02/26.
//

import Foundation

final class EmprestimoService {
    private let multiplicadorMaxEmprestimo: Decimal = 10.0
    
    func solicitarEmprestimo(valor: Decimal, para conta: ContaCorrente) -> Resultado {
        if conta.salarioAtual > 0 && valor <= multiplicadorMaxEmprestimo * conta.salarioAtual {
            return conta.depositar(valor: valor)
        } else {
            return .falha(erro: "Você não é elegível para empréstimos nesse valor")
        }
    }
}
