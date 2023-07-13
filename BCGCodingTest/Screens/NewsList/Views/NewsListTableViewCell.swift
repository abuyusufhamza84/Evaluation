//
//  NewsListTableViewCell.swift
//  BCGCodingTest
//
//  Created by Mohammed Sadiq on 13/07/23.
//

import UIKit
import Kingfisher

class NewsListTableViewCell: UITableViewCell {
    
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblAuthor: UILabel!
    @IBOutlet weak var imgThumbnail: UIImageView!
    
    var newsResults: NewsResults? = nil

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        loadDetails(model: self.newsResults)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    func loadDetails(model: NewsResults?) {
        self.lblTitle.text = model?.title ?? ""
        if lblTitle.text?.count == 0 {
            lblTitle.text = "No Information"
        }
        self.lblAuthor.text = model?.byline ?? ""
        self.imgThumbnail.kf.setImage(with: URL(string: model?.getImageURL(type: .Thumbnail) ?? ""))
    }
    
}
