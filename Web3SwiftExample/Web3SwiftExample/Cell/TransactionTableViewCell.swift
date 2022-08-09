//
//  TransactionTableViewCell.swift
//  Web3SwiftExample
//
//  Created by MacOS on 08/08/2022.
//

import UIKit

class TransactionTableViewCell: UITableViewCell {

    @IBOutlet weak var lblFrom: UILabel!
    @IBOutlet weak var lblTo: UILabel!
    @IBOutlet weak var lblValue: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    static let identifier = "TransactionTableViewCell"
    
    static func nib() -> UINib {
        return UINib(nibName: "TransactionTableViewCell", bundle: nil)
    }
    
    // configure the cel
    func configure (with model: EachTransaction){
//        self.lblFrom.text = model.from
//        self.lblTo.text = model.to
//        self.lblValue.text = model.value
    }
    
}
