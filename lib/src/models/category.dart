import '../../config/ui_icons.dart';
import './product.dart';
import 'package:flutter/material.dart';

class Category {
  String id = UniqueKey().toString();
  String name;
  bool selected;
  IconData icon;
  List<Product> products;
  List<SubCategory> subCategories;
  Category({this.name, this.icon, this.selected, this.products});

  void fromJson(Map<String, dynamic> res) {
    this.id = res['id'];
    this.name = res['name'];
    if (res['sub_categories'] != null) {
      subCategories = [];
      for (var x in res['sub_categories']) {
        SubCategory subCategory = SubCategory();
        subCategory.fromJson(x);
        subCategories.add(subCategory);
      }
    }
    if (res['products'] != null) {
      products = [];
      for (var x in res['products']) {
        // Product product=Product(name, image, available, price, quantity, sales, rate, discount)
      }
    }
  }
}

class SubCategory {
  String id = UniqueKey().toString();
  String name;
  bool selected;
  List<Product> products;

  SubCategory({this.name, this.selected, this.products});
  void fromJson(Map<String, dynamic> data) {
    this.id = data['id'];
    this.name = data['name'];
  }
}

class CategoriesList {
  List<Category> _list;

  List<Category> get list => _list;

  CategoriesList() {
    this._list = [
      new Category(
          name: 'Man',
          icon: UiIcons.shoe_1,
          selected: true,
          products: [
            new Product('Zogaa FlameSweater', 'img/man1.webp', 80, 42.63, 200,
                2554, 3.1, 10.5),
            new Product('Men Polo Shirt Brand Clothing', 'img/man2.webp', 80,
                42.63, 200, 2554, 3.1, 10.5),
            new Product('Polo Shirt for Men', 'img/man3.webp', 80, 42.63, 200,
                2554, 3.1, 10.5),
            new Product('Men\'s Sport Pants Long Summer', 'img/man4.webp', 80,
                42.63, 200, 2554, 3.1, 10.5),
            new Product('Men\'s Hoodies Pullovers Striped', 'img/man5.webp', 80,
                42.63, 200, 2554, 3.1, 10.5),
            new Product('Men Double Breasted Suit Vests', 'img/man6.webp', 80,
                42.63, 200, 2554, 3.1, 10.5),
            new Product('Puimentiua Summer Fashion', 'img/man7.webp', 80, 42.63,
                200, 2554, 3.1, 10.5),
            new Product('Casual Sweater fashion Jacket', 'img/man8.webp', 80,
                42.63, 200, 2554, 3.1, 10.5),
          ]),
      new Category(
          name: 'Women',
          icon: UiIcons.shoe,
          selected: false,
          products: [
            new Product('Summer Fashion Women Dress', 'img/pro5.webp', 25,
                19.64, 200, 130, 4.3, 12.1),
            new Product('Women Half Sleeve', 'img/pro6.webp', 60, 94.36, 200,
                42, 5.0, 20.2),
            new Product('Elegant Plaid Dresses Women Fashion', 'img/pro7.webp',
                10, 15.73, 200, 415, 4.9, 15.3),
            new Product('Maxi Dress For Women Summer', 'img/pro1.webp', 25,
                19.64, 200, 130, 4.3, 12.1),
            new Product('Black Checked Retro Hepburn Style', 'img/pro2.webp',
                60, 94.36, 200, 63, 5.0, 20.2),
            new Product('Robe pin up Vintage Dress Autumn', 'img/pro3.webp', 10,
                15.73, 200, 415, 4.9, 15.3),
            new Product('Elegant Casual Dress', 'img/pro4.webp', 80, 42.63, 200,
                2554, 3.1, 10.5),
          ]),
      new Category(
          name: 'Child',
          icon: UiIcons.baby_changing,
          selected: false,
          products: [
            new Product('Fashion Baby Sequins Party Dance Ballet',
                'img/baby1.webp', 80, 42.63, 200, 2554, 3.1, 10.5),
            new Product('Children Martin Boots PU Leather', 'img/baby2.webp',
                80, 42.63, 200, 2554, 3.1, 10.5),
            new Product('Baby Boys Denim Jacket', 'img/baby3.webp', 80, 42.63,
                200, 2554, 3.1, 10.5),
            new Product('Mom and Daughter Matching Women', 'img/baby4.webp', 80,
                42.63, 200, 2554, 3.1, 10.5),
            new Product('Unicorn Pajamas Winter Flannel Family',
                'img/baby5.webp', 80, 42.63, 200, 2554, 3.1, 10.5),
            new Product('Party Decorations Kids', 'img/baby6.webp', 80, 42.63,
                200, 2554, 3.1, 10.5),
          ]),
      new Category(
          name: 'Car',
          icon: UiIcons.car_1,
          selected: false,
          products: [
            new Product('Yosoo Knee pad Elastic', 'img/sport4.webp', 80, 42.63,
                200, 2554, 3.1, 10.5),
            new Product('Spring Hand Grip Finger Strength', 'img/sport5.webp',
                80, 42.63, 200, 2554, 3.1, 10.5),
            new Product('Knee Sleeves', 'img/sport6.webp', 80, 42.63, 200, 2554,
                3.1, 10.5),
            new Product('Brothock Professional basketball socks',
                'img/sport7.webp', 80, 42.63, 200, 2554, 3.1, 10.5),
            new Product('New men s running trousers', 'img/sport8.webp', 80,
                42.63, 200, 2554, 3.1, 10.5),
            new Product('Cotton Elastic Hand Arthritis', 'img/sport9.webp', 80,
                42.63, 200, 2554, 3.1, 10.5),
            new Product('Spring Half Finger Outdoor Sports', 'img/sport10.webp',
                80, 42.63, 200, 2554, 3.1, 10.5),
          ]),
      new Category(
          name: 'Fourniture',
          icon: UiIcons.living_room,
          selected: false,
          products: [
            new Product('Cooking Tools Set Premium', 'img/home1.webp', 80,
                42.63, 200, 2554, 3.1, 10.5),
            new Product('Reusable Metal Drinking Straws', 'img/home2.webp', 80,
                42.63, 200, 2554, 3.1, 10.5),
            new Product('Absorbent Towel Face', 'img/home3.webp', 80, 42.63,
                200, 2554, 3.1, 10.5),
            new Product('Pair Heat Resistant Thick Silicone', 'img/home4.webp',
                80, 42.63, 200, 2554, 3.1, 10.5),
            new Product('Electric Mosquito Killer Lamp', 'img/home5.webp', 80,
                42.63, 200, 2554, 3.1, 10.5),
            new Product('Terrarium Hydroponic Plant Vases', 'img/home6.webp',
                80, 42.63, 200, 2554, 3.1, 10.5),
            new Product('Steel Cutlery Set Gold Cutlery', 'img/home7.webp', 80,
                42.63, 200, 2554, 3.1, 10.5),
            new Product('Silicone Kitchen Organizer Insulated ',
                'img/home8.webp', 80, 42.63, 200, 2554, 3.1, 10.5),
            new Product('Non Stick Wooden Handle Silicone ', 'img/home9.webp',
                80, 42.63, 200, 2554, 3.1, 10.5),
            new Product('Foldable Silicone Colander Fruit Vegetable',
                'img/home10.webp', 80, 42.63, 200, 2554, 3.1, 10.5),
            new Product('Adjustable Sprinkler Plastic Water Sprayer ',
                'img/home11.webp', 80, 42.63, 200, 2554, 3.1, 10.5),
          ]),
      new Category(
          name: 'Watch',
          icon: UiIcons.watch,
          selected: false,
          products: [
            new Product('Men Wrist Watch Stainless', 'img/watch1.webp', 80,
                42.63, 200, 2554, 3.1, 10.5),
            new Product('Reef Tiger RT Mens Sport Watches', 'img/watch2.webp',
                80, 42.63, 200, 2554, 3.1, 10.5),
            new Product('Sport watch Waterproof', 'img/watch3.webp', 80, 42.63,
                200, 2554, 3.1, 10.5),
            new Product('Sport Watch Black Military', 'img/watch4.webp', 80,
                42.63, 200, 2554, 3.1, 10.5),
            new Product('Digital Waterproof Wrist Watch', 'img/watch5.webp', 80,
                42.63, 200, 2554, 3.1, 10.5),
            new Product('Digital Display Bracelet Watch', 'img/watch6.webp', 80,
                42.63, 200, 2554, 3.1, 10.5),
            new Product('Men Sports Watch Silicone Watchband',
                'img/watch7.webp', 80, 42.63, 200, 2554, 3.1, 10.5),
            new Product('Fashion Waterproof Men Digital Watches',
                'img/watch8.webp', 80, 42.63, 200, 2554, 3.1, 10.5),
            new Product('Alarm Waterproof Sports Army', 'img/watch9.webp', 80,
                42.63, 200, 2554, 3.1, 10.5),
          ]),
      new Category(
          name: 'Media',
          icon: UiIcons.home_cinema,
          selected: false,
          products: [
            new Product('Electric Mosquito Killer Lamp', 'img/home5.webp', 80,
                42.63, 200, 2554, 3.1, 10.5),
            new Product('Terrarium Hydroponic Plant Vases', 'img/home6.webp',
                80, 42.63, 200, 2554, 3.1, 10.5),
            new Product('Steel Cutlery Set Gold Cutlery', 'img/home7.webp', 80,
                42.63, 200, 2554, 3.1, 10.5),
            new Product('Silicone Kitchen Organizer Insulated ',
                'img/home8.webp', 80, 42.63, 200, 2554, 3.1, 10.5),
            new Product('Non Stick Wooden Handle Silicone ', 'img/home9.webp',
                80, 42.63, 200, 2554, 3.1, 10.5),
            new Product('Foldable Silicone Colander Fruit Vegetable',
                'img/home10.webp', 80, 42.63, 200, 2554, 3.1, 10.5),
            new Product('Adjustable Sprinkler Plastic Water Sprayer ',
                'img/home11.webp', 80, 42.63, 200, 2554, 3.1, 10.5),
          ]),
      new Category(
          name: 'Sport',
          icon: UiIcons.sport,
          selected: false,
          products: [
            new Product('Back Shoulder Posture Correction', 'img/sport1.webp',
                80, 42.63, 200, 2554, 3.1, 10.5),
            new Product('Ankle Support Brace Elasticity', 'img/sport2.webp', 80,
                42.63, 200, 2554, 3.1, 10.5),
            new Product('Men Women Swimming Goggles', 'img/sport3.webp', 80,
                42.63, 200, 2554, 3.1, 10.5),
            new Product('Yosoo Knee pad Elastic', 'img/sport4.webp', 80, 42.63,
                200, 2554, 3.1, 10.5),
            new Product('Spring Hand Grip Finger Strength', 'img/sport5.webp',
                80, 42.63, 200, 2554, 3.1, 10.5),
            new Product('Knee Sleeves', 'img/sport6.webp', 80, 42.63, 200, 2554,
                3.1, 10.5),
            new Product('Brothock Professional basketball socks',
                'img/sport7.webp', 80, 42.63, 200, 2554, 3.1, 10.5),
            new Product('New men s running trousers', 'img/sport8.webp', 80,
                42.63, 200, 2554, 3.1, 10.5),
            new Product('Cotton Elastic Hand Arthritis', 'img/sport9.webp', 80,
                42.63, 200, 2554, 3.1, 10.5),
            new Product('Spring Half Finger Outdoor Sports', 'img/sport10.webp',
                80, 42.63, 200, 2554, 3.1, 10.5),
          ]),
      new Category(
          name: 'Travel',
          icon: UiIcons.tent,
          selected: false,
          products: [
            new Product('Cooking Tools Set Premium', 'img/home1.webp', 80,
                42.63, 200, 2554, 3.1, 10.5),
            new Product('Reusable Metal Drinking Straws', 'img/home2.webp', 80,
                42.63, 200, 2554, 3.1, 10.5),
            new Product('Absorbent Towel Face', 'img/home3.webp', 80, 42.63,
                200, 2554, 3.1, 10.5),
            new Product('Pair Heat Resistant Thick Silicone', 'img/home4.webp',
                80, 42.63, 200, 2554, 3.1, 10.5),
            new Product('Electric Mosquito Killer Lamp', 'img/home5.webp', 80,
                42.63, 200, 2554, 3.1, 10.5),
            new Product('Terrarium Hydroponic Plant Vases', 'img/home6.webp',
                80, 42.63, 200, 2554, 3.1, 10.5),
            new Product('Steel Cutlery Set Gold Cutlery', 'img/home7.webp', 80,
                42.63, 200, 2554, 3.1, 10.5),
            new Product('Silicone Kitchen Organizer Insulated ',
                'img/home8.webp', 80, 42.63, 200, 2554, 3.1, 10.5),
            new Product('Non Stick Wooden Handle Silicone ', 'img/home9.webp',
                80, 42.63, 200, 2554, 3.1, 10.5),
            new Product('Foldable Silicone Colander Fruit Vegetable',
                'img/home10.webp', 80, 42.63, 200, 2554, 3.1, 10.5),
            new Product('Adjustable Sprinkler Plastic Water Sprayer ',
                'img/home11.webp', 80, 42.63, 200, 2554, 3.1, 10.5),
          ]),
      new Category(
          name: 'Tool',
          icon: UiIcons.tool,
          selected: false,
          products: [
            new Product('Men Wrist Watch Stainless', 'img/watch1.webp', 80,
                42.63, 200, 2554, 3.1, 10.5),
            new Product('Reef Tiger RT Mens Sport Watches', 'img/watch2.webp',
                80, 42.63, 200, 2554, 3.1, 10.5),
            new Product('Sport watch Waterproof', 'img/watch3.webp', 80, 42.63,
                200, 2554, 3.1, 10.5),
            new Product('Sport Watch Black Military', 'img/watch4.webp', 80,
                42.63, 200, 2554, 3.1, 10.5),
            new Product('Digital Waterproof Wrist Watch', 'img/watch5.webp', 80,
                42.63, 200, 2554, 3.1, 10.5),
            new Product('Digital Display Bracelet Watch', 'img/watch6.webp', 80,
                42.63, 200, 2554, 3.1, 10.5),
            new Product('Men Sports Watch Silicone Watchband',
                'img/watch7.webp', 80, 42.63, 200, 2554, 3.1, 10.5),
            new Product('Fashion Waterproof Men Digital Watches',
                'img/watch8.webp', 80, 42.63, 200, 2554, 3.1, 10.5),
            new Product('Alarm Waterproof Sports Army', 'img/watch9.webp', 80,
                42.63, 200, 2554, 3.1, 10.5),
          ]),
      new Category(
          name: 'Game',
          icon: UiIcons.game,
          selected: false,
          products: [
            new Product('Back Shoulder Posture Correction', 'img/sport1.webp',
                80, 42.63, 200, 2554, 3.1, 10.5),
            new Product('Ankle Support Brace Elasticity', 'img/sport2.webp', 80,
                42.63, 200, 2554, 3.1, 10.5),
            new Product('Men Women Swimming Goggles', 'img/sport3.webp', 80,
                42.63, 200, 2554, 3.1, 10.5),
            new Product('Yosoo Knee pad Elastic', 'img/sport4.webp', 80, 42.63,
                200, 2554, 3.1, 10.5),
            new Product('Spring Hand Grip Finger Strength', 'img/sport5.webp',
                80, 42.63, 200, 2554, 3.1, 10.5),
            new Product('Knee Sleeves', 'img/sport6.webp', 80, 42.63, 200, 2554,
                3.1, 10.5),
            new Product('Brothock Professional basketball socks',
                'img/sport7.webp', 80, 42.63, 200, 2554, 3.1, 10.5),
            new Product('New men s running trousers', 'img/sport8.webp', 80,
                42.63, 200, 2554, 3.1, 10.5),
            new Product('Cotton Elastic Hand Arthritis', 'img/sport9.webp', 80,
                42.63, 200, 2554, 3.1, 10.5),
            new Product('Spring Half Finger Outdoor Sports', 'img/sport10.webp',
                80, 42.63, 200, 2554, 3.1, 10.5),
          ]),
      new Category(
          name: 'Home',
          icon: UiIcons.vacuum,
          selected: false,
          products: [
            new Product('Cooking Tools Set Premium', 'img/home1.webp', 80,
                42.63, 200, 2554, 3.1, 10.5),
            new Product('Reusable Metal Drinking Straws', 'img/home2.webp', 80,
                42.63, 200, 2554, 3.1, 10.5),
            new Product('Absorbent Towel Face', 'img/home3.webp', 80, 42.63,
                200, 2554, 3.1, 10.5),
            new Product('Pair Heat Resistant Thick Silicone', 'img/home4.webp',
                80, 42.63, 200, 2554, 3.1, 10.5),
            new Product('Electric Mosquito Killer Lamp', 'img/home5.webp', 80,
                42.63, 200, 2554, 3.1, 10.5),
            new Product('Terrarium Hydroponic Plant Vases', 'img/home6.webp',
                80, 42.63, 200, 2554, 3.1, 10.5),
            new Product('Steel Cutlery Set Gold Cutlery', 'img/home7.webp', 80,
                42.63, 200, 2554, 3.1, 10.5),
            new Product('Silicone Kitchen Organizer Insulated ',
                'img/home8.webp', 80, 42.63, 200, 2554, 3.1, 10.5),
            new Product('Non Stick Wooden Handle Silicone ', 'img/home9.webp',
                80, 42.63, 200, 2554, 3.1, 10.5),
            new Product('Foldable Silicone Colander Fruit Vegetable',
                'img/home10.webp', 80, 42.63, 200, 2554, 3.1, 10.5),
            new Product('Adjustable Sprinkler Plastic Water Sprayer ',
                'img/home11.webp', 80, 42.63, 200, 2554, 3.1, 10.5),
          ]),
    ];
  }

