//
//  ViewController.swift
//  ToDoApp
//
//  Created by Ahsen Bahtışen on 15.10.2022.
//

import UIKit

class AnasayfaVC: UIViewController {

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var yapilacakTableView: UITableView!
    
    var gorevListe = [Yapilacaklar]()
    
    var anasayfaPresenterNesnesi : ViewToPresenterAnasayfaProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchBar.delegate = self
        yapilacakTableView.delegate = self
        yapilacakTableView.dataSource = self
        
        veritabaniKoplaya()
        
        AnasayfaRouter.createModule(ref: self)
        
    }
    override func viewWillAppear(_ animated: Bool) {
        anasayfaPresenterNesnesi?.gorevleriYukle()
        //her anasayfaya dönüldüğünde arayüzün güncellenmesi için
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetay"{
            if let yapilacak = sender as? Yapilacaklar{
                let gidilecekVC = segue.destination as! DetaySayfasiVC
                gidilecekVC.yapilacak = yapilacak
            }
        }
    }
    
    func veritabaniKoplaya(){
        let bundleYolu = Bundle.main.path(forResource: "todoapp", ofType: ".sqlite")
        let hedefYol = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let kopyalanacakYer = URL(fileURLWithPath: hedefYol).appendingPathComponent("todoapp.sqlite")
        let fileManager = FileManager.default
        
        if fileManager.fileExists(atPath: kopyalanacakYer.path){
            print("Veritabanı zaten kopyalanmış")
        }else{
            do{
                try fileManager.copyItem(atPath: bundleYolu!, toPath: kopyalanacakYer.path)
            }catch{
                print(error)
            }
        }
    }
}

extension AnasayfaVC : PresenterToViewAnasayfaProtocol{
    func vieweVeriGonder(gorevListe: [Yapilacaklar]) {
        self.gorevListe = gorevListe
        self.yapilacakTableView.reloadData()
    }
}

extension AnasayfaVC : UISearchBarDelegate{
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        anasayfaPresenterNesnesi?.ara(aramaKelimesi: searchText)
    }
}

extension AnasayfaVC : UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return gorevListe.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let yapilacak = gorevListe[indexPath.row]
        let hucre = tableView.dequeueReusableCell(withIdentifier: "yapilacakHucre") as! TableViewCell
        hucre.yapilacakBilgiLabel.text = "\(yapilacak.yapilacak_is!)"
        return hucre
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let yapilacak = gorevListe[indexPath.row]
        performSegue(withIdentifier: "toDetay", sender: yapilacak)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let silAction = UIContextualAction(style: .destructive, title: "Sil"){(contextualAction,view,bool) in
            let yapilacak = self.gorevListe[indexPath.row]
            
            let alert = UIAlertController(title: "Silme İşlemi", message: "\(yapilacak.yapilacak_is!) görevini silmek istiyor musunuz?", preferredStyle: .alert)
            
            let iptalAction = UIAlertAction(title: "İptal", style: .cancel)
            alert.addAction(iptalAction)
            let evetAction = UIAlertAction(title: "Evet", style: .destructive){
                action in
                self.anasayfaPresenterNesnesi?.sil(yapilacak_id: yapilacak.yapilacak_id!)
            }
            alert.addAction(evetAction)
            
            self.present(alert, animated: true)
            
        }
        return UISwipeActionsConfiguration(actions: [silAction])
    }
}
