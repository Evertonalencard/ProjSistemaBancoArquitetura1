//
//  ContaCorrenteInternacional.swift
//  ProjSistemaBancoArquitetura1
//
//  Created by Éverton Alencar de Lima on 23/02/26.
//

import Foundation

final class ContaCorrenteInternacional: ContaCorrente{
    private let taxaIOF: Decimal = 0.038
    private let CambioDolar: Decimal = 5.50
    
    public override func depositar(valor: Decimal) -> Resultado {
        print("Depositando em dolar")
        return super.depositar(valor: valor)
    }
    
    public override func sacar(valor: Decimal) -> Resultado {
        let valorIOF = valor * taxaIOF
        let totalDebitado = valor + valorIOF
        
        print("Iniciando saque em Dólares (IOF de \(valorIOF) será aplicado)...")
        // Chame o método da superclasse com o valor correto e retorne seu resultado
        return super.sacar(valor: totalDebitado)
        
    }
    
    public override func saldoAtual() -> Decimal {
        print("saldo atual é\(saldo)usd")
        return saldo
    }
}

