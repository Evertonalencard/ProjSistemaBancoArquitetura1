//
//  ControllerContaCorrente.swift
//  ProjSistemaBancoArquitetura1
//
//  Created by Éverton Alencar de Lima on 25/02/26.
//

import Foundation

class ControllerContaCorrente {
    
    private let conta: ProtocoloContaCorrente
    
    init(conta: ProtocoloContaCorrente) {
        self.conta = conta
    }
    
    func controlaSacar(valor: Decimal) -> Resultado {
        // Monta a corrente
        let validaValor    = ValidaValorPositivoHandler()
        let validaSaldo    = ValidaSaldoSuficienteHandler()
        let validaNegativo = ValidaContaNaoNegativadaHandler()
        let executa        = ExecutaSaqueHandler()
        
        // Encadeia
        validaValor.proximo    = validaSaldo
        validaSaldo.proximo    = validaNegativo
        validaNegativo.proximo = executa
        
        // Dispara pelo primeiro da corrente
        return validaValor.handle(request: SaqueRequest(valor: valor, conta: conta))
    }
    
    func controlaDepositar(valor: Decimal) -> Resultado{
        return conta.depositar(valor: valor)
    }
    
    func controlaSaldoAtual() -> Resultado {
        return conta.saldoAtual()
    }
    
    func controlaVerificarDadosCadastrais() -> String{
        return conta.verificarDadosCadastrais()
    }
    
    func controlaRegistraNovoSalario(valor: Decimal) -> Resultado{
        return conta.registraNovoSalario(valor: valor)
    }
    
}

