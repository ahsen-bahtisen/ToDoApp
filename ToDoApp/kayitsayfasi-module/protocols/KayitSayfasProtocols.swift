//
//  YapilacakKayitProtocols.swift
//  ToDoApp
//
//  Created by Ahsen Bahtışen on 15.10.2022.
//

import Foundation

protocol ViewToPresenterKayitSayfasiProtocol{
    var kayitSayfasiInteractor:PresenterToInteractorKayitSayfasiProtocol?{get set}
    
    func ekle(yapilacak_is:String)
}
protocol PresenterToInteractorKayitSayfasiProtocol{
    func yapilacakEkle(yapilacak_is:String)
}

protocol PresenterToRouterKayitSayfasiProtocol{
    static func createModule(ref:KayitSayfasiVC)
}
