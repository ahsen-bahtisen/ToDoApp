//
//  AnasayfaInteractor.swift
//  ToDoApp
//
//  Created by Ahsen Bahtışen on 15.10.2022.
//

import Foundation

class AnasayfaInteractor : PresenterToInteractorAnasayfaProtocol{
    var anasayfaPresenter: InteractorToPresenterAnasafaProtocol?
    
    let db:FMDatabase?
    
    init(){
        let hedefYol = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let kopyalanacakYer = URL(fileURLWithPath: hedefYol).appendingPathComponent("todoapp.sqlite")
        db = FMDatabase(path: kopyalanacakYer.path)
    }
    
    func tumGorevleriAl() {
        var liste = [Yapilacaklar]()
        
        db?.open()
        
        do{
            let r = try db!.executeQuery("SELECT * FROM yapilacaklar", values: nil)
            while r.next(){
                let gorev = Yapilacaklar(yapilacak_id: Int(r.string(forColumn: "yapilacak_id"))!, yapilacak_is: r.string(forColumn: "yapilacak_is")!)
                
                liste.append(gorev)
            }
            anasayfaPresenter?.presenteraVeriGonder(gorevListe: liste)
        }catch{
            print(error.localizedDescription)
        }
        
        db?.close()
    }
    
    func gorevAra(aramaKelimesi: String) {
        var liste = [Yapilacaklar]()
        
        db?.open()
        
        do{
            let r = try db!.executeQuery("SELECT * FROM yapilacaklar WHERE yapilacak_is like '%\(aramaKelimesi)%'", values: nil)
            while r.next(){
                let gorev = Yapilacaklar(yapilacak_id: Int(r.string(forColumn: "yapilacak_id"))!, yapilacak_is: r.string(forColumn: "yapilacak_is")!)
                
                liste.append(gorev)
            }
            anasayfaPresenter?.presenteraVeriGonder(gorevListe: liste)
        }catch{
            print(error.localizedDescription)
        }
        
        db?.close()
    }
    
    func gorevSil(yapilacak_id: Int) {
        db?.open()
        
        do{
            try db!.executeUpdate("DELETE FROM yapilacaklar WHERE yapilacak_id = ?", values: [yapilacak_id])
            tumGorevleriAl()
        }catch{
            print(error.localizedDescription)
        }
        
        db?.close()
    }
}
