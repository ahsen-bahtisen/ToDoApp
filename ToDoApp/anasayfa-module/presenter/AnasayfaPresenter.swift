//
//  AnasayfaPresenter.swift
//  ToDoApp
//
//  Created by Ahsen Bahtışen on 15.10.2022.
//

import Foundation

class AnasayfaPresenter : ViewToPresenterAnasayfaProtocol{
    var anasayfaInteractor: PresenterToInteractorAnasayfaProtocol?
    var anasayfaView: PresenterToViewAnasayfaProtocol?
    
    
    
    func gorevleriYukle() {
        anasayfaInteractor?.tumGorevleriAl()
    }
    
    func ara(aramaKelimesi: String) {
        anasayfaInteractor?.gorevAra(aramaKelimesi: aramaKelimesi)
    }
    
    func sil(yapilacak_id: Int) {
        anasayfaInteractor?.gorevSil(yapilacak_id: yapilacak_id)
    }
}


extension AnasayfaPresenter : InteractorToPresenterAnasafaProtocol{
    func presenteraVeriGonder(gorevListe: [Yapilacaklar]) {
        anasayfaView?.vieweVeriGonder(gorevListe: gorevListe)
    }
}
