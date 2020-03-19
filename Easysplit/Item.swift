//
//  Item.swift
//  Easysplit
//
//  Created by Mirella Almeida da Silva on 10/03/20.
//  Copyright © 2020 Mirella Almeida da Silva. All rights reserved.
//

import Foundation

class Item {
    var nome = ""
    var valor = 0.00
    var participantes = [Pessoa]()
    
    init () {
        
    }
    init (nome: String, valor: Double){
        self.nome = nome
        self.valor = valor
    }
    func dividirValorParcial() {
        //descobrir o número de pessoas referente aos botões que foram selecionados
        let participantesDoItem = participantes.count
        //dividir o valor do item pelo número de pessoas
        let valorParcialDoItem = valor / Double(participantesDoItem)
        //atribuir (salvar numa variável) o valor às pessoas que foram selecionadas, somando ao valor anterior
        for participante in participantes {
            participante.valorParcial = valorParcialDoItem + participante.valorParcial
        }
        
    }
}

func somarCompraTotal(item1: Item, item2: Item) -> Double {
    var valorTotalDaCompra: Double
    valorTotalDaCompra = item1.valor + item2.valor
    return valorTotalDaCompra
}
