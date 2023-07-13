//
//  NewsDetailsViewController.swift
//  BCGCodingTest
//
//  Created by Mohammed Sadiq on 13/07/23.
//

import UIKit

class NewsDetailsViewController: UIViewController {
    
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var txtViewNewsAbstract: UITextView!
    @IBOutlet weak var btnBrowser: UIButton!
    
    var viewModel:NewsDetailsViewModel? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        doConfigureOnScreenLoad()
    }
    
    func doConfigureOnScreenLoad() {
        setupUI()
    }
    
    func setupUI() {
        self.title = Constant.Title.titleNewsDetails
        imgView.kf.setImage(with: URL(string: viewModel?.getPosterImageUrl() ?? ""))
        txtViewNewsAbstract.text = viewModel?.newsDetailsResults?.abstract
    }
    
    @IBAction func doNavigateToBrowser(_ sender: Any) {
        if let url = URL(string: viewModel?.newsDetailsResults?.url ?? "") {
            UIApplication.shared.open(url)
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
