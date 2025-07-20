//
//  EmojiTableViewCell.swift
//  TableView
//
//  Created by Şerif Botan Kapcuk on 27.06.2025.
//

import UIKit

class EmojiTableViewCell: UITableViewCell {

    @IBOutlet var emojiSybmolLabel: UILabel!
    @IBOutlet var nameLabel:UILabel!
    @IBOutlet var descriptionLabel:UILabel!
    
    func update(with emoji:Emoji){
        emojiSybmolLabel.text=emoji.symbol
        nameLabel.text=emoji.name
        descriptionLabel.text=emoji.descripton
        
    }

}
