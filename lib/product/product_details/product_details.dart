import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:petsrology/product/product_model/product_model.dart';
import 'package:petsrology/product/product_model/cart_model.dart';

class ProductDetails extends StatefulWidget {
  const ProductDetails({super.key, required this.products});
  final ProductModel products;

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> with SingleTickerProviderStateMixin {
  int quantity = 1;
  late AnimationController _drawerController;
  bool _isCartOpen = false;

  // Convert price from $ to Tk (approximately 1$ = 112 Tk)
  String convertToTk(String dollarPrice) {
    // Remove the $ sign and convert to double
    final price = double.tryParse(dollarPrice.replaceAll('\$', '')) ?? 0.0;
    // Convert to Tk (approximately 112 Tk per dollar)
    final tkPrice = (price * 112).round();
    return 'Tk. $tkPrice';
  }

  @override
  void initState() {
    super.initState();
    _drawerController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
  }

  @override
  void dispose() {
    _drawerController.dispose();
    super.dispose();
  }

  void _toggleCart() {
    setState(() {
      if (_isCartOpen) {
        _drawerController.reverse();
      } else {
        _drawerController.forward();
      }
      _isCartOpen = !_isCartOpen;
    });
  }

  void addToCart() {
    final cartProvider = Provider.of<CartProvider>(context, listen: false);
    cartProvider.addItem(widget.products, quantity);
    _toggleCart();
    
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          "Added ${widget.products.name} x$quantity to cart",
          style: const TextStyle(fontFamily: "Playfair"),
        ),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  void buyNow() {
    final cartProvider = Provider.of<CartProvider>(context, listen: false);
    cartProvider.addItem(widget.products, quantity);
    _toggleCart();
    
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          "Buying ${widget.products.name} x$quantity",
          style: const TextStyle(fontFamily: "Playfair"),
        ),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 238, 232, 236),
      body: Stack(
        children: [
          SafeArea(
            child: LayoutBuilder(
              builder: (context, constraints) {
                return SingleChildScrollView(
                  child: ConstrainedBox(
                    constraints: BoxConstraints(minHeight: constraints.maxHeight),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 20),
                          decoration: BoxDecoration(
                            color: widget.products.color,
                            borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(40),
                              bottomRight: Radius.circular(40),
                            ),
                          ),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  GestureDetector(
                                    onTap: () => Navigator.pop(context),
                                    child: Container(
                                      padding: const EdgeInsets.all(8),
                                      decoration: const BoxDecoration(
                                        color: Colors.white,
                                        shape: BoxShape.circle,
                                      ),
                                      child: const Icon(Icons.arrow_back_ios,
                                          color: Colors.black, size: 20),
                                    ),
                                  ),
                                  // Cart icon with badge
                                  Stack(
                                    children: [
                                      GestureDetector(
                                        onTap: _toggleCart,
                                        child: Container(
                                          padding: const EdgeInsets.all(8),
                                          decoration: const BoxDecoration(
                                            color: Colors.white,
                                            shape: BoxShape.circle,
                                          ),
                                          child: const Icon(Icons.shopping_cart,
                                              color: Colors.black, size: 20),
                                        ),
                                      ),
                                      if (cartProvider.itemCount > 0)
                                        Positioned(
                                          right: 0,
                                          top: 0,
                                          child: Container(
                                            padding: const EdgeInsets.all(4),
                                            decoration: const BoxDecoration(
                                              color: Colors.red,
                                              shape: BoxShape.circle,
                                            ),
                                            constraints: const BoxConstraints(
                                              minWidth: 16,
                                              minHeight: 16,
                                            ),
                                            child: Text(
                                              '${cartProvider.itemCount}',
                                              style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 10,
                                                fontFamily: "Playfair",
                                              ),
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                        ),
                                    ],
                                  ),
                                ],
                              ),
                              const SizedBox(height: 20),
                              Hero(
                                tag: widget.products.image,
                                child: Container(
                                  constraints: const BoxConstraints(
                                    maxHeight: 220,
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(30),
                                    child: Image.asset(
                                      widget.products.image,
                                      fit: BoxFit.contain,
                                      width: double.infinity,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 20),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  infoCard(widget.products.brand, "Brand"),
                                  infoCard(convertToTk(widget.products.price), "Price"),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 10),
                              Text(
                                widget.products.name,
                                style: const TextStyle(
                                  fontSize: 28,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "Playfair",
                                ),
                                overflow: TextOverflow.visible,
                              ),
                              const SizedBox(height: 8),
                              Text(
                                widget.products.category,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontFamily: "Playfair",
                                  color: Color.fromARGB(255, 83, 81, 81),
                                ),
                              ),
                              const SizedBox(height: 16),
                              Text(
                                widget.products.description,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontFamily: "Playfair",
                                  color: Colors.black87,
                                  height: 1.5,
                                ),
                              ),
                              const SizedBox(height: 20),

                              // Quantity and Button Row
                              Wrap(
                                alignment: WrapAlignment.spaceBetween,
                                crossAxisAlignment: WrapCrossAlignment.center,
                                spacing: 10,
                                runSpacing: 20,
                                children: [
                                  // Quantity selector
                                  Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      IconButton(
                                        icon: const Icon(Icons.remove_circle_outline),
                                        onPressed: () {
                                          if (quantity > 1) {
                                            setState(() {
                                              quantity--;
                                            });
                                          }
                                        },
                                      ),
                                      Text(
                                        '$quantity',
                                        style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: "Playfair",
                                        ),
                                      ),
                                      IconButton(
                                        icon: const Icon(Icons.add_circle_outline),
                                        onPressed: () {
                                          setState(() {
                                            quantity++;
                                          });
                                        },
                                      ),
                                    ],
                                  ),

                                  // Buttons for "Buy Now" and "Add to Cart"
                                  Wrap(
                                    spacing: 10,
                                    runSpacing: 10,
                                    children: [
                                      Container(
                                        height: 60,
                                        width: 130,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(20),
                                          // Updated gradient colors for Buy Now to match theme
                                          gradient: const LinearGradient(
                                            colors: [
                                              Color(0xFF8E24AA),  // Purple
                                              Color.fromARGB(255, 141, 1, 78),  // Pink
                                            ],
                                            begin: Alignment.topLeft,
                                            end: Alignment.bottomRight,
                                          ),
                                        ),
                                        child: ElevatedButton(
                                          onPressed: buyNow,
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: Colors.transparent,
                                            shadowColor: Colors.transparent,
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(20),
                                            ),
                                          ),
                                          child: const Text(
                                            "Buy Now",
                                            style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white,
                                              fontFamily: "Playfair",
                                            ),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        height: 60,
                                        width: 130,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(20),
                                          // Updated to solid dark blue color
                                          color: const Color(0xFF0D47A1), // Dark blue color
                                        ),
                                        child: ElevatedButton(
                                          onPressed: addToCart,
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: Colors.transparent,
                                            shadowColor: Colors.transparent,
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(20),
                                            ),
                                          ),
                                          child: const Text(
                                            "Add to Cart",
                                            style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white,
                                              fontFamily: "Playfair",
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              const SizedBox(height: 20),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          // Cart Drawer
          AnimatedBuilder(
            animation: _drawerController,
            builder: (context, child) {
              return Positioned(
                top: 0,
                bottom: 0,
                right: _drawerController.value * 0 - (1 - _drawerController.value) * (MediaQuery.of(context).size.width * 0.8),
                width: MediaQuery.of(context).size.width * 0.8,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black,
                        blurRadius: 10,
                        spreadRadius: 2,
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(16.0),
                        decoration: const BoxDecoration(
                          // Updated gradient colors for cart header to match theme
                          gradient: LinearGradient(
                            colors: [
                              Color.fromARGB(255, 126, 6, 147),  // Dark purple from your theme
                              
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "Your Cart",
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontFamily: "Playfair",
                              ),
                            ),
                            IconButton(
                              icon: const Icon(Icons.close, color: Colors.white),
                              onPressed: _toggleCart,
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: cartProvider.items.isEmpty
                            ? Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.shopping_cart_outlined,
                                      size: 100,
                                      color: Colors.grey[400],
                                    ),
                                    const SizedBox(height: 16),
                                    const Text(
                                      "Your cart is empty",
                                      style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.grey,
                                        fontFamily: "Playfair",
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            : ListView.builder(
                                itemCount: cartProvider.items.length,
                                padding: const EdgeInsets.all(8),
                                itemBuilder: (ctx, i) => Card(
                                  elevation: 2,
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 8, vertical: 4),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      children: [
                                        Container(
                                          width: 60,
                                          height: 60,
                                          decoration: BoxDecoration(
                                            color: cartProvider
                                                .items[i].product.color
                                                ,
                                            borderRadius:
                                                BorderRadius.circular(12),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Image.asset(
                                              cartProvider.items[i].product.image,
                                              fit: BoxFit.contain,
                                            ),
                                          ),
                                        ),
                                        const SizedBox(width: 8),
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                cartProvider.items[i].product.name,
                                                style: const TextStyle(
                                                  fontFamily: "Playfair",
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 14,
                                                ),
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                              const SizedBox(height: 4),
                                              Text(
                                                convertToTk(cartProvider.items[i].product.price),
                                                style: const TextStyle(
                                                  fontFamily: "Playfair",
                                                  color: Colors.black87,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              'x${cartProvider.items[i].quantity}',
                                              style: const TextStyle(
                                                fontFamily: "Playfair",
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            IconButton(
                                              icon: const Icon(Icons.delete,
                                                  color: Colors.red),
                                              onPressed: () => cartProvider
                                                  .removeItem(cartProvider
                                                      .items[i].product.name),
                                              iconSize: 20,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(16),
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: 4,
                              offset: Offset(0, -2),
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  "Total",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: "Playfair",
                                  ),
                                ),
                                Text(
                                  "Tk. ${(cartProvider.totalAmount * 112).round()}",
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: "Playfair",
                                    color: Color(0xFF5A3E8D), // Using theme color
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 16),
                            SizedBox(
                              width: double.infinity,
                              height: 50,
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(14),
                                  // Updated gradient colors for checkout button to match theme
                                  gradient: const LinearGradient(
                                    colors: [
                                      Color(0xFF8E24AA),  // Purple
                                      Color(0xFFD81B60),  // Pink
                                    ],
                                    begin: Alignment.centerLeft,
                                    end: Alignment.centerRight,
                                  ),
                                ),
                                child: ElevatedButton(
                                  onPressed: cartProvider.items.isEmpty
                                      ? null
                                      : () {
                                          // Implement checkout functionality
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            const SnackBar(
                                              content: Text(
                                                "Proceeding to checkout...",
                                                style: TextStyle(fontFamily: "Playfair"),
                                              ),
                                              duration: Duration(seconds: 2),
                                            ),
                                          );
                                        },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.transparent,
                                    shadowColor: Colors.transparent,
                                    disabledBackgroundColor:
                                        Colors.grey,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(14),
                                    ),
                                  ),
                                  child: const Text(
                                    "Proceed to Checkout",
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                      fontFamily: "Playfair",
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
          // Semi-transparent overlay when drawer is open
          if (_isCartOpen)
            Positioned.fill(
              child: GestureDetector(
                onTap: _toggleCart,
                child: Container(
                  color: Colors.black.withOpacity(0.5),
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget infoCard(String value, String label) {
    return Container(
      height: 80,
      width: 80,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            blurRadius: 8,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            value,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontFamily: "Playfair",
              fontSize: 16,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: const TextStyle(
              fontSize: 14,
              fontFamily: "Playfair",
              color: Colors.black45,
            ),
          ),
        ],
      ),
    );
  }
}
