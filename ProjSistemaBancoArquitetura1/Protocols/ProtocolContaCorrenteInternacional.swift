//
//  ProtocolContaCorrenteInternacional.swift
//  ProjSistemaBancoArquitetura1
//
//  Created by Éverton Alencar de Lima on 14/04/26.
//

import Foundation

protocol ProtocolContaCorrenteInternacional:ProtocoloContaCorrente {
    var taxaIOF:Decimal {get}
    var cambioDolar:Decimal {get}
    
}
