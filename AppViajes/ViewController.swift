//
//  ViewController.swift
//  AppViajes
//
//  Created by cice on 29/3/17.
//  Copyright © 2017 cice. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, DestinosCollectionCellDelegate {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var backgroundImage: UIImageView!
    
    private var viajes = [Viajes(viajeID: "Paris001", ciudad: "Paris", pais: "Francia", imagenDestacada: UIImage(named: "paris"), precio: 2000, diasTotales: 5, isLiked: false),
                         Viajes(viajeID: "Roma001", ciudad: "Roma", pais: "Italia", imagenDestacada: UIImage(named: "rome"), precio: 800, diasTotales: 3, isLiked: false),
                         Viajes(viajeID: "Turquia001", ciudad: "Istanbul", pais: "Turquia", imagenDestacada: UIImage(named: "istanbul"), precio: 900, diasTotales: 5, isLiked: false),
                         Viajes(viajeID: "Japon001", ciudad: "Kyoto", pais: "Japon", imagenDestacada: UIImage(named: "kyoto"), precio: 1800, diasTotales: 2, isLiked: false),
                         Viajes(viajeID: "UK001", ciudad: "London", pais: "UK", imagenDestacada: UIImage(named: "london"), precio: 1200, diasTotales: 9, isLiked: false),
                         Viajes(viajeID: "EEUU001", ciudad: "New York", pais: "EEUU", imagenDestacada: UIImage(named: "newyork"), precio: 600, diasTotales: 1, isLiked: false),
                         Viajes(viajeID: "Italia001", ciudad: "Santorini", pais: "Italia", imagenDestacada: UIImage(named: "santorini"), precio: 300, diasTotales: 2, isLiked: false),
                         Viajes(viajeID: "Australia001", ciudad: "Sydney", pais: "Australia", imagenDestacada: UIImage(named: "sydney"), precio: 650, diasTotales: 10, isLiked: false),
                         Viajes(viajeID: "Suiza001", ciudad: "Zurich", pais: "Suiza", imagenDestacada: UIImage(named: "zurich"), precio: 400, diasTotales: 5, isLiked: false)]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        backgroundImage.image = UIImage(named: "cloud")
        let blurEffect = UIBlurEffect(style: .dark)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = view.bounds
        backgroundImage.addSubview(blurEffectView)
        
        collectionView.backgroundColor = UIColor.clear
        
        if UIScreen.main.bounds.size.height == 568.0 { //Si es iPhone 5
            let flowLayout = self.collectionView.collectionViewLayout as! UICollectionViewFlowLayout
            flowLayout.itemSize = CGSize(width: 250.0, height: 330.0
            )
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override var preferredStatusBarStyle: UIStatusBarStyle{
    return .lightContent}
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viajes.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! DestinosCollectionViewCell
        
        cell.ciudadLabel.text = viajes[indexPath.row].ciudad
        cell.paisLabel.text = viajes[indexPath.row].pais
        cell.imageView.image = viajes[indexPath.row].imagenDestacada
        cell.precioLabel.text = "\(viajes[indexPath.row].precio)"
        cell.diasLabel.text = "\(viajes[indexPath.row].diasTotales)"
        cell.isLiked = viajes[indexPath.row].isLiked
        
        cell.layer.cornerRadius = 4.0
        cell.delegate = self
        
        return cell
    }
    
    func botonLikeApretado(cell: DestinosCollectionViewCell) { //Aquí cómo tenemos un delegado si podemos utilizar indexPath
        if let indexPath = collectionView.indexPath(for: cell){
            viajes[indexPath.row].isLiked = viajes[indexPath.row].isLiked ? false : true
            cell.isLiked = viajes[indexPath.row].isLiked
        }
    }

}

