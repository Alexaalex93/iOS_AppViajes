//
//  viajes.swift
//  AppViajes
//
//  Created by cice on 29/3/17.
//  Copyright © 2017 cice. All rights reserved.
//

import Foundation
import UIKit
import Parse

struct Viajes {
    var viajeID = ""
    var ciudad = ""
    var pais = ""
    var imagenDestacada: PFFile?
    var precio: Int = 0
    var diasTotales: Int = 0
    var isLiked = false
    
    init(viajeID: String, ciudad: String, pais: String, imagenDestacada: PFFile!, precio: Int, diasTotales: Int, isLiked: Bool){
    
        self.viajeID = viajeID
        self.ciudad = ciudad
        self.pais = pais
        self.imagenDestacada = imagenDestacada
        self.precio = precio
        self.precio = precio
        self.diasTotales = diasTotales
        self.isLiked = isLiked
    }
    
    init(pfObject: PFObject) {
        //Cuando es un elemento de Parse lo hacemos asi, porque lo hemos creado como objeto PFFile
        self.viajeID = pfObject.objectId! //Es una variable que creó la pagina sola
        
        //Si es un elemento propio lo cogemos como array y hacemos un casting a string
        self.ciudad = pfObject["ciudad"] as! String
        self.pais = pfObject["pais"] as! String
        self.imagenDestacada = pfObject["imagenDestacada"] as! PFFile
        self.precio = pfObject["precio"] as! Int
        self.diasTotales = pfObject["diasTotales"] as! Int
        self.isLiked = pfObject["isLiked"] as! Bool
        
    }
    
    func toPfObject() -> PFObject { //Helper method. Lo mete todo en un PFObject
        let viajeObject = PFObject(className: "Viaje")
        viajeObject.objectId = viajeID
        viajeObject["ciudad"] = ciudad
        viajeObject["pais"] = pais
        viajeObject["imagenDestacada"] = imagenDestacada
        viajeObject["precio"] = precio
        viajeObject["diasTotales"] = diasTotales
        viajeObject["isLiked"] = isLiked
        
        return viajeObject
    }
    
}
