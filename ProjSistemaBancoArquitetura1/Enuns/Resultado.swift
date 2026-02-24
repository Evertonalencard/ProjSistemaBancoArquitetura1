//
//  Resultado.swift
//  ProjSistemaBancoArquitetura1
//
//  Created by Éverton Alencar de Lima on 23/02/26.
//
import Foundation

enum Resultado {
    case sucesso(novoValor: Decimal)
    case falha(erro: String)
}
