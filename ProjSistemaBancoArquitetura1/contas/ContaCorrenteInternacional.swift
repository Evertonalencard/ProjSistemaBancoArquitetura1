//
//  ContaCorrenteInternacional.swift
//  ProjSistemaBancoArquitetura1
//
//  Created by Éverton Alencar de Lima on 23/02/26.
//

import Foundation

final class ContaCorrenteInternacional: ProtocolContaCorrenteInternacional{
    let taxaIOF: Decimal
    let cambioDolar: Decimal
    var negativado: Bool{
        return saldo < 0
    }
    public private(set) var nome: String
    public private(set) var saldo: Decimal{
        willSet{
            
        }
        didSet{
            if negativado == true {
                print("ATENCAO: Sua conta está negativada!")
            }
        }
    }
    public private(set) var salarioAtual: Decimal
    public private(set) var salarioAnterior: Decimal
    
    init(nome: String) {
        self.nome = nome
        self.saldo = 0.0
        self.salarioAtual = 0
        self.salarioAnterior = 0
        self.cambioDolar = 5.50
        self.taxaIOF = 0.038
    }
    
    public func registraNovoSalario(valor: Decimal) -> Resultado {
        self.salarioAnterior = self.salarioAtual
        self.salarioAtual = valor
        print("Seu novo salario é de: \(valor) USD")
        return .sucesso(novoValor: salarioAtual)
    }
    
    public func verificarDadosCadastrais()->String{
        return "Seus dados são, nome: \(nome)..."
    }
    
    public func depositar(valor: Decimal) -> Resultado {
        guard valor > 0 else {
            return .falha(erro: "Valor de depósito inválido. Deve ser maior que zero.")
        }
        print("Depositando em dolar")
        
        saldo += valor
        print("Depósito de R$ \(valor) realizado. Novo saldo: $\(saldo)")
        return .sucesso(novoValor: saldo)
    }
    
    public func sacar(valor: Decimal) -> Resultado {
        
        let valorIOF = valor * taxaIOF
        let totalDebitado = valor + valorIOF
        
        print("Iniciando saque em Dólares (IOF de \(valorIOF) será aplicado)...")
        
        saldo -= totalDebitado  
        return .sucesso(novoValor: saldo)
        
    }
    
    public func saldoAtual()->Resultado{
        print("saldo atual é\(saldo)usd")
        
        return .sucesso(novoValor: saldo)
    }
}

