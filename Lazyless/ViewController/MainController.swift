//
//  MainController.swift
//  Lazyless
//
//  Created by Luiz Sena on 09/09/22.
//

import UIKit
import Lottie

class MainController: UIViewController {
    
    private let backgroundView: MainBackgroundView = MainBackgroundView()
    private var imageTeste: UIImageView = UIImageView(image: UIImage(named: preguicaModel.personaImageName))

    private var circularProgressBar: CircularProgressView = CircularProgressView(frame: CGRect(x: 0, y: 0, width: 250, height: 250), lineWidth: 5, rounded: true)

    private var imageHeart: UIImageView = UIImageView(image: UIImage(named: preguicaModel.heart))
    
    override func loadView() {
        
        super.loadView()
        imageTeste.translatesAutoresizingMaskIntoConstraints = false
        imageHeart.translatesAutoresizingMaskIntoConstraints = false
//        circularProgressBar.translatesAutoresizingMaskIntoConstraints = false
        
        let tapGR = UITapGestureRecognizer(target: self, action: #selector(imageTapped))
        imageTeste.addGestureRecognizer(tapGR)
        imageTeste.isUserInteractionEnabled = true
        
        self.view = backgroundView
        self.view.addSubview(imageTeste)
        self.view.addSubview(imageHeart)
        
// MARK: Barra de progresso circular config
//        circularProgressBar.progressColor = .blue
//        circularProgressBar.trackColor = .lightGray
//        circularProgressBar.progress = 0.98
// MARK: -----------------------------------------------
        imageHeart.contentMode = .scaleAspectFit
        imageTeste.contentMode = .scaleAspectFit
        
        constraints()
    }
   
    func constraints(){
        NSLayoutConstraint.activate([
            imageTeste.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            imageTeste.topAnchor.constraint(equalToSystemSpacingBelow: self.view.topAnchor, multiplier: 3),
            imageTeste.widthAnchor.constraint(equalTo: view.widthAnchor ,multiplier: 0.75),
            imageTeste.heightAnchor.constraint(equalTo: self.imageTeste.widthAnchor, multiplier: 0.85),

            
            imageHeart.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            imageHeart.centerYAnchor.constraint(equalTo: self.imageTeste.bottomAnchor),
            imageHeart.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.15),
            imageHeart.heightAnchor.constraint(equalTo: self.imageHeart.widthAnchor),

        ])
        
    }
    
    @objc func imageTapped(sender: UITapGestureRecognizer) {
        if sender.state == .ended {
            print("UIImageView tapped")
        }
    }
    
}

