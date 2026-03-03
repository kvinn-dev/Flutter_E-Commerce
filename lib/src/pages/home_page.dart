import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app_new/src/model/data.dart';
import 'package:flutter_ecommerce_app_new/src/themes/light_color.dart';
import 'package:flutter_ecommerce_app_new/src/themes/theme.dart';
import 'package:flutter_ecommerce_app_new/src/widgets/TopNavigationBar.dart';
import 'package:flutter_ecommerce_app_new/src/widgets/product_card.dart';
import 'package:flutter_ecommerce_app_new/src/widgets/product_icon.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        // Sliver App Bar untuk navbar
        SliverAppBar(
            pinned: true,
            elevation: 0,
            backgroundColor: LightColor.orange,
            automaticallyImplyLeading: false,
            toolbarHeight: 50,
            collapsedHeight: 50,
            flexibleSpace: Container(
              color: LightColor.orange,
              child: SafeArea(
                bottom: false,
                child: const TopNavigationBar(),
              ),
            ),
          ),

        // SliverList untuk konten
        SliverList(
          delegate: SliverChildListDelegate([
            const SizedBox(height: 16),
            _buildPromoBanner(),
            const SizedBox(height: 16),
            _buildQuickActions(),
            const SizedBox(height: 16),
            _buildFlashSaleHeader(),
            const SizedBox(height: 12),
            _buildFlashSaleItems(),
            const SizedBox(height: 16),
            _buildRamadanPromo(),
            const SizedBox(height: 16),
            _buildLiveSection(),
            const SizedBox(height: 16),
            _buildCategoryWidget(),
            const SizedBox(height: 16),
            _buildProductWidget(),
            const SizedBox(height: 24),
          ]),
        ),

        const SliverToBoxAdapter(child: SizedBox(height: 50)),
      ],
    );
  }

  // ... (semua method widget lainnya tetap sama seperti sebelumnya)
  Widget _buildPromoBanner() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [LightColor.orange, LightColor.darkOrange],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'PROMO PUNCAK 3.3',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 4),
          const Text(
            'BIG RAMADAN SALE',
            style: TextStyle(color: Colors.white70, fontSize: 12),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  'LOUISESSECARLETT FAMILY',
                  style: TextStyle(
                    color: LightColor.orange,
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildQuickActions() {
    final List<Map<String, dynamic>> quickActions = [
      {
        'icon': Icons.credit_card,
        'label': 'Pulsa & Tagihan',
        'color': LightColor.orange,
      },
      {'icon': Icons.restaurant, 'label': 'Food', 'color': Colors.green},
      {'icon': Icons.star, 'label': 'VIP x ChatGPT', 'color': Colors.amber},
      {'icon': Icons.mosque, 'label': 'Barokah', 'color': LightColor.purple},
      {
        'icon': Icons.flash_on,
        'label': 'Flash Sale',
        'color': Colors.red,
        'badge': '1RB',
      },
      {'icon': Icons.card_giftcard, 'label': 'Hadiah', 'color': Colors.pink},
      {
        'icon': Icons.live_tv,
        'label': 'Live',
        'color': Colors.blue,
        'isLive': true,
      },
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          // First row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: quickActions.take(4).map((action) {
              return _buildActionItem(
                icon: action['icon'],
                label: action['label'],
                color: action['color'],
              );
            }).toList(),
          ),
          const SizedBox(height: 16),
          // Second row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: quickActions.skip(4).map((action) {
              return _buildActionItem(
                icon: action['icon'],
                label: action['label'],
                color: action['color'],
                badge: action['badge'],
                isLive: action['isLive'] ?? false,
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildActionItem({
    required IconData icon,
    required String label,
    required Color color,
    String? badge,
    bool isLive = false,
  }) {
    return Column(
      children: [
        Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: color.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(icon, color: color, size: 24),
            ),
            if (badge != null)
              Positioned(
                right: -2,
                top: -2,
                child: Container(
                  padding: const EdgeInsets.all(4),
                  decoration: const BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle,
                  ),
                  child: Text(
                    badge,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 8,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            if (isLive)
              Positioned(
                bottom: -2,
                right: -2,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 4,
                    vertical: 2,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: const Text(
                    'LIVE',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 8,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
          ],
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: const TextStyle(fontSize: 10, fontWeight: FontWeight.w500),
          textAlign: TextAlign.center,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }

  Widget _buildFlashSaleHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          Icon(Icons.flash_on, color: LightColor.orange, size: 20),
          const SizedBox(width: 4),
          const Text(
            'Flash Sale',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          const SizedBox(width: 8),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(4),
            ),
            child: const Text(
              '00:43:53',
              style: TextStyle(
                color: Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const Spacer(),
          TextButton(
            onPressed: () {},
            child: Text(
              'LIHAT SEMUA',
              style: TextStyle(
                color: LightColor.orange,
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFlashSaleItems() {
    return SizedBox(
      height: 220,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: 5,
        itemBuilder: (context, index) {
          return Container(
            width: 140,
            margin: const EdgeInsets.only(right: 12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.1),
                  blurRadius: 5,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Image placeholder
                Expanded(
                  flex: 3,
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: LightColor.lightGrey.withOpacity(0.3),
                          borderRadius: const BorderRadius.vertical(
                            top: Radius.circular(12),
                          ),
                        ),
                        child: const Center(
                          child: Icon(
                            Icons.image,
                            color: Colors.grey,
                            size: 40,
                          ),
                        ),
                      ),
                      if (index == 0)
                        Positioned(
                          top: 8,
                          left: 8,
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 6,
                              vertical: 2,
                            ),
                            decoration: BoxDecoration(
                              color: LightColor.orange,
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: const Text(
                              'HANYA 1 STOK',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 8,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
                // Content
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Octarine Eau De Parfum',
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Row(
                          children: [
                            Text(
                              'Rp2.000',
                              style: TextStyle(
                                color: LightColor.orange,
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                              ),
                            ),
                            const SizedBox(width: 4),
                            Text(
                              'Rp333.520',
                              style: TextStyle(
                                color: Colors.grey[400],
                                fontSize: 8,
                                decoration: TextDecoration.lineThrough,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 4,
                                vertical: 2,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(2),
                              ),
                              child: const Text(
                                '-60%',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 8,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            const SizedBox(width: 4),
                            Text(
                              'S4 TERJUAL',
                              style: TextStyle(
                                color: Colors.grey[600],
                                fontSize: 8,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildRamadanPromo() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [LightColor.darkOrange, LightColor.orange],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'BEDUK BERKAH 10M',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                'TERSEDIA & pilihan Warun!',
                style: TextStyle(
                  color: Colors.white.withOpacity(0.8),
                  fontSize: 12,
                ),
              ),
            ],
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              'PROMO XTRA',
              style: TextStyle(
                color: LightColor.darkBlue,
                fontWeight: FontWeight.bold,
                fontSize: 12,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLiveSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.live_tv, color: Colors.pink, size: 20),
              const SizedBox(width: 8),
              const Text(
                'Live',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
            ],
          ),
          const SizedBox(height: 12),
          SizedBox(
            height: 100,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 4,
              itemBuilder: (context, index) {
                return Container(
                  width: 80,
                  margin: const EdgeInsets.only(right: 12),
                  child: Column(
                    children: [
                      Stack(
                        clipBehavior: Clip.none,
                        children: [
                          CircleAvatar(
                            radius: 30,
                            backgroundColor: Colors.grey[300],
                            child: const Icon(
                              Icons.person,
                              color: Colors.white,
                              size: 30,
                            ),
                          ),
                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 4,
                                vertical: 2,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: const Text(
                                'LIVE',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 8,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      const Text(
                        'Octarine',
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w500,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryWidget() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      width: AppTheme.fullWidth(context),
      height: 80,
      child: ListView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        children: AppData.categoryList
            .map(
              (category) => ProductIcon(
                model: category,
                onSelected: (model) {
                  setState(() {
                    for (var item in AppData.categoryList) {
                      item.isSelected = false;
                    }
                    model.isSelected = true;
                  });
                },
              ),
            )
            .toList(),
      ),
    );
  }

  Widget _buildProductWidget() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      width: AppTheme.fullWidth(context),
      height: AppTheme.fullWidth(context) * 0.7,
      child: GridView(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1,
          childAspectRatio: 4 / 3,
          mainAxisSpacing: 30,
          crossAxisSpacing: 20,
        ),
        padding: const EdgeInsets.only(left: 20),
        scrollDirection: Axis.horizontal,
        children: AppData.productList
            .map(
              (product) => ProductCard(
                product: product,
                onSelected: (model) {
                  setState(() {
                    for (var item in AppData.productList) {
                      item.isSelected = false;
                    }
                    model.isSelected = true;
                  });
                },
              ),
            )
            .toList(),
      ),
    );
  }
}
