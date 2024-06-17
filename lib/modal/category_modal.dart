import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

// home page category
class CategoryList {
  List<String> category = [
    "All",
    "Electronics",
    "Fashion and apparel",
    "Furniture",
    "Food",
    "Beverages",
    "Business-to-business",
    "Consumer-to-consumer",
    "Household essentials",
    "Toys and hobbies",
    "Media",
    "Books",
    "Mobile commerce",
    "Sports products",
    "Baby products",
    "Apparel and Accessories",
    "Jewellery",
    "Stationery",
    "Personalize the shopping experience",
  ];
}

class CategoryViewList {
  List<Map<String, String>> category = [
    {"icon": "assets/category_icons/shopping-bag.png", "category": "Bag"},
    {"icon": "assets/category_icons/shopping-bag.png", "category": "Watch"},
    {"icon": "assets/category_icons/shopping-bag.png", "category": "Shoes"},
    {"icon": "assets/category_icons/shopping-bag.png", "category": "Jewelry"},
    {"icon": "assets/category_icons/shopping-bag.png", "category": "Sports"},
    {"icon": "assets/category_icons/shopping-bag.png", "category": "Music"},
    {"icon": "assets/category_icons/shopping-bag.png", "category": "Gift"},
    {"icon": "assets/category_icons/shopping-bag.png", "category": "Furniture"},
    {"icon": "assets/category_icons/shopping-bag.png", "category": "Cosmetic"},
    {"icon": "assets/category_icons/shopping-bag.png", "category": "Hobby"},
    {"icon": "assets/category_icons/shopping-bag.png", "category": "kids"},

    /*  "Fashion and apparel",
    "Furniture",
    "Food",
    "Beverages",
    "Business-to-business",
    "Consumer-to-consumer",
    "Household essentials",
    "Toys and hobbies",
    "Media",
    "Books",
    "Mobile commerce",
    "Sports products",
    "Baby products",
    "Apparel and Accessories",
    "Jewellery",
    "Stationery",
    "Personalize the shopping experience", */
  ];
}

class ColorList {
  List<Color> colorOptions = [
    Colors.red,
    Colors.green,
    Colors.blue,
    Colors.yellow,
    Colors.purple,
  ];
}
