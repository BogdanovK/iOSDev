//
//  ViewController.swift
//  Calculator
//
//  Created by Константин Богданов on 11.09.2018.
//  Copyright © 2018 Константин Богданов. All rights reserved.
//

import UIKit


class ViewController: UIViewController, DigitalButtonRecieverProtocol, OperationButtonRecieverProtocol {
    
    var result: Float?

    var currentOperation = Operation.noOperation
    var label = UILabel();
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        self.setupLabel()
        self.setupButtons()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    private func setupLabel() {
        self.view.addSubview(self.label)
        self.label.text = "0"
        self.label.layer.borderColor = UIColor.black.cgColor
        self.label.layer.borderWidth = 2
        self.label.layer.cornerRadius = Constants.cornerRadius()
        self.label.textAlignment = .center
        self.label.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.label.topAnchor.constraint(equalTo: self.view.topAnchor, constant: Constants.buttonsOffset()),
            self.label.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: Constants.buttonsOffset()),
            self.label.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -Constants.buttonsOffset()),
            self.label.heightAnchor.constraint(equalToConstant: 30),
            ])
    }
    
    private func setupButtons() {
        // Задание: переписать этот метод до 15 строк и меньше
        let button0 = DigitalButton(number: 0, reciever: self)
        let button1 = DigitalButton(number: 1, reciever: self)
        let button2 = DigitalButton(number: 2, reciever: self)
        let button3 = DigitalButton(number: 3, reciever: self)
        let button4 = DigitalButton(number: 4, reciever: self)
        let button5 = DigitalButton(number: 5, reciever: self)
        let button6 = DigitalButton(number: 6, reciever: self)
        let button7 = DigitalButton(number: 7, reciever: self)
        let button8 = DigitalButton(number: 8, reciever: self)
        let button9 = DigitalButton(number: 9, reciever: self)

        let buttonPlus = OperationButton(operation: .plus, reciever: self)
        let buttonMinus = OperationButton(operation: .minus, reciever: self)
        let buttonMultiple = OperationButton(operation: .multiple, reciever: self)
        let buttonDevide = OperationButton(operation: .devide, reciever: self)
        let dotButton = OperationButton(operation: .dot, reciever: self)
        let buttonEqual = OperationButton(operation: .equal, reciever: self)
        
        self.view.addSubview(button0);
        self.view.addSubview(button1);
        self.view.addSubview(button2);
        self.view.addSubview(button3);
        self.view.addSubview(button4);
        self.view.addSubview(button5);
        self.view.addSubview(button6);
        self.view.addSubview(button7);
        self.view.addSubview(button8);
        self.view.addSubview(button9);
        
        self.view.addSubview(buttonPlus);
        self.view.addSubview(buttonMinus);
        self.view.addSubview(buttonMultiple);
        self.view.addSubview(buttonDevide);
        self.view.addSubview(dotButton)
        self.view.addSubview(buttonEqual);
        

        NSLayoutConstraint.activate([
            button1.topAnchor.constraint(equalTo: self.label.bottomAnchor, constant: Constants.buttonsOffset()),
            button1.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: Constants.buttonsOffset()),
            button2.centerYAnchor.constraint(equalTo: button1.centerYAnchor),
            button2.leftAnchor.constraint(equalTo: button1.rightAnchor, constant: Constants.buttonsOffset()),
            button3.centerYAnchor.constraint(equalTo: button1.centerYAnchor),
            button3.leftAnchor.constraint(equalTo: button2.rightAnchor, constant: Constants.buttonsOffset()),
            buttonPlus.centerYAnchor.constraint(equalTo: button1.centerYAnchor),
            buttonPlus.leftAnchor.constraint(equalTo: button3.rightAnchor, constant: Constants.buttonsOffset()),
            
            button4.topAnchor.constraint(equalTo: button1.bottomAnchor, constant: Constants.buttonsOffset()),
            button4.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: Constants.buttonsOffset()),
            button5.centerYAnchor.constraint(equalTo: button4.centerYAnchor),
            button5.leftAnchor.constraint(equalTo: button4.rightAnchor, constant: Constants.buttonsOffset()),
            button6.centerYAnchor.constraint(equalTo: button4.centerYAnchor),
            button6.leftAnchor.constraint(equalTo: button5.rightAnchor, constant: Constants.buttonsOffset()),
            buttonMinus.centerYAnchor.constraint(equalTo: button4.centerYAnchor),
            buttonMinus.leftAnchor.constraint(equalTo: button6.rightAnchor, constant: Constants.buttonsOffset()),
            
            button7.topAnchor.constraint(equalTo: button4.bottomAnchor, constant: Constants.buttonsOffset()),
            button7.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: Constants.buttonsOffset()),
            button8.centerYAnchor.constraint(equalTo: button7.centerYAnchor),
            button8.leftAnchor.constraint(equalTo: button7.rightAnchor, constant: Constants.buttonsOffset()),
            button9.centerYAnchor.constraint(equalTo: button7.centerYAnchor),
            button9.leftAnchor.constraint(equalTo: button8.rightAnchor, constant: Constants.buttonsOffset()),
            buttonMultiple.centerYAnchor.constraint(equalTo: button7.centerYAnchor),
            buttonMultiple.leftAnchor.constraint(equalTo: button9.rightAnchor, constant: Constants.buttonsOffset()),
            
            dotButton.topAnchor.constraint(equalTo: button7.bottomAnchor, constant: Constants.buttonsOffset()),
            dotButton.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: Constants.buttonsOffset()),
            button0.centerYAnchor.constraint(equalTo: dotButton.centerYAnchor),
            button0.leftAnchor.constraint(equalTo: dotButton.rightAnchor, constant: Constants.buttonsOffset()),
            buttonEqual.centerYAnchor.constraint(equalTo: dotButton.centerYAnchor),
            buttonEqual.leftAnchor.constraint(equalTo: button0.rightAnchor, constant: Constants.buttonsOffset()),
            buttonDevide.centerYAnchor.constraint(equalTo: dotButton.centerYAnchor),
            buttonDevide.leftAnchor.constraint(equalTo: buttonEqual.rightAnchor, constant: Constants.buttonsOffset())
            ])
    }
    
    func userTap(number: UInt) {
        if var textNumber = self.label.text {
            let currentNumber = Float(self.label.text!)!
            
            if (currentNumber == 0)
            {
                textNumber = "\(number)"
            }
            else
            {
                textNumber.append("\(number)")
            }
            self.label.text = textNumber
        }
    }
    
    func executeOperation(_ operation: Operation) {
        switch operation {
            case .noOperation:
                break
            case .plus:
                self.addNumber()
                break
            case .minus:
                self.substractNumber()
                break
            case .multiple:
                self.multiplyNumber()
                break
            case .devide:
                self.devideNumber()
                break
            case .dot:
                
                break
            case .equal:
                self.showResult()
                break
            }
    }
    
    func writeResult() {
        self.result = Float(self.label.text!)!
    }
    
    func addNumber() {
        self.currentOperation = .plus
        if let result = self.result {
            let numberFromScreen = Float(self.label.text!)!
            // Задание: сложение
            self.result = result + numberFromScreen
            
        }
        else
        {
            self.writeResult()
        }
        self.label.text = "0"
    }
    
    func substractNumber() {
        self.currentOperation = .minus
        if let result = self.result{
            let numberFromScreen = Float(self.label.text!)!
            // Задание: вычитание
            
        }
        else
        {
            self.writeResult()
        }
        self.label.text = "0"

    }
    
    func devideNumber() {
        self.currentOperation = .devide
        
        if let result = self.result {
            let numberFromScreen = Float(self.label.text!)!
            // Задание: деление
            self.result = result / numberFromScreen 
        }
        else
        {
            self.writeResult()
        }
        self.label.text = "0"
    }
    
    func multiplyNumber() {
        self.currentOperation = .multiple
        if let result = self.result {
            let numberFromScreen = Float(self.label.text!)!
            self.result = numberFromScreen *  result
            
            // Задание: умножение
            
        }
        else
        {
            self.writeResult()
        }

        self.label.text = "0"
    }
    
    func showResult() {
        switch self.currentOperation {
        case .noOperation:
            break
        case .plus:
            self.addNumber()
            break
        case .minus:
            self.substractNumber()
            break
        case .multiple:
            self.multiplyNumber()
            break
        case .devide:
            self.devideNumber()
            break
        case .dot:
            break
        case .equal:
            break
        }
        
        if let result = self.result {
            self.label.text = "\(result)"
            self.result = nil
        }
    }
}

