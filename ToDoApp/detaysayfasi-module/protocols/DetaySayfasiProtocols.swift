//
//  YapilacakDetayProtocols.swift
//  ToDoApp
//
//  Created by Ahsen Bahtışen on 15.10.2022.
//

import Foundation

protocol ViewToPresenterDataySayfasiProtocol{
    var detaySayfasiInteractor: PresenterToInteractorDetaySayfasiProtocol? {get set}
    
    func guncelle(yapilacak_id:Int, yapilacak_is:String)
}

protocol PresenterToInteractorDetaySayfasiProtocol{
    func yapilacakGuncelle(yapilacak_id:Int, yapilacak_is:String)
}

protocol PresenterToRouterDetaySayfasiProtocol{
    static func createModule(ref:DetaySayfasiVC)
}
