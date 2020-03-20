//
//  ViewController.swift
//  Easysplit
//
//  Created by Mirella Almeida da Silva on 03/03/20.
//  Copyright © 2020 Mirella Almeida da Silva. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    //    let notas: [String] = ["Dó", "Ré", "Mi"]
    //
    //    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
    //        if row == 0 {
    //        return notas[0]
    //        }
    //
    //        else if row == 1 {
    //            return notas[1]
    //        }
    //
    //        else {
    //            return notas[2]
    //        }
    //    }
    //
    //    func numberOfComponents(in pickerView: UIPickerView) -> Int {
    //        return 1
    //    }
    //
    //    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
    //        return 3
    //    }
    //
    
    
    var pessoas: [Pessoa] = []
    var itens: [Item] = []
    
    var precoItem1: Double = 0
    var precoItem2: Double = 0
    
    
    @IBOutlet var pessoa1Item1: UILabel!
    @IBOutlet var pessoa2Item1: UILabel!
    @IBOutlet var pessoa3Item1: UILabel!
    @IBOutlet var pessoa1Item2: UILabel!
    @IBOutlet var pessoa2Item2: UILabel!
    @IBOutlet var pessoa3Item2: UILabel!
    
    var nomePessoa1 = ""
    var nomePessoa2 = ""
    var nomePessoa3 = ""
    
    @IBOutlet var textFieldPessoa1: UITextField!
    @IBOutlet var textFieldPessoa2: UITextField!
    @IBOutlet var textFieldPessoa3: UITextField!
    
    @IBOutlet var nomeItem1: UITextField!
    @IBOutlet var nomeItem2: UITextField!
    @IBOutlet var valorItem1: UITextField!
    @IBOutlet var valorItem2: UITextField!
    
    @IBOutlet var resultadoPessoa1: UILabel!
    @IBOutlet var resultadoPessoa2: UILabel!
    @IBOutlet var resultadoPessoa3: UILabel!
    @IBOutlet var somaCompra: UILabel!
    
    @IBOutlet var aparenciaBotaoOK: UIButton!
    @IBOutlet var aparenciaBotaoCalcular: UIButton!
   
    @IBOutlet var header: UIView!
    @IBOutlet var boxResultado: UIView!
    @IBOutlet var boxCompra: UIView!
    @IBOutlet var labelCompra: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("Carregou")
        
        itens.append(Item())
        itens.append(Item())
        
        header.layer.cornerRadius = 30
        
        aparenciaBotaoOK.layer.cornerRadius = 5
        aparenciaBotaoCalcular.layer.cornerRadius = 5
        boxResultado.layer.cornerRadius = 5
        boxCompra.layer.cornerRadius = 5
        labelCompra.textColor = .lightGray
        
        ocultarLabelBotoes(ocultar:true)
        ocultarBoxResultado(ocultar: true)
        ocultarBoxCompra(ocultar: false)
        
        textFieldPessoa1.delegate = self
        textFieldPessoa2.delegate = self
        textFieldPessoa3.delegate = self
        textFieldPessoa1.keyboardType = UIKeyboardType.alphabet
        textFieldPessoa2.keyboardType = UIKeyboardType.alphabet
        textFieldPessoa3.keyboardType = UIKeyboardType.alphabet
    }
    
    @IBAction func tapGesture(_ sender: Any) {
        textFieldPessoa1.resignFirstResponder()
        textFieldPessoa2.resignFirstResponder()
        textFieldPessoa3.resignFirstResponder()
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textFieldPessoa1.resignFirstResponder()
        textFieldPessoa2.resignFirstResponder()
        textFieldPessoa3.resignFirstResponder()
        return true
    }
    
    func ocultarBoxResultado(ocultar:Bool) {
        boxResultado.isHidden = ocultar
    }
    
    func ocultarBoxCompra(ocultar:Bool) {
    boxCompra.isHidden = ocultar
    }
        
    func ocultarLabelBotoes(ocultar:Bool) {
        pessoa1Item1.isHidden = ocultar
        pessoa2Item1.isHidden = ocultar
        pessoa3Item1.isHidden = ocultar
        pessoa1Item2.isHidden = ocultar
        pessoa2Item2.isHidden = ocultar
        pessoa3Item2.isHidden = ocultar
        aparenciaBotaoCalcular.isHidden = ocultar
    }
    
    
    @IBAction func cadastrarPessoas(_ sender: Any) {
        ocultarLabelBotoes(ocultar:false)
        labelCompra.textColor = .darkGray
        ocultarBoxCompra(ocultar: true)
        pessoas.append(Pessoa(nomeDaPessoa: textFieldPessoa1.text!))
        pessoas.append(Pessoa(nomeDaPessoa: textFieldPessoa2.text!))
        pessoas.append(Pessoa(nomeDaPessoa: textFieldPessoa3.text!))
        
        pessoa1Item1.text = textFieldPessoa1.text!
        pessoa2Item1.text = textFieldPessoa2.text!
        pessoa3Item1.text = textFieldPessoa3.text!
        pessoa1Item2.text = textFieldPessoa1.text!
        pessoa2Item2.text = textFieldPessoa2.text!
        pessoa3Item2.text = textFieldPessoa3.text!
        textFieldPessoa1.resignFirstResponder()
        textFieldPessoa2.resignFirstResponder()
        textFieldPessoa3.resignFirstResponder()
    }
    
    
    @IBAction func botaoPessoa1Item1(_ sender: Any) {
        pessoa1Item1.textColor = .systemBlue
        itens[0].participantes.append(pessoas[0])
    }
    @IBAction func botaoPessoa2Item1(_ sender: Any) {
        pessoa2Item1.textColor = .systemBlue
        itens[0].participantes.append(pessoas[1])
    }
    @IBAction func botaoPessoa3Item1(_ sender: Any) {
        pessoa3Item1.textColor = .systemBlue
        itens[0].participantes.append(pessoas[2])
    }
    @IBAction func botaoPessoa1Item2(_ sender: Any) {
        pessoa1Item2.textColor = .systemBlue
        itens[1].participantes.append(pessoas[0])
    }
    @IBAction func botaoPessoa2Item2(_ sender: Any) {
        pessoa2Item2.textColor = .systemBlue
        itens[1].participantes.append(pessoas[1])
    }
    @IBAction func botaoPessoa3Item2(_ sender: Any) {
        pessoa3Item2.textColor = .systemBlue
        itens[1].participantes.append(pessoas[2])
    }
    
    
    @IBAction func botaoCalcular(_ sender: Any) {
        //itens.append(Item(nome: "Miojo", valor: Double(valorItem1.text!)!))
        ocultarBoxResultado(ocultar:false)
        itens[0].nome = nomeItem1.text ?? "Miojo"
        itens[1].nome = nomeItem2.text ?? "Pitú"
        itens[0].valor = Double(valorItem1.text!)!
        itens[1].valor = Double(valorItem2.text!)!
        
        let resultado = somarCompraTotal(item1: itens[0], item2: itens[1])
        somaCompra.text = "R$ \(resultado)"
        
        itens[0].dividirValorParcial()
        itens[1].dividirValorParcial()
        
        let resultadoParcial1 = pessoas[0].valorParcial
        resultadoPessoa1.text = String("R$ %.2d",(resultadoParcial1))
        let resultadoParcial2 = pessoas[1].valorParcial
        resultadoPessoa2.text = "R$ \(resultadoParcial2)"
        let resultadoParcial3 = pessoas[2].valorParcial
        resultadoPessoa3.text = "R$ \(resultadoParcial3)"
        
        
    }
    
}
