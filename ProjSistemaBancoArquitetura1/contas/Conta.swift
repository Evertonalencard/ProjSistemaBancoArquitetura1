//
//  Conta.swift
//  ProjSistemaBancoArquitetura1
//
//  Created by Éverton Alencar de Lima on 23/02/26.
//
import Foundation

class Conta: ProtocoloConta{
    private var negativado: Bool{
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
    
    static let taxaTransferencias: Decimal = 0.01
    
    public init(nome: String) {
        self.nome = nome
        saldo = 0.0
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
            return .falha(erro: "StringValor de saque inválido. Deve ser maior que zero.")
        }
        
        if saldo >= valor {
            saldo -= valor
            print("Saque de R$ \(valor) realizado. Novo saldo: R$ \(saldo)")
            return .sucesso(novoValor: saldo)
        } else {
            
            return .falha(erro: "Tentativa de saque de R$ \(valor) falhou. Saldo insuficiente.")
        }
    }
    
    public func saldoAtual()->Decimal{
        print("Seu saldo é de: \(saldo)")
        
        return saldo
    }
    
    public func verificarDadosCadastrais()->String{
        print("Seus dados são, nome: \(nome)...")
        return nome
    }
    
}
