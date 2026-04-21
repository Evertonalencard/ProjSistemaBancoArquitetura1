//
//  ExecutaSaqueHandler.swift
//  ProjSistemaBancoArquitetura1
//
//  Created by Éverton Alencar de Lima on 21/04/26.
//

import Foundation

class ExecutaSaqueHandler: SaqueHandlerBase {
    override func handle(request: SaqueRequest) -> Resultado {
        return request.conta.sacar(valor: request.valor)
    }
}
