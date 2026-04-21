//
//  SaqueHandler.swift
//  ProjSistemaBancoArquitetura1
//
//  Created by Éverton Alencar de Lima on 21/04/26.
//

import Foundation

protocol SaqueHandler: AnyObject {
    var proximo: SaqueHandler? { get set }
    func handle(request: SaqueRequest) -> Resultado
}
