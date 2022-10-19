//
//  PageCollecionViewCell.swift
//  pageControl
//
//  Created by cuongdd on 19/10/2022.
//

import UIKit

class PageCollecionViewCell: UICollectionViewCell {
    @IBOutlet weak var indexCellLabel: UILabel!
    @IBOutlet weak var valueItemLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.backgroundColor = UIColor.random
    }
    
    func fillData(index: Int, item: String) {
        indexCellLabel.text = "at cell \(index)"
        valueItemLabel.text = "\(item)"
    }

}
