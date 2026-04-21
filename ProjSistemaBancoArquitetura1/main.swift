//
//  main.swift
//  ProjSistemaBancoArquitetura1
//
//  Created by Éverton Alencar de Lima on 23/02/26.
//

import Foundation

let contaEverton = ContaCorrente(nome: "Éverton")
let ContaEmily = ContaPoupanca(nome: "Emily")
let verificador = ContaTipoVerifier()
let controllerEverton = ControllerContaCorrente(conta: contaEverton)

//MARK: - everton
print(contaEverton.registraNovoSalario(valor: 2000))
print(contaEverton.sacar(valor: 100))
print(contaEverton.depositar(valor: 500))
print(contaEverton.sacar(valor: 100))
print(contaEverton.verificarDadosCadastrais())
print(contaEverton.saldoAtual())

print(verificador.verificarTipoDeConta(contaEverton))
print(verificador.verificarTipoDeConta(ContaEmily))







//MARK: - emily
