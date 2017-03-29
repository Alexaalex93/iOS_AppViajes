//
//  viajes.swift
//  AppViajes
//
//  Created by cice on 29/3/17.
//  Copyright © 2017 cice. All rights reserved.
//

import Foundation
import UIKit

struct Viajes {
    var viajeID = ""
    var ciudad = ""
    var pais = ""
    var imagenDestacada: UIImage?
    var precio: Int = 0
    var diasTotales: Int = 0
    var isLiked = false
    
    init(viajeID: String, ciudad: String, pais: String, imagenDestacada: UIImage!, precio: Int, diasTotales: Int, isLiked: Bool){
    
        self.viajeID = viajeID
        self.ciudad = ciudad
        self.pais = pais
        self.imagenDestacada = imagenDestacada
        self.precio = precio
        self.precio = precio
        self.diasTotales = diasTotales
        self.isLiked = isLiked
    }
    
}
