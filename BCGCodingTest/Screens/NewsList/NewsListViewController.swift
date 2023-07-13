//
//  ViewController.swift
//  BCGCodingTest
//
//  Created by Mohammed Sadiq on 11/07/23.
//

import UIKit
import Combine

// Controller to display the List of News 
class NewsListViewController: UIViewController {
    
    @IBOutlet weak var newsListTableView: UITableView!
    @IBOutlet weak var activityIndicatorView: UIActivityIndicatorView!

    
    let viewModel = NewsListViewModel()
    var cancellables = Set<AnyCancellable>()


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        doConfigureOnScreenLoad()
    }
    
    func doConfigureOnScreenLoad() {
        self.newsListTableView.register(UINib(nibName: "NewsListTableViewCell", bundle: nil), forCellReuseIdentifier: NSStringFromClass(NewsListTableViewCell.self))
        viewModel.performInitialSetup()
        bindViewModel()
        setupUI()
    }
    
    private func bindViewModel() {
        viewModel.$currentNewsDetails.sink { newsDetails in
            DispatchQueue.main.async { [weak self] in
                if self?.newsListTableView.refreshControl?.isRefreshing ?? false {
                    self?.newsListTableView.refreshControl?.endRefreshing()
                }
                self?.newsListTableView.reloadData()
            }
        }.store(in: &cancellables)
    }
    
    private func setupUI() {
        self.title = Constant.Title.titleWorldNews
        self.navigationController?.navigationBar.tintColor = UIColor.darkGray
        self.newsListTableView.refreshControl = UIRefreshControl()
        self.newsListTableView.refreshControl?.addTarget(self, action: #selector(doRefreshViewContents), for: .valueChanged)
    }
    
    @objc func doRefreshViewContents(){
        self.viewModel.loadNewsList()
    }

}

// UITableViewDataSource
extension NewsListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.getNoOfResults()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let tableCell = tableView.dequeueReusableCell(withIdentifier: NSStringFromClass(NewsListTableViewCell.self), for: indexPath) as? NewsListTableViewCell
        
        guard let cell = tableCell else {
            fatalError("NewsListTableViewCell not found")
        }
        
        cell.loadDetails(model: self.viewModel.getResultFor(index: indexPath.row))
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let newsResults =  self.viewModel.getResultFor(index: indexPath.row) {
            let viewModel = NewsDetailsViewModel(newsDetailResults: newsResults)
            let viewController = UIStoryboard(storyBoard: .main).instantiateViewController() as NewsDetailsViewController
            viewController.viewModel = viewModel
            self.navigationController?.pushViewController(viewController, animated: true)
        }
    }
}

extension NewsListViewController: UITableViewDelegate {
    
}


