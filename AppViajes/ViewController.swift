//
//  ViewController.swift
//  AppViajes
//
//  Created by cice on 29/3/17.
//  Copyright © 2017 cice. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var backgroundImage: UIImageView!
    
    private var viajes = [Viajes(viajeID: "Paris001", ciudad: "Paris", pais: "Francia", imagenDestacada: UIImage(named: "paris"), precio: 2000, diasTotales: 5, isLiked: false),
                          Viajes(viajeID: "Roma001", ciudad: "Roma", pais: "Italia", imagenDestacada: UIImage(named: "roma"), precio: 3545, diasTotales: 4, isLiked: false)]
                          
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        backgroundImage.image = UIImage(named: "cloud")
        let blurEffect = UIBlurEffect(style: .dark)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = view.bounds
        backgroundImage.addSubview(blurEffectView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override var preferredStatusBarStyle: UIStatusBarStyle{
    return .lightContent}

}

