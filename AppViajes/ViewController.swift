//
//  ViewController.swift
//  AppViajes
//
//  Created by cice on 29/3/17.
//  Copyright © 2017 cice. All rights reserved.
//

import UIKit
import Parse

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, DestinosCollectionCellDelegate {
    
    //Hay que irse a la raiz del proyecto y en buildPhases en Link Binary with library añadir todos los framewoks que estan en la carpeta de pods/framework/ios
    
    //Las keys las sacamos de aqui https://dashboard.back4app.com/classic#/wizard/app-details/3d684eb2-9fdb-4e88-8b16-c1363601c837
    //Impotamos Parse en el app delegate  
    
    
    /*
     PFQuery -> Hacer la petición y listar objetos
        findObjectsInBackground
        return PFObject
     */

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var backgroundImage: UIImageView!
    
    
    
    private var viajes = [Viajes] ()
    
    
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
        
        cargarViajesDedeParse()
        
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
        //cell.imageView.image = viajes[indexPath.row].imagenDestacada
        cell.precioLabel.text = "\(viajes[indexPath.row].precio)"
        cell.diasLabel.text = "\(viajes[indexPath.row].diasTotales)"
        cell.isLiked = viajes[indexPath.row].isLiked
        
        
        //Cargar la imagen
        cell.imageView.image = UIImage()
        if let featuredImage = viajes[indexPath.row].imagenDestacada {
            featuredImage.getDataInBackground(block: { (imageData, error) in
                if let tripImageData = imageData {
                    cell.imageView.image = UIImage(data: tripImageData)
                }
            })
        }
        cell.layer.cornerRadius = 4.0
        cell.delegate = self
        
        return cell
    }
    
    func botonLikeApretado(cell: DestinosCollectionViewCell) { //Aquí cómo tenemos un delegado si podemos utilizar indexPath
        if let indexPath = collectionView.indexPath(for: cell){
            viajes[indexPath.row].isLiked = viajes[indexPath.row].isLiked ? false : true
            cell.isLiked = viajes[indexPath.row].isLiked
            
            //Actualizar la info en Parse
            viajes[indexPath.row].toPfObject().saveInBackground(block: { (success, error) in
                if (success) {
                    print("Se ha convertido correctamente")
                } else {
                    print("Error al convertirlo a PFObject")
                }
            })
            //let query = PFQuery(className: "Viaje")
            //query.clearCachedResult()
        }
    }
    
    func cargarViajesDedeParse(){
        viajes.removeAll(keepingCapacity: true)
        collectionView.reloadData()
        
        //Pull de la info en Parse
        let query = PFQuery(className: "Viaje")
        query.cachePolicy = PFCachePolicy.cacheElseNetwork //Si no tenemos caché tira de network pero si no lo coge de ahi
        
        query.findObjectsInBackground { (objects, error) in
            if let error = error {
            print("Error: \(error)")
            return
            }
            
            if let objects = objects {
                for(index, object) in objects.enumerated() {
                    //Parse nos devuelve un PFObject
                        //Tenemos que convertir  el PFObject a un objeto de nuestra clase Viajes
                    let viaje = Viajes(pfObject: object) //Creamos el objeto con el inicializador y lo añadimos al array
                    self.viajes.append(viaje)
                    
                    let indexPath = IndexPath(row: index, section: 0)
                    self.collectionView.insertItems(at: [indexPath])
                }
            }
        }
    }
    
    @IBAction func reloadBtn(_ sender: AnyObject) {
        cargarViajesDedeParse()
    }
    
}

