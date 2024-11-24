//
//  Colors.swift
//  ScreenApp
//
//  Created by Jhonatan Chavez on 21/11/24.
//

import UIKit

class Colors{
    static let arrayColors: [(color: UIColor, name: String)] = [
       (color: .red, name: "Rojo"),
       (color: .green, name: "Verde"),
       (color: .blue, name: "Azul"),
       (color: .yellow, name: "Amarillo"),
       (color: .orange, name: "Naranja"),
       (color: .purple, name: "Morado"),
       (color: .brown, name: "Marrón"),
       (color: .cyan, name: "Cian"),
       (color: .magenta, name: "Magenta"),
       (color: .gray, name: "Gris"),
       (color: .black, name: "Negro"),
       (color: .white, name: "Blanco"),
       (color: .lightGray, name: "Gris Claro"),
       (color: .darkGray, name: "Gris Oscuro"),
       (color: .systemPink, name: "Rosa"),
       (color: .systemIndigo, name: "Índigo"),
       (color: .systemTeal, name: "Azul Verdoso"),
       (color: .systemMint, name: "Menta"),
   ]

    
    static let dicColors = [
        "Rojo" : UIColor.red,
        "Verde": UIColor.green,
        "Blue": UIColor.blue,
        "Naranja": UIColor.orange,
        "Pink": UIColor.systemPink
    ]
    
    struct ColorItem {
        let name: String
        let color: UIColor
    }
    
    static let arrayStruct = [
        ColorItem(name: "Cyan", color: UIColor.cyan),
        ColorItem(name: "Marrón", color: UIColor.brown),
        ColorItem(name: "Magenta", color: UIColor.magenta),
        ColorItem(name: "Purpura", color: UIColor.purple)
    ]

}

 
