//
//  YapilacakDetayRouter.swift
//  ToDoApp
//
//  Created by Ahsen Bahtışen on 15.10.2022.
//

import Foundation


class DetaySayfasiRouter: PresenterToRouterDetaySayfasiProtocol{
    static func createModule(ref: DetaySayfasiVC) {
        ref.yapilacakDetayPresenterNesnesi = DetaySayfasiPresenter()
        ref.yapilacakDetayPresenterNesnesi?.detaySayfasiInteractor = DetaySayfasiInteractor()
    }
}
