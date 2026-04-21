//
//  ValidaContaNaoNegativadaHandler.swift
//  ProjSistemaBancoArquitetura1
//
//  Created by Éverton Alencar de Lima on 21/04/26.
//

import Foundation

class ValidaContaNaoNegativadaHandler: SaqueHandlerBase {
    override func handle(request: SaqueRequest) -> Resultado {
        guard !request.conta.negativado else {
            return .falha(erro: "Conta negativada. Saque bloqueado.")
        }
        return super.handle(request: request)
    }
}
