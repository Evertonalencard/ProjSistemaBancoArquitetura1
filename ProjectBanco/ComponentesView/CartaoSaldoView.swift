//
//  CartaoSaldoView.swift
//  ProjSistemaBancoArquitetura1
//
//  Created by Éverton Alencar de Lima on 27/04/26.
//
import SwiftUI

struct CartaoSaldoView: View {
    @ObservedObject var controller: ControllerContaCorrente
    
    private var negativado: Bool { controller.saldo < 0 }
    
    var body: some View {
        VStack(spacing: 6) {
            Text("CONTA CORRENTE")
                .font(.system(size: 10, weight: .bold))
                .tracking(2.5)
                .foregroundStyle(.white.opacity(0.55))
            
            Text("Éverton")
                .font(.title3.weight(.medium))
                .foregroundStyle(.white.opacity(0.85))
            
            Spacer().frame(height: 10)
            
            Text(formatarMoeda(controller.saldo))
                .font(.system(size: 46, weight: .bold, design: .rounded))
                .foregroundStyle(negativado ? Color.red : Color.white)
                .contentTransition(.numericText())
                .animation(.spring(response: 0.4, dampingFraction: 0.75), value: controller.saldo)
            
            Text("Saldo disponível")
                .font(.caption)
                .foregroundStyle(.white.opacity(0.45))
            
            if negativado {
                HStack(spacing: 5) {
                    Image(systemName: "exclamationmark.triangle.fill")
                    Text("Conta negativada")
                }
                .font(.caption.weight(.semibold))
                .foregroundStyle(.red)
                .padding(.horizontal, 14)
                .padding(.vertical, 6)
                .background(.red.opacity(0.18), in: Capsule())
                .transition(.scale(scale: 0.85).combined(with: .opacity))
                .padding(.top, 4)
            }
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical, 36)
        .padding(.horizontal, 24)
        .glassEffect()
        .animation(.spring(response: 0.35), value: negativado)
    }
}
