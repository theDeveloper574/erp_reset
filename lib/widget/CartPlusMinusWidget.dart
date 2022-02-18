import 'package:flutter/material.dart';

class CartPlusMinu extends StatefulWidget {
  String price;
  double subTotalCountMethodMinus;
  int quantity;
  double testCounter;
  double subTotalCountMethod;
  CartPlusMinu(this.price, this.quantity, this.testCounter,
      this.subTotalCountMethod, this.subTotalCountMethodMinus);
  @override
  _CartPlusMinuState createState() => _CartPlusMinuState();
}

class _CartPlusMinuState extends State<CartPlusMinu> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          '\$${widget.price}',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        Container(
          height: 25,
          width: 100,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.grey[100],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    if (widget.quantity > 1) {
                      setState(() {
                        // item.quantity ++;

                        String newValue = (widget.quantity--).toString();
                        widget.testCounter =
                            double.parse(newValue) - double.parse(widget.price);
                        print(
                            "this is new counter $widget.testCounter this is new Value ");
                        widget.subTotalCountMethodMinus;
                      });
                    }
                  });
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      bottomLeft: Radius.circular(10),
                    ),
                    color: Colors.grey[400],
                  ),
                  child: Center(
                    child: Icon(
                      Icons.remove,
                      size: 25,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Text(
                "${widget.quantity}",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    // item.quantity ++;

                    String newValue = (widget.quantity++).toString();
                    widget.testCounter =
                        double.parse(newValue) * double.parse(widget.price);
                    print(
                        "this is new counter ${widget.testCounter} this is new Value ");
                    widget.subTotalCountMethod;
                  });
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                    ),
                    color: Colors.blue,
                  ),
                  child: Icon(
                    Icons.add,
                    color: Colors.white,
                    size: 25,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
