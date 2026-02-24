//
//  ContaCorrente.swift
//  ProjSistemaBancoArquitetura1
//
//  Created by Éverton Alencar de Lima on 23/02/26.
//

import Foundation

class ContaCorrente: Conta{
    public private(set) var salarioAtual: Decimal
    private var salarioAnterior: Decimal
    private var possuiCartao: Bool
    private var limiteCredito: Decimal
    
    private let multiplicadorMaxEmprestimo: Decimal = 10.0
    
    
    public override init(nome: String) {
        salarioAtual = 0.0
        salarioAnterior = 0.0
        possuiCartao = false
        limiteCredito = 0
        super.init(nome: nome)
    }
    
    
    public func solicitarEmprestimo(valor:Decimal)-> String{
        if salarioAtual > 0 && valor <= multiplicadorMaxEmprestimo * salarioAtual {
            let resultadoDeposito = super.depositar(valor: valor) // Captura o Resultado
                    
            switch resultadoDeposito {
                case .sucesso:
                    return "Parabéns, o valor \(valor) foi depositado na sua conta"
                case .falha(let erro):
                    return "Empréstimo aprovado, mas o depósito falhou: \(erro)"
            }
        } else {
            return "Você não é elegível para empréstimos nesse valor"
        }
    }
    
    
    
    public func registraNovoSalario(valor: Decimal) -> Decimal {
        self.salarioAnterior = self.salarioAtual
        self.salarioAtual = valor
        print("Seu novo salario é de: \(valor)")
        return valor
    }
    
    public func solicitarCartao() -> String{
        if !possuiCartao{
            possuiCartao = true
            return "Parabéns, seu cartão chega em 30 dias"
        }else{
            return"Você já possui um cartão"
        }
    }
    
    public func solicitarAumentoDeCredito() -> String{
        if salarioAtual > salarioAnterior && possuiCartao == true{
            let limiteAnterior = limiteCredito
            let diferencaSalario = salarioAtual - salarioAnterior
            limiteCredito += diferencaSalario
            
            
            salarioAnterior = salarioAtual
            
            return "Parabéns, seu limite aumentou de R$ \(limiteAnterior) para R$ \(limiteCredito)."
        } else {
            return "Você não é elegível para aumento de limite no momento."
        }
    }
    
    public func pagamento(valor: Decimal, _ contaDestino: Conta,tipo: FormaDePagamento) {
        print("\nIniciando pagamento de R$ \(valor) via \(tipo.rawValue)...")
        let ResultadoDaOperacao: Resultado
        
        switch tipo {
            case .cartãoDeDebito, .pix, .boleto, .cartãoDeCredito:
                ResultadoDaOperacao = transferirSemTaxa(valor: valor, para: contaDestino)
            case .transferenciaBancaria:
                ResultadoDaOperacao = transferir(valor: valor, para: contaDestino)
        }
        switch ResultadoDaOperacao{
            case .sucesso(let novoSaldo):
                print("Pagamento concluído com sucesso. Saldo final: R$ \(novoSaldo)")
            case .falha(let erro):
                print("Pagamento não pôde ser concluído. Motivo: \(erro)")
        }
    }
}
