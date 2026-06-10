import 'package:flutter/material.dart';
import 'package:pert8/providers/product_providers.dart';
import 'package:provider/provider.dart';

class CategoryFilterComponent extends StatelessWidget {
  const CategoryFilterComponent({super.key});

  @override
  Widget build(BuildContext context) {
    final productProvider = context.watch<ProductProvider>();

    return SizedBox(
      height: 52,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        itemCount: productProvider.categories.length,
        itemBuilder: (context, index) {
          final Category = productProvider.categories[index];
          final isSelected =
              productProvider.selectedCategory == Category["key"];

          return Padding(
            padding: const EdgeInsets.only(right: 8),
            child: FilterChip(
              label: Text(Category["label"]!),
              selected: isSelected,
              onSelected: (_) {
                context.read<ProductProvider>().fetchProducts(Category["key"]!);
              },
            ),
          );
        },
      ),
    );
  }
}