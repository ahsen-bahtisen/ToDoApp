//
//  YapilacakDetayPresenter.swift
//  ToDoApp
//
//  Created by Ahsen Bahtışen on 15.10.2022.
//

import Foundation

class DetaySayfasiPresenter: ViewToPresenterDataySayfasiProtocol{
    var detaySayfasiInteractor: PresenterToInteractorDetaySayfasiProtocol?
    
    func guncelle(yapilacak_id: Int, yapilacak_is: String) {
        detaySayfasiInteractor?.yapilacakGuncelle(yapilacak_id: yapilacak_id, yapilacak_is: yapilacak_is)
    }
}
