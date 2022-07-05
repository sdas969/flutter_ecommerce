import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/constants.dart';

class ViewChangeButtonRow extends StatelessWidget {
  const ViewChangeButtonRow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Row(children: [
        TextButton(
            onPressed: () {},
            child:
                Icon(Icons.grid_view, color: appTextColor.withOpacity(0.25))),
        TextButton(
            onPressed: () {},
            style: TextButton.styleFrom(
                backgroundColor: exploreProductsButtonColor.withOpacity(0.25)),
            child: const Icon(Icons.menu, color: exploreProductsButtonColor))
      ]);
}
