//
//  EstrategiaPagamento.swift
//  ProjSistemaBancoArquitetura1
//
//  Created by Éverton Alencar de Lima on 23/02/26.
//
import Foundation

protocol EstrategiaPagamento {
    
    func pagar(valor: Decimal, de origem: ProtocoloContaCorrente, para destino: ProtocoloContaCorrente) -> Resultado
}
