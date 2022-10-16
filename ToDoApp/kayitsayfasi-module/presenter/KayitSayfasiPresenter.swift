//
//  YapilacakKayitPresenter.swift
//  ToDoApp
//
//  Created by Ahsen Bahtışen on 15.10.2022.
//

import Foundation


class KayitSayfasiPresenter: ViewToPresenterKayitSayfasiProtocol{
    var kayitSayfasiInteractor: PresenterToInteractorKayitSayfasiProtocol?
    
    func ekle(yapilacak_is: String) {
        kayitSayfasiInteractor?.yapilacakEkle(yapilacak_is: yapilacak_is)
    }
}

