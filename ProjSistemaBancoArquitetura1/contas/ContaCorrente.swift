//
//  ContaCorrente.swift
//  ProjSistemaBancoArquitetura1
//
//  Created by Éverton Alencar de Lima on 23/02/26.
//

import Foundation

class ContaCorrente: Conta{
    public private(set) var salarioAtual: Decimal
    public private(set) var salarioAnterior: Decimal
    
    
    let emprestimoService = EmprestimoService()
    let cardService = CardService()
    
    public override init(nome: String) {
        salarioAtual = 0.0
        salarioAnterior = 0.0
        super.init(nome: nome)
    }
    
    func solicitarCartao() -> String {
        return cardService.solicitarCartao()
    }
    
    func solicitarAumentoDeCredito() -> String {
        return cardService.solicitarAumentoDeCredito(para: self)
    }
    
    func solicitarEmprestimo(valor: Decimal) -> Resultado {
        return emprestimoService.solicitarEmprestimo(valor: valor, para: self)
    }
    
    
    public func registraNovoSalario(valor: Decimal) -> Decimal {
        self.salarioAnterior = self.salarioAtual
        self.salarioAtual = valor
        print("Seu novo salario é de: \(valor)")
        return valor
    }
    
    
    
    
}

// MARK: - extensao

extension ContaCorrente: ContaComSalario{
    
    public func pagamento(valor: Decimal, para contaDestino: Conta, usando estrategia: EstrategiaPagamento) -> Resultado {
        
        print("\nIniciando pagamento de R$ \(valor)")
        let resultado = estrategia.pagar(valor: valor, de: self, para: contaDestino)
        
        switch resultado {
        case .sucesso(let novoSaldo):
            print("Pagamento concluído. Saldo final: \(novoSaldo)")
        case .falha(let erro):
            print("Pagamento não pôde ser concluído. Motivo: \(erro)")
        }
        
        return resultado
    }
    
}