  selectById(String id) {
    this._list.forEach((Category category) {
      category.selected = false;
      if (category.id == id) {
        category.selected = true;
      }
    });
  }

  void clearSelection() {
    _list.forEach((category) {
      category.selected = false;
    });
  }
}

class SubCategoriesList {
  List<SubCategory> _list;

  List<SubCategory> get list => _list;

  SubCategoriesList() {
    this._list = [
      new SubCategory(name: 'Sh', selected: true, products: [
        new Product('Zogaa FlameSweater', 'img/man1.webp', 80, 42.63, 200, 2554,
            3.1, 10.5),
        new Product('Men Polo Shirt Brand Clothing', 'img/man2.webp', 80, 42.63,
            200, 2554, 3.1, 10.5),
        new Product('Polo Shirt for Men', 'img/man3.webp', 80, 42.63, 200, 2554,
            3.1, 10.5),
        new Product('Men\'s Sport Pants Long Summer', 'img/man4.webp', 80,
            42.63, 200, 2554, 3.1, 10.5),
        new Product('Men\'s Hoodies Pullovers Striped', 'img/man5.webp', 80,
            42.63, 200, 2554, 3.1, 10.5),
        new Product('Men Double Breasted Suit Vests', 'img/man6.webp', 80,
            42.63, 200, 2554, 3.1, 10.5),
        new Product('Puimentiua Summer Fashion', 'img/man7.webp', 80, 42.63,
            200, 2554, 3.1, 10.5),
        new Product('Casual Sweater fashion Jacket', 'img/man8.webp', 80, 42.63,
            200, 2554, 3.1, 10.5),
      ]),
      new SubCategory(name: 'Sweater', selected: false, products: [
        new Product('Summer Fashion Women Dress', 'img/pro5.webp', 25, 19.64,
            200, 130, 4.3, 12.1),
        new Product('Women Half Sleeve', 'img/pro6.webp', 60, 94.36, 200, 42,
            5.0, 20.2),
        new Product('Elegant Plaid Dresses Women Fashion', 'img/pro7.webp', 10,
            15.73, 200, 415, 4.9, 15.3),
        new Product('Maxi Dress For Women Summer', 'img/pro1.webp', 25, 19.64,
            200, 130, 4.3, 12.1),
        new Product('Black Checked Retro Hepburn Style', 'img/pro2.webp', 60,
            94.36, 200, 63, 5.0, 20.2),
        new Product('Robe pin up Vintage Dress Autumn', 'img/pro3.webp', 10,
            15.73, 200, 415, 4.9, 15.3),
        new Product('Elegant Casual Dress', 'img/pro4.webp', 80, 42.63, 200,
            2554, 3.1, 10.5),
      ]),
      new SubCategory(name: 'Jacket', selected: false, products: [
        new Product('Fashion Baby Sequins Party Dance Ballet', 'img/baby1.webp',
            80, 42.63, 200, 2554, 3.1, 10.5),
        new Product('Children Martin Boots PU Leather', 'img/baby2.webp', 80,
            42.63, 200, 2554, 3.1, 10.5),
        new Product('Baby Boys Denim Jacket', 'img/baby3.webp', 80, 42.63, 200,
            2554, 3.1, 10.5),
        new Product('Mom and Daughter Matching Women', 'img/baby4.webp', 80,
            42.63, 200, 2554, 3.1, 10.5),
        new Product('Unicorn Pajamas Winter Flannel Family', 'img/baby5.webp',
            80, 42.63, 200, 2554, 3.1, 10.5),
        new Product('Party Decorations Kids', 'img/baby6.webp', 80, 42.63, 200,
            2554, 3.1, 10.5),
      ]),
      new SubCategory(name: 'Socks', selected: false, products: [
        new Product('Yosoo Knee pad Elastic', 'img/sport4.webp', 80, 42.63, 200,
            2554, 3.1, 10.5),
        new Product('Spring Hand Grip Finger Strength', 'img/sport5.webp', 80,
            42.63, 200, 2554, 3.1, 10.5),
        new Product(
            'Knee Sleeves', 'img/sport6.webp', 80, 42.63, 200, 2554, 3.1, 10.5),
        new Product('Brothock Professional basketball socks', 'img/sport7.webp',
            80, 42.63, 200, 2554, 3.1, 10.5),
        new Product('New men s running trousers', 'img/sport8.webp', 80, 42.63,
            200, 2554, 3.1, 10.5),
        new Product('Cotton Elastic Hand Arthritis', 'img/sport9.webp', 80,
            42.63, 200, 2554, 3.1, 10.5),
        new Product('Spring Half Finger Outdoor Sports', 'img/sport10.webp', 80,
            42.63, 200, 2554, 3.1, 10.5),
      ]),
      new SubCategory(name: 'Trousers', selected: false, products: [
        new Product('Cooking Tools Set Premium', 'img/home1.webp', 80, 42.63,
            200, 2554, 3.1, 10.5),
        new Product('Reusable Metal Drinking Straws', 'img/home2.webp', 80,
            42.63, 200, 2554, 3.1, 10.5),
        new Product('Absorbent Towel Face', 'img/home3.webp', 80, 42.63, 200,
            2554, 3.1, 10.5),
        new Product('Pair Heat Resistant Thick Silicone', 'img/home4.webp', 80,
            42.63, 200, 2554, 3.1, 10.5),
        new Product('Electric Mosquito Killer Lamp', 'img/home5.webp', 80,
            42.63, 200, 2554, 3.1, 10.5),
        new Product('Terrarium Hydroponic Plant Vases', 'img/home6.webp', 80,
            42.63, 200, 2554, 3.1, 10.5),
        new Product('Adjustable Sprinkler Plastic Water Sprayer ',
            'img/home11.webp', 80, 42.63, 200, 2554, 3.1, 10.5),
      ]),
      new SubCategory(name: 'Shirt', selected: true, products: [
        new Product('Zogaa FlameSweater', 'img/man1.webp', 80, 42.63, 200, 2554,
            3.1, 10.5),
        new Product('Men Polo Shirt Brand Clothing', 'img/man2.webp', 80, 42.63,
            200, 2554, 3.1, 10.5),
        new Product('Polo Shirt for Men', 'img/man3.webp', 80, 42.63, 200, 2554,
            3.1, 10.5),
        new Product('Men\'s Sport Pants Long Summer', 'img/man4.webp', 80,
            42.63, 200, 2554, 3.1, 10.5),
        new Product('Men\'s Hoodies Pullovers Striped', 'img/man5.webp', 80,
            42.63, 200, 2554, 3.1, 10.5),
        new Product('Men Double Breasted Suit Vests', 'img/man6.webp', 80,
            42.63, 200, 2554, 3.1, 10.5),
        new Product('Puimentiua Summer Fashion', 'img/man7.webp', 80, 42.63,
            200, 2554, 3.1, 10.5),
        new Product('Casual Sweater fashion Jacket', 'img/man8.webp', 80, 42.63,
            200, 2554, 3.1, 10.5),
      ]),
      new SubCategory(name: 'Sweater', selected: false, products: [
        new Product('Summer Fashion Women Dress', 'img/pro5.webp', 25, 19.64,
            200, 130, 4.3, 12.1),
        new Product('Women Half Sleeve', 'img/pro6.webp', 60, 94.36, 200, 42,
            5.0, 20.2),
        new Product('Elegant Plaid Dresses Women Fashion', 'img/pro7.webp', 10,
            15.73, 200, 415, 4.9, 15.3),
        new Product('Maxi Dress For Women Summer', 'img/pro1.webp', 25, 19.64,
            200, 130, 4.3, 12.1),
        new Product('Black Checked Retro Hepburn Style', 'img/pro2.webp', 60,
            94.36, 200, 63, 5.0, 20.2),
        new Product('Robe pin up Vintage Dress Autumn', 'img/pro3.webp', 10,
            15.73, 200, 415, 4.9, 15.3),
        new Product('Elegant Casual Dress', 'img/pro4.webp', 80, 42.63, 200,
            2554, 3.1, 10.5),
      ]),
      new SubCategory(name: 'Jacket', selected: false, products: [
        new Product('Fashion Baby Sequins Party Dance Ballet', 'img/baby1.webp',
            80, 42.63, 200, 2554, 3.1, 10.5),
        new Product('Children Martin Boots PU Leather', 'img/baby2.webp', 80,
            42.63, 200, 2554, 3.1, 10.5),
        new Product('Baby Boys Denim Jacket', 'img/baby3.webp', 80, 42.63, 200,
            2554, 3.1, 10.5),
        new Product('Mom and Daughter Matching Women', 'img/baby4.webp', 80,
            42.63, 200, 2554, 3.1, 10.5),
        new Product('Unicorn Pajamas Winter Flannel Family', 'img/baby5.webp',
            80, 42.63, 200, 2554, 3.1, 10.5),
        new Product('Party Decorations Kids', 'img/baby6.webp', 80, 42.63, 200,
            2554, 3.1, 10.5),
      ]),
      new SubCategory(name: 'Socks', selected: false, products: [
        new Product('Yosoo Knee pad Elastic', 'img/sport4.webp', 80, 42.63, 200,
            2554, 3.1, 10.5),
        new Product('Spring Hand Grip Finger Strength', 'img/sport5.webp', 80,
            42.63, 200, 2554, 3.1, 10.5),
        new Product(
            'Knee Sleeves', 'img/sport6.webp', 80, 42.63, 200, 2554, 3.1, 10.5),
        new Product('Brothock Professional basketball socks', 'img/sport7.webp',
            80, 42.63, 200, 2554, 3.1, 10.5),
        new Product('New men s running trousers', 'img/sport8.webp', 80, 42.63,
            200, 2554, 3.1, 10.5),
        new Product('Cotton Elastic Hand Arthritis', 'img/sport9.webp', 80,
            42.63, 200, 2554, 3.1, 10.5),
        new Product('Spring Half Finger Outdoor Sports', 'img/sport10.webp', 80,
            42.63, 200, 2554, 3.1, 10.5),
      ]),
      new SubCategory(name: 'Trousers', selected: false, products: [
        new Product('Cooking Tools Set Premium', 'img/home1.webp', 80, 42.63,
            200, 2554, 3.1, 10.5),
        new Product('Reusable Metal Drinking Straws', 'img/home2.webp', 80,
            42.63, 200, 2554, 3.1, 10.5),
        new Product('Absorbent Towel Face', 'img/home3.webp', 80, 42.63, 200,
            2554, 3.1, 10.5),
        new Product('Pair Heat Resistant Thick Silicone', 'img/home4.webp', 80,
            42.63, 200, 2554, 3.1, 10.5),
        new Product('Electric Mosquito Killer Lamp', 'img/home5.webp', 80,
            42.63, 200, 2554, 3.1, 10.5),
        new Product('Terrarium Hydroponic Plant Vases', 'img/home6.webp', 80,
            42.63, 200, 2554, 3.1, 10.5),
        new Product('Adjustable Sprinkler Plastic Water Sprayer ',
            'img/home11.webp', 80, 42.63, 200, 2554, 3.1, 10.5),
      ]),
    ];
  }

  selectById(String id) {
    this._list.forEach((SubCategory subCategory) {
      subCategory.selected = false;
      if (subCategory.id == id) {
        subCategory.selected = true;
      }
    });
  }

  void clearSelection() {
    _list.forEach((category) {
      category.selected = false;
    });
  }
}
