//
//  SonucEkraniVC.swift
//  Sayi Tahmin Et
//
//  Created by Samet on 19.07.2023.
//

import UIKit

class SonucEkraniVC: UIViewController {

    @IBOutlet weak var labelSonuc: UILabel!
    @IBOutlet weak var imageViewSonuc: UIImageView!
    
    var sonuc:Bool?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.hidesBackButton = true //Son sayfadan geri tahmin ekranına gitme tuşu olan üsr tarafdaki yeri kapatıyoruz
        
        self.navigationItem.title = "Sonuç Ekranı"

        print(sonuc!)
        
        if sonuc! {
            labelSonuc.text = "KAZANDINIZ"
            imageViewSonuc.image = UIImage(named: "mutlu_resim")
            
        }else{
            labelSonuc.text = "KAYBETTİNİZ"
            imageViewSonuc.image = UIImage(named: "uzgun_resim")
        }
        
        
    }
    @IBAction func tekrarOyna(_ sender: Any) {
        
        navigationController?.popToRootViewController(animated: true) //direk ilk sayfaya atan kod
        
    }
}
