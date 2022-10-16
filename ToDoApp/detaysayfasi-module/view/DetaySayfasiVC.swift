//
//  YapilacakDetayVC.swift
//  ToDoApp
//
//  Created by Ahsen Bahtışen on 15.10.2022.
//

import UIKit

class DetaySayfasiVC: UIViewController {

    @IBOutlet weak var isDetayiTF: UITextField!
    
    var yapilacak:Yapilacaklar?
    var yapilacakDetayPresenterNesnesi:ViewToPresenterDataySayfasiProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        DetaySayfasiRouter.createModule(ref: self)
        
        if let y = yapilacak{
            
            isDetayiTF.text = y.yapilacak_is
        }
    }
    
    @IBAction func buttonGuncelle(_ sender: Any) {
        if let ya = isDetayiTF.text, let y = yapilacak{
            yapilacakDetayPresenterNesnesi?.guncelle(yapilacak_id: y.yapilacak_id!, yapilacak_is: ya)
        }
    }

}
