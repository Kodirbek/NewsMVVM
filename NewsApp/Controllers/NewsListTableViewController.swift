//
//  NewsListTableViewController.swift
//  NewsApp
//
//  Created by Abduqodir's MacPro on 2022/10/05.
//

import Foundation
import UIKit

class NewsListTableViewController: UITableViewController {
  
  private var articleListVM: ArticleListViewModel!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setUp()
  }
  
  private func setUp() {
    
    navigationController?.navigationBar.prefersLargeTitles = true
    
    let url = URL(string: "https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=745bc96f3682457d8f7714c7d23c6a37")!
    
    WebService().getArticles(url: url) { articles in
      
      if let articles = articles {
        self.articleListVM = ArticleListViewModel(articles: articles)
        
        DispatchQueue.main.async {
          self.tableView.reloadData()
        }
      }
    }
  }
  
  override func numberOfSections(in tableView: UITableView) -> Int {
    return self.articleListVM == nil ? 0 : self.articleListVM.numberOfSections
  }
  
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return self.articleListVM.numberOfRowsInSection(section)
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: "ReusableCell", for: indexPath) as? ArticleTableViewCell else {
      fatalError("ReusableCell not found!")
    }
    
    let articleVM = self.articleListVM.articleAtIndex(indexPath.row)
    
    cell.titleLabel.text = articleVM.title
    cell.descriptionLabel.text = articleVM.description
    return cell
  }
  
}
