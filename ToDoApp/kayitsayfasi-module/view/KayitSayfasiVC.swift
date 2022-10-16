//
//  YapilacakKayitVC.swift
//  ToDoApp
//
//  Created by Ahsen Bahtışen on 15.10.2022.
//

import UIKit

class KayitSayfasiVC: UIViewController {

    @IBOutlet weak var yapilacakKayitTF: UITextField!
    
    var yapilacakKayitPresenterNesnesi:ViewToPresenterKayitSayfasiProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        KayitSayfasiRouter.createModule(ref: self)

    }
    
    @IBAction func buttonEkle(_ sender: Any) {
        if let ya = yapilacakKayitTF.text{
            yapilacakKayitPresenterNesnesi?.ekle(yapilacak_is: ya)
        }
    }

}

