import 'package:collection/collection.dart';
import 'package:flutter/widgets.dart';
import 'package:food_delivery_app/cartitem.dart';
import 'package:food_delivery_app/foods.dart';
import 'package:intl/intl.dart';

class Restaurant extends ChangeNotifier{
  final List<Food> _menu=[
    //burger
    Food(
        name: "Cheese Burger",
        description: "A cheesy burger loaded with chess and a crispy patty",
        imagePath: "assets/Burger/Burger_1.jpg",
        price: 1.99,
        category: FoodCategory.burgers,
        addons: [
          Addons(name: "Extra Cheese", price: 0.30),
          Addons(name: "Extra Sauce", price: 0.10),
          Addons(name: "BBQ Sauce",price:20),
        ]
    ),
    Food(
        name: "HamBurger",
        description: "A classic burger with a crispy patty and lots of veggies",
        imagePath: "assets/Burger/Burger_2.jpg",
        price: 2.20,
        category: FoodCategory.burgers,
        addons: [
          Addons(name: "Extra Cheese", price: 0.30),
          Addons(name: "Extra Sauce", price: 0.10),
          Addons(name: "BBQ Sauce",price:20),
        ]
    ),
    Food(
        name: "Classic Burger",
        description: "A classic burger with extra crispy patty and onion",
        imagePath: "assets/Burger/Burger_3.jpg",
        price: 2.10,
        category: FoodCategory.burgers,
        addons: [
          Addons(name: "Extra Cheese", price: 0.30),
          Addons(name: "Extra Sauce", price: 0.10),
          Addons(name: "BBQ Sauce",price:20),
        ]
    ),
    Food(
        name: "Double CheeseBurger",
        description: "A extra cheesy burger loaded with chess and double crispy patty",
        imagePath: "assets/Burger/Burger_4.jpg",
        price: 2.50,
        category: FoodCategory.burgers,
        addons: [
          Addons(name: "Extra Cheese", price: 0.30),
          Addons(name: "Extra Sauce", price: 0.10),
          Addons(name: "BBQ Sauce",price:20),
        ]
    ),
    Food(
        name: "Chicken Burger",
        description: "A cheesy burger loaded with chess and a crispy and full of chicken patty",
        imagePath: "assets/Burger/Burger_5.jpg",
        price: 2.50,
        category: FoodCategory.burgers,
        addons: [
          Addons(name: "Extra Cheese", price: 0.30),
          Addons(name: "Extra Sauce", price: 0.10),
          Addons(name: "BBQ Sauce",price:20),
        ]
    ),
    //drinks
    Food(
        name: "Coke",
        description: "A classical coke with extra fizz",
        imagePath: "assets/Drinks/Drinks_5.jpg",
        price: 0.80,
        category: FoodCategory.drinks,
        addons: [
          Addons(name: "Chips", price: 0.20)
        ]
    ),
    Food(
        name: "Beer",
        description: "A non alcoholic beer with great taste",
        imagePath: "assets/Drinks/Drinks_3.jpg",
        price: 1.10,
        category: FoodCategory.drinks,
        addons: [
          Addons(name: "Chips", price: 0.20)
        ]
    ),
    Food(
        name: "Cocktail",
        description: "A classical cocktail with rich flavours",
        imagePath: "assets/Drinks/Drinks_1.jpg",
        price: 1.30,
        category: FoodCategory.drinks,
        addons: [
          Addons(name: "Chips", price: 0.20)
        ]
    ),
    Food(
        name: "Mocktail",
        description: "A classical non alcoholic cocktail with rich flavour",
        imagePath: "assets/Drinks/Drinks_4.jpg",
        price: 1.15,
        category: FoodCategory.drinks,
        addons: [
          Addons(name: "Chips", price: 0.20)
        ]
    ),
    Food(
        name: "Fruit juice",
        description: "A extra healthy drinks for everyone",
        imagePath: "assets/Drinks/Drinks_2.jpg",
        price: 1.00,
        category: FoodCategory.drinks,
        addons: [
          Addons(name: "Chips", price: 0.20)
        ]
    ),
    //Desserts
    Food(
        name: "Donuts",
        description: "A classic donuts with rich taste for sweet lovers",
        imagePath: "assets/Desserts/Desserts_1.jpg",
        price: 1.30,
        category: FoodCategory.desserts,
        addons: [
          Addons(name: "Chocolate Dip", price: 0.40)
        ]
    ),
    Food(
        name: "Pudding",
        description: "A classic pudding with rich taste for sweet lovers",
        imagePath: "assets/Desserts/Desserts_2.jpg",
        price: 1.10,
        category: FoodCategory.desserts,
        addons: [
          Addons(name: "Chocolate Dip", price: 0.40)
        ]
    ),
    Food(
        name: "Pastry",
        description: "A classic pastry with rich taste for sweet lovers",
        imagePath: "assets/Desserts/Desserts_3.jpg",
        price: 1.35,
        category: FoodCategory.desserts,
        addons: [
          Addons(name: "Chocolate Dip", price: 0.40)
        ]
    ),
    Food(
        name: "Cake",
        description: "A classic cake with rich taste for sweet lovers",
        imagePath: "assets/Desserts/Desserts_4.jpg",
        price: 1.45,
        category: FoodCategory.desserts,
        addons: [
          Addons(name: "Chocolate Dip", price: 0.40)
        ]
    ),
    Food(
        name: "Sweets",
        description: "A classic sweets with rick taste for sweet lovers",
        imagePath: "assets/Desserts/Desserts_5.jpg",
        price: 1.00,
        category: FoodCategory.desserts,
        addons: [
          Addons(name: "Chocolate Dip", price: 0.40)
        ]
    ),
    //sides
    Food(
        name: "Sweet Potato",
        description: "A sweet potato with blend of flavours and great taste",
        imagePath: "assets/Sides/Sides_1.jpg",
        price: 1.70,
        category: FoodCategory.sides,
        addons: [
          Addons(name: "Extra Cheese", price: 0.30),
          Addons(name: "Extra Sauce", price: 0.10)
        ]
    ),
    Food(
        name: "Crispy Potato",
        description: "A crispy potato with blend of flavours and great taste",
        imagePath: "assets/Sides/Sides_2.jpg",
        price: 1.80,
        category: FoodCategory.sides,
        addons: [
          Addons(name: "Extra Cheese", price: 0.30),
          Addons(name: "Extra Sauce", price: 0.10)
        ]
    ),
    Food(
        name: "French Fries",
        description: "A classic french fries with blend of flavours and great taste",
        imagePath: "assets/Sides/Sides_3.jpg",
        price: 1.75,
        category: FoodCategory.sides,
        addons: [
          Addons(name: "Extra Cheese", price: 0.30),
          Addons(name: "Extra Sauce", price: 0.10)
        ]
    ),
    Food(
        name: "Chinese Taste",
        description: "A chinese taste with blend of flavours and great taste",
        imagePath: "assets/Sides/Sides_4.jpg",
        price: 1.90,
        category: FoodCategory.sides,
        addons: [
          Addons(name: "Extra Cheese", price: 0.30),
          Addons(name: "Extra Sauce", price: 0.10)
        ]
    ),
    Food(
        name: "Crispy Corn",
        description: "A Crispy corn with blend of flavours and great taste",
        imagePath: "assets/Sides/Sides_5.jpg",
        price: 2.00,
        category: FoodCategory.sides,
        addons: [
          Addons(name: "Extra Cheese", price: 0.30),
          Addons(name: "Extra Sauce", price: 0.10)
        ]
    ),
    //salads
    Food(
        name: "Green Salads",
        description: "A green salads with blend of flavours, healthy and great taste",
        imagePath: "assets/Salads/Salad_1.jpg",
        price: 1.30,
        category: FoodCategory.salads,
        addons: [
          Addons(name: "Extra Cheese", price: 0.30),
          Addons(name: "Extra toppings", price: 0.45)
        ]
    ),
    Food(
        name: "Blend Salads",
        description: "A blend salads with blend of flavours, healthy and great taste",
        imagePath: "assets/Salads/Salad_2.jpg",
        price: 1.35,
        category: FoodCategory.salads,
        addons: [
          Addons(name: "Extra Cheese", price: 0.30),
          Addons(name: "Extra toppings", price: 0.45)
        ]
    ),
    Food(
        name: "Classic salads",
        description: "A classic salads with blend of flavours and great taste",
        imagePath: "assets/Salads/Salad_3.jpg",
        price: 1.40,
        category: FoodCategory.salads,
        addons: [
          Addons(name: "Extra Cheese", price: 0.30),
          Addons(name: "Extra toppings", price: 0.45)
        ]
    ),
    Food(
        name: "Breakfast Salads",
        description: "A breakfast salads with blend of flavours, healthy and great taste",
        imagePath: "assets/Salads/Salad_4.jpg",
        price: 1.45,
        category: FoodCategory.salads,
        addons: [
          Addons(name: "Extra Cheese", price: 0.30),
          Addons(name: "Extra toppings", price: 0.45)
        ]
    ),
    Food(
        name: "English Breakfast",
        description: "A english breakfast with blend of flavours, healthy and great taste",
        imagePath: "assets/Salads/Salad_5.jpg",
        price: 1.50,
        category: FoodCategory.salads,
        addons: [
          Addons(name: "Extra Cheese", price: 0.30),
          Addons(name: "Extra toppings", price: 0.45)
        ]
    ),
  ];
  String deliveryAddress="";
  void saveDeliveryAddress(String newAddress){
    deliveryAddress=newAddress;
    notifyListeners();
  }
  List<Food> get menu => _menu;
  List<CartItem> get cart=>_cartItem;
  final List<CartItem> _cartItem=[];
  void addToCart(Food food,List<Addons> selectedAddons){
    CartItem? cartItem=_cartItem.firstWhereOrNull((item){
      bool isSameFood=item.food==food;
      bool isSameAddons=ListEquality().equals(item.selectedAddons,selectedAddons);
      return isSameAddons&&isSameFood;
    });
    if(cartItem!=null){
      cartItem.quantity++;
    }
    else{
      _cartItem.add(CartItem(
          food: food,
          selectedAddons: selectedAddons
      ));
    }
    notifyListeners();
  }
  void removeFromCart(CartItem cartItem){
    int cartIndex=_cartItem.indexOf(cartItem);
    if(cartIndex!=-1){
      if(_cartItem[cartIndex].quantity>1){
        _cartItem[cartIndex].quantity--;
      }else{
        _cartItem.removeAt(cartIndex);
      }
    }
    notifyListeners();
  }
  double getTotalPrice(){
    double totalPrice=0.0;
    for(CartItem item in _cartItem){
      double itemTotal=item.food.price;
      for(Addons addons in item.selectedAddons){
        itemTotal+=addons.price;
      }
      totalPrice=(totalPrice+itemTotal)*item.quantity;
    }
    return totalPrice;
  }
  int getTotalItem(){
    int totalCount=0;
    for(CartItem item in _cartItem){
      totalCount++;
    }
    return totalCount;
  }
  void clearCart(){
    _cartItem.clear();
    notifyListeners();
  }
  String displayCartReceipt(){
    final receipt=StringBuffer();
    receipt.writeln("Here's your receipt:");
    receipt.writeln();
    String formatDate=DateFormat("yyyy-MM-dd HH:mm:ss").format(DateTime.now());
    receipt.writeln(formatDate);
    receipt.writeln();
    for(final cart in _cartItem){
      receipt.writeln("${cart.quantity} x ${cart.food.name} - ${_formatPrice(cart.food.price)}");
      if(cart.selectedAddons.isNotEmpty){
        receipt.writeln("Addons: ${_formatAddons(cart.selectedAddons)}");
      }
      receipt.writeln();
    }
    receipt.writeln();
    receipt.writeln("Total Item:${getTotalItem()}");
    receipt.writeln();
    receipt.writeln("Total Price:${_formatPrice(getTotalPrice())}");
    receipt.writeln();
    receipt.writeln("Delivery to $deliveryAddress");
    receipt.writeln();
    return receipt.toString();
  }
  String _formatPrice(double price){
    return "\$${price.toStringAsFixed(2)}";
  }
  String _formatAddons(List<Addons> addons){
    return addons.map((addons)=>"${addons.name}(${_formatPrice(addons.price)})").join(", ");
  }
}