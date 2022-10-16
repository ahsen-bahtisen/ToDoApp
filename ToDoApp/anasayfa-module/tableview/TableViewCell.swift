//
//  TableViewCell.swift
//  ToDoApp
//
//  Created by Ahsen Bahtışen on 15.10.2022.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var yapilacakBilgiLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
