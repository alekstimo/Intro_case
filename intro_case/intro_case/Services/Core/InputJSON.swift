//
//  LatestJSON.swift
//  intro_case
//
//  Created by Кирилл Зезюков on 24.03.2023.
//

import Foundation
let inputLatestJSON = """
{
    "latest": [
    {
      "category": "Phones",
      "name": "Samsung S10",
      "price": 1000,
      "image_url": "https://www.dhresource.com/0x0/f2/albu/g8/M01/9D/19/rBVaV1079WeAEW-AAARn9m_Dmh0487.jpg"
    },
    {
      "category": "Games",
      "name": "Sony Playstation 5",
      "price": 700,
      "image_url": "https://avatars.mds.yandex.net/get-mpic/6251774/img_id4273297770790914968.jpeg/orig"
    },
    {
      "category": "Games",
      "name": "Xbox ONE",
      "price": 500,
      "image_url": "https://www.tradeinn.com/f/13754/137546834/microsoft-xbox-xbox-one-s-1tb-console-additional-controller.jpg"
    },
    {
      "category": "Cars",
      "name": "BMW X6M",
      "price": 35000,
      "image_url": "https://mirbmw.ru/wp-content/uploads/2022/01/manhart-mhx6-700-01.jpg"
    }
  ]
}
"""

let inputFlashSaleJSON = """
{
  "flash_sale": [
    {
      "category": "Kids",
      "name": "New Balance Sneakers",
      "price": 22.5,
      "discount": 30,
      "image_url": "https://newbalance.ru/upload/iblock/697/iz997hht_nb_02_i.jpg"
    },
    {
      "category": "Kids",
      "name": "Reebok Classic",
      "price": 24,
      "discount": 30,
      "image_url": "https://assets.reebok.com/images/h_2000,f_auto,q_auto,fl_lossy,c_fill,g_auto/3613ebaf6ed24a609818ac63000250a3_9366/Classic_Leather_Shoes_-_Toddler_White_FZ2093_01_standard.jpg"
    }
  ]
}
"""
let inputDetailJSON = """
{
  "name": "Reebok Classic",
  "description": "Shoes inspired by 80s running shoes are still relevant today",
  "rating": 4.3,
  "number_of_reviews": 4000,
  "price": 24,
  "colors": [
    "#ffffff",
    "#b5b5b5",
    "#000000"
  ],
  "image_urls": [
    "https://assets.reebok.com/images/h_2000,f_auto,q_auto,fl_lossy,c_fill,g_auto/3613ebaf6ed24a609818ac63000250a3_9366/Classic_Leather_Shoes_-_Toddler_White_FZ2093_01_standard.jpg",
    "https://assets.reebok.com/images/h_2000,f_auto,q_auto,fl_lossy,c_fill,g_auto/a94fbe7d8dfb4d3bbaf9ac63000135ed_9366/Classic_Leather_Shoes_-_Toddler_White_FZ2093_03_standard.jpg",
    "https://assets.reebok.com/images/h_2000,f_auto,q_auto,fl_lossy,c_fill,g_auto/1fd1b80693d34f2584b0ac6300034598_9366/Classic_Leather_Shoes_-_Toddler_White_FZ2093_05_standard.jpg"
  ]
}
"""
