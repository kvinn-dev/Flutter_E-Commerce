import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app_new/src/themes/light_color.dart';

class TopNavigationBar extends StatelessWidget {
  const TopNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    final double statusBarHeight = MediaQuery.of(context).padding.top;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(
        top: statusBarHeight + 5, // dikurangi sedikit supaya nggak terlalu tinggi padding bawah lebih konsisten
        left: 16,
        right: 16,
      ),
      color: LightColor.orange,
      child: Row(
        children: [
          // SEARCH BAR
          Expanded(
            child: Container(
              height: 30, // sedikit lebih rendah, proporsional
              padding: const EdgeInsets.symmetric(horizontal: 14),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(22), // setengah dari tinggi untuk bulat pas
              ),
              child: Row(
                children: const [
                  Icon(Icons.search, color: Colors.grey, size: 20),
                  SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      "Cari",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 14,
                      ),
                    ),
                  ),
                  Icon(Icons.camera_alt_outlined, color: Colors.grey, size: 20),
                ],
              ),
            ),
          ),

          const SizedBox(width: 12), // jarak antar search dan icon

          // CART
          Stack(
            clipBehavior: Clip.none,
            children: [
              const Icon(Icons.shopping_cart_outlined, color: Colors.white, size: 26),
              Positioned(
                right: -6,
                top: -6,
                child: Container(
                  padding: const EdgeInsets.all(4),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: const Text(
                    "9+",
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(width: 16), // jarak antar icon

          // CHAT
          const Icon(Icons.chat_bubble_outline, color: Colors.white, size: 24),
        ],
      ),
    );
  }
}