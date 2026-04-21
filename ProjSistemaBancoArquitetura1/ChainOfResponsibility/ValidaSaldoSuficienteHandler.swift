//
//  ValidaSaldoSuficienteHandler.swift
//  ProjSistemaBancoArquitetura1
//
//  Created by Éverton Alencar de Lima on 21/04/26.
//

import Foundation

class ValidaSaldoSuficienteHandler: SaqueHandlerBase {
    override func handle(request: SaqueRequest) -> Resultado {
        guard request.conta.saldo >= request.valor else {
            return .falha(erro: "Saldo insuficiente para saque de R$ \(request.valor).")
        }
        return super.handle(request: request)
    }
}
