//
//  PopularArticleDetailsViewController.swift.swift
//  NYTExampleApp
//
//  Created by Mukesh Sharma on 16/03/22.
//

import UIKit

class PopularArticleDetailsViewController: UIViewController {
    @IBOutlet weak var titleLabel:UILabel!
    @IBOutlet weak var byLineLabel:UILabel!
    @IBOutlet weak var dateLabel:UILabel!
    @IBOutlet weak var articleIcon:UIImageView!
    
    var viewModel : PopularArticleDetailsViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setValues()
        // Do any additional setup after loading the view.
    }
    
    func setValues() {
        
        guard let viewModel = viewModel else {
            return
        }
        titleLabel?.text = viewModel.heading
        byLineLabel?.text = viewModel.details
        dateLabel?.text = "Published Date: " + viewModel.date
        
        if let urlStr = viewModel.image {
            let url = URL(string: urlStr)
            
            articleIcon.kf.indicatorType = .activity
            articleIcon.kf.setImage(
                with: url,
                placeholder: UIImage(named: "dummyImage"),
                options: [
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
    
    static func storyboardInstance() -> PopularArticleDetailsViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "PopularArticleDetailsViewController") as! PopularArticleDetailsViewController
        return vc
    }
    
}
