//
//  AnasayfaProtocols.swift
//  ToDoApp
//
//  Created by Ahsen Bahtışen on 15.10.2022.
//

import Foundation


protocol ViewToPresenterAnasayfaProtocol{
    var anasayfaInteractor:PresenterToInteractorAnasayfaProtocol?{get set}
    var anasayfaView:PresenterToViewAnasayfaProtocol?{get set}
    func gorevleriYukle()
    func ara(aramaKelimesi:String)
    func sil(yapilacak_id:Int)
}

protocol PresenterToInteractorAnasayfaProtocol{
    var anasayfaPresenter:InteractorToPresenterAnasafaProtocol?{get set}
    
    func tumGorevleriAl()
    func gorevAra(aramaKelimesi:String)
    func gorevSil(yapilacak_id:Int)
}

protocol InteractorToPresenterAnasafaProtocol{
    func presenteraVeriGonder(gorevListe:[Yapilacaklar])
}

protocol PresenterToViewAnasayfaProtocol{
    func vieweVeriGonder(gorevListe:[Yapilacaklar])
    
}

protocol PresenterToRouterAnasayfaProtocol{
    static func createModule(ref:AnasayfaVC)
}
