import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:main_project/controller/cart_controller.dart';
import 'package:main_project/controller/shope_controller.dart';
import 'package:main_project/model/shope_iteams.dart';
import 'product_detail_view.dart';

class ScreenProducts extends StatefulWidget {
  const ScreenProducts({super.key});

  @override
  State<ScreenProducts> createState() => _ScreenProductsState();
}

class _ScreenProductsState extends State<ScreenProducts> {
  final ShopController shopController = Get.put(ShopController());
  final CartController cartController = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(16),
                child: SizedBox(
                  height: 200,
                  child: PageView(
                    children: [
                      _buildAdSlide('lib/assets/img/c.avif'),
                      _buildAdSlide('lib/assets/img/a.avif'),
                      _buildAdSlide('lib/assets/img/b.avif'),
                    ],
                  ),
                ),
              ),
              Obx(() {
                if (shopController.products.isEmpty) {
                  return const Center(child: CircularProgressIndicator());
                }

                List<ShopItem> products = shopController.products;

                if (products.isEmpty) {
                  return const Center(child: Text('No products available.'));
                }

                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.83,
                      crossAxisSpacing: 4,
                      mainAxisSpacing: 4,
                    ),
                    itemCount: products.length,
                    itemBuilder: (context, index) {
                      ShopItem product = products[index];
                      return Card(
                        color: Colors.white,
                        child: InkWell(
                          onTap: () {
                            Get.to(
                                () => ScreenProductDetails(product: product));
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  product.title,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    color: Colors.red,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                ),
                                const SizedBox(height: 4),
                                Container(
                                  height: 120,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(8),
                                    child: Image.network(
                                      product.image,
                                      fit: BoxFit.cover,
                                      errorBuilder:
                                          (context, error, stackTrace) {
                                        return const Center(
                                          child: Icon(
                                            Icons.error,
                                            color: Colors.red,
                                            size: 30,
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 5),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Flexible(
                                      child: Text(
                                        '\$${product.price.toString()}',
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                          color: Colors.green,
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                    ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.red,
                                      ),
                                      onPressed: () {
                                        cartController.addToCart(product);
                                        Get.snackbar(
                                          'Added to Cart',
                                          '${product.title} has been added to your cart.',
                                          snackPosition: SnackPosition.TOP,
                                          duration: const Duration(seconds: 1),
                                        );
                                      },
                                      child: const Icon(
                                        Icons.shopping_cart,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAdSlide(String assetPath) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Image.asset(
                assetPath,
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            ),
          ],
        ),
      ),
    );
  }
}