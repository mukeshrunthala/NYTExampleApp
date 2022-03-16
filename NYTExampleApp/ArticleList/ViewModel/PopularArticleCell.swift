//
//  PopularArticleCell.swift
//  NYTExampleApp
//
//  Created by Mukesh Sharma on 15/03/22.
//

import Foundation
import UIKit
import Kingfisher

class PopularArticleCell: UITableViewCell {

    @IBOutlet weak var titleLabel:UILabel!
    @IBOutlet weak var dateLabel:UILabel!
    @IBOutlet weak var articleIcon:UIImageView!

    var viewModel : PopularArticleDetailsViewModel? {
        didSet {
            guard let viewModel = viewModel else {
                return
            }
            titleLabel?.text = viewModel.heading
            dateLabel?.text = "Published Date: " + viewModel.date
            
            if let urlStr = viewModel.image {
                let url = URL(string: urlStr)
                
                let processor = RoundCornerImageProcessor(cornerRadius: 20)
                articleIcon.kf.indicatorType = .activity
                articleIcon.kf.setImage(
                    with: url,
                    placeholder: UIImage(named: "dummyImage"),
                    options: [
                        .processor(processor),
                        .scaleFactor(UIScreen.main.scale),
                        .transition(.fade(1)),
                        .cacheOriginalImage
                    ])
                {
                    result in
                    switch result {
                    case .success(let value):
                        print("Image set from : \(value.source.url?.absoluteString ?? "")")
                    case .failure(let error):
                        print("Render failed: \(error.localizedDescription)")
                    }
                }
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
