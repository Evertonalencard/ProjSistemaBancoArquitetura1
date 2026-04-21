//
//  SaqueHandlerBase.swift
//  ProjSistemaBancoArquitetura1
//
//  Created by Éverton Alencar de Lima on 21/04/26.
//

import Foundation

class SaqueHandlerBase: SaqueHandler {
    var proximo: SaqueHandler?

    func handle(request: SaqueRequest) -> Resultado {
        return proximo?.handle(request: request)
            ?? .falha(erro: "Nenhum handler processou a requisição.")
    }
}
