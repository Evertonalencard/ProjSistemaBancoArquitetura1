//
//  ContaCorrente.swift
//  ProjSistemaBancoArquitetura1
//
//  Created by Éverton Alencar de Lima on 23/02/26.
//

import Foundation

class ContaCorrente: ProtocoloContaCorrente {
    
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
    
    public func registraNovoSalario(valor: Decimal) -> Resultado {
        self.salarioAnterior = self.salarioAtual
        self.salarioAtual = valor
        print("Seu novo salario é de: \(valor)")
        return .sucesso(novoValor: salarioAtual)
    }
    
    public func depositar(valor: Decimal) -> Resultado {
        guard valor > 0 else {
            return .falha(erro: "Valor de depósito inválido. Deve ser maior que zero.")
        }
        
        saldo += valor
        print("Depósito de R$ \(valor) realizado. Novo saldo: R$ \(saldo)")
        return .sucesso(novoValor: saldo)
    }
    
    public func sacar(valor: Decimal) -> Resultado {
        guard valor > 0 else {
            return .falha(erro: "Valor de saque inválido. Deve ser maior que zero.")
        }
        
        if saldo >= valor {
            saldo -= valor
            print("Saque de R$ \(valor) realizado. Novo saldo: R$ \(saldo)")
            return .sucesso(novoValor: saldo)
        } else {
            
            return .falha(erro: "Tentativa de saque de R$ \(valor) falhou. Saldo insuficiente.")
        }
    }
    
    public func verificarDadosCadastrais()->String{
        return "Seus dados são, nome: \(nome)..."
    }
    
    public func saldoAtual()->Resultado{
        print("Seu saldo é de: \(saldo)")
        
        return .sucesso(novoValor: saldo)
    }
    
    public init(nome: String) {
        self.nome = nome
        saldo = 0.0
        self.salarioAtual = 0
        self.salarioAnterior = 0
        
    }
    
}

// MARK: - extensao


