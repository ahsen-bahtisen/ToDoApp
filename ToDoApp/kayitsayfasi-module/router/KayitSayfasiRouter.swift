//
//  YapilacakKayitRouter.swift
//  ToDoApp
//
//  Created by Ahsen Bahtışen on 15.10.2022.
//

import Foundation

class KayitSayfasiRouter :PresenterToRouterKayitSayfasiProtocol{
    static func createModule(ref: KayitSayfasiVC) {
        ref.yapilacakKayitPresenterNesnesi = KayitSayfasiPresenter()
        ref.yapilacakKayitPresenterNesnesi?.kayitSayfasiInteractor = KayitSayfasiInteractor()
    }
}
