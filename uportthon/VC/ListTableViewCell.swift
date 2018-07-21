//
//  ListTableViewCell.swift
//  uportthon
//
//  Created by hayato.iida on 2018/07/21.
//  Copyright © 2018年 hayato.iida. All rights reserved.
//

import UIKit

class ListTableViewCell: UITableViewCell {
  @IBOutlet weak var userImage: UIImageView!

  @IBOutlet weak var hoby: UILabel!
  @IBOutlet weak var lang: UILabel!
  @IBOutlet weak var name: UILabel!
  override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
