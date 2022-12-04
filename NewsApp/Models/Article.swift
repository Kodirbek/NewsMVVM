//
//  Article.swift
//  NewsApp
//
//  Created by Abduqodir's MacPro on 2022/10/05.
//

import Foundation


struct ArticleList: Decodable {
  let articles: [Article]
}

struct Article: Decodable {
  let title: String?
  let description: String?
}
