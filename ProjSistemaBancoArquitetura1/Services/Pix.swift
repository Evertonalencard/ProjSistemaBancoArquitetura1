//
//  pix.swift
//  ProjSistemaBancoArquitetura1
//
//  Created by Éverton Alencar de Lima on 24/02/26.
//

import Foundation

class PagPix: EstrategiaPagamento {
    func pagar(valor: Decimal, de origem: ControllerContaCorrente, para destino: ControllerContaCorrente) -> Resultado {
        let resultadoSaque = origem.controlaSacar(valor: valor)  // ← passa pelo CoR agora
        switch resultadoSaque {
        case .sucesso:
            _ = destino.controlaDepositar(valor: valor)
            return origem.controlaSaldoAtual()
        case .falha(let erro):
            return .falha(erro: erro)
        }
    }
}

