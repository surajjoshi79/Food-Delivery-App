import 'package:flutter/material.dart';

class MyQuantityTile extends StatelessWidget {
  final int quantity;
  final VoidCallback onDecrement;
  final VoidCallback onIncrement;
  const MyQuantityTile({
    super.key,
    required this.quantity,
    required this.onDecrement,
    required this.onIncrement,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 80,
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.background,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          GestureDetector(
              onTap: onDecrement,
              child: Icon(
                  Icons.remove,
                  size: 20,
                  color: Theme.of(context).colorScheme.primary
              )
          ),
          SizedBox(
            width: 20,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: Center(
                  child: Text(quantity.toString()
                  )
              ),
            ),
          ),
          GestureDetector(
              onTap: onIncrement,
              child: Icon(
                  Icons.add,
                  size: 20,
                  color: Theme.of(context).colorScheme.primary
              )
          ),
        ],
      ),
    );
  }
}
