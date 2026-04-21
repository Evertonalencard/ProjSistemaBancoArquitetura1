//
//  main.swift
//  ProjSistemaBancoArquitetura1
//
//  Created by Éverton Alencar de Lima on 23/02/26.
//

import Foundation
let pix = PagPix()

let contaEverton = ContaCorrente(nome: "Éverton")
let ContaEmily = ContaPoupanca(nome: "Emily")
let contaYasmin = ContaCorrenteInternacional(nome: "Yasmin")
let contaRonaldo = ContaCorrente(nome: "Ronaldo")
let verificador = ContaTipoVerifier()
let controllerEverton = ControllerContaCorrente(conta: contaEverton)
let controllerYasmin = ControllerContaCorrente(conta: contaYasmin)
let controllerRonaldo = ControllerContaCorrente(conta: contaRonaldo)
let controllerPagYasmin = ControllerPagamento(controllerOrigem: controllerYasmin, estrategia: pix)
let controllerPagEverton = ControllerPagamento(controllerOrigem: controllerEverton, estrategia: pix)

//MARK: - everton
print(controllerEverton.controlaRegistraNovoSalario(valor: 700))
print(controllerEverton.controlaDepositar(valor: 1000))
print(controllerEverton.controlaSacar(valor: 0))
print("---------------------------------------------------------------------")
print(controllerYasmin.controlaRegistraNovoSalario(valor: 700))
print(controllerYasmin.controlaDepositar(valor: 1000))
print(controllerYasmin.controlaSacar(valor: 100))
print("---------------------------------------------------------------------")


print(controllerPagYasmin.controlarPagamento(valor: 0, para: controllerEverton))
print(controllerPagEverton.controlarPagamento(valor: 0, para: controllerRonaldo))


//MARK: - emily
