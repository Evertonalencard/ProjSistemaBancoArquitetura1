//
//  Emprestimo.swift
//  ProjSistemaBancoArquitetura1
//
//  Created by Éverton Alencar de Lima on 16/04/26.
//

import Foundation

class Emprestimo: NSObject {
    public let valorTotal: Decimal
        public let juros: Decimal
        public let parcelas: Int
        public private(set) var aprovado: Bool

        init(valorTotal: Decimal, juros: Decimal = 0, parcelas: Int = 1) {
            self.valorTotal = valorTotal
            self.juros = juros
            self.parcelas = parcelas
            self.aprovado = false
        }

        func aprovar() {
            self.aprovado = true
        }
}
