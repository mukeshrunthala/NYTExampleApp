//
//  PopularArticleListViewController.swift
//  NYTExampleApp
//
//  Created by Mukesh Sharma on 15/03/22.
//

import UIKit

class PopularArticleListViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    // data source
     var viewModel = PopularArticleViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.dataSource = viewModel;
        self.tableView.delegate = self;
    }

    override func viewDidAppear(_ animated: Bool) {
        self.activityIndicator.startAnimating();
        viewModel.loadData {
            self.tableView.reloadData();
            self.activityIndicator.stopAnimating()
        };
    }
    
    static func storyboardInstance() -> PopularArticleListViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "PopularArticleListViewController") as! PopularArticleListViewController
        return vc
    }
}

extension PopularArticleListViewController : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = PopularArticleDetailsViewController.storyboardInstance()
        vc.viewModel = PopularArticleDetailsViewModel(popularArticle: viewModel.articleList[indexPath.row])
        self.show(vc, sender:   self)
    }
}

