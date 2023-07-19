//
//  TahminEkraniVC.swift
//  Sayi Tahmin Et
//
//  Created by Samet on 19.07.2023.
//

import UIKit

class TahminEkraniVC: UIViewController {

    @IBOutlet weak var textfieldGirdi: UITextField!
    @IBOutlet weak var labelYardim: UILabel!
    @IBOutlet weak var labelKalanHak: UILabel!
    
    var rasgeleSayi:Int?
    var kalanHak = 5
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        rasgeleSayi = Int(arc4random_uniform(100)) //0-100 sayı üret demek
        
        print("Rasgele Sayı : \(rasgeleSayi!)") //Konsolda doğru sayı hangisi olduğunu görmek için

            }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let gelenVeri = sender as? Bool {
            
            let gidilecekVC = segue.destination as! SonucEkraniVC
            
            gidilecekVC.sonuc = gelenVeri
            
        }
        
    }
    
    @IBAction func tahminet(_ sender: Any) {
        labelYardim.isHidden = false
        kalanHak=kalanHak-1
        
        
        if let veri = textfieldGirdi.text {
            
            if let tahmin = Int(veri) {
                
                if kalanHak != 0 {
                    
                    
                    if tahmin == rasgeleSayi {
                        //Doğru bilmek
                        let sonuc = true
                        performSegue(withIdentifier: "tahminTosonuc", sender: sonuc)
                    }
                    if tahmin > rasgeleSayi! {
                        labelYardim.text = "Azalt"
                        labelKalanHak.text = "Kalan Hak : \(kalanHak)"
                    }
                    if tahmin < rasgeleSayi! {
                        labelYardim.text = "Arttır"
                        labelKalanHak.text = "Kalan Hak : \(kalanHak)"
                    }
                    
                }else{
                    //Sayfa Geçişi olacak
                    let sonuc = false
                    performSegue(withIdentifier: "tahminTosonuc", sender: sonuc)
                }
                
                textfieldGirdi.text = ""
            }
        }
        
    
    }
}
