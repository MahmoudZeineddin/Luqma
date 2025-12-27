import 'package:flutter/material.dart';
import 'package:food_delivery/core/extensions/context_extensions.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  Widget orderVoucherItem(
    BuildContext context, {
    required String name,
    required int number,
  }) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Column(
        children: [
          Text(
            '$number',
            style: Theme.of(context).textTheme.headlineMedium!.copyWith(
              color: Theme.of(context).primaryColor,
            ),
          ),
          Text(name, style: Theme.of(context).textTheme.titleLarge),
        ],
      ),
    );
  }

  Widget itemTapTile(
    BuildContext context, {

    required String title,
    String? subtitle,
    required IconData leadingIcon,
  }) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
        title: Text(title),
        onTap: () {},
        leading: Icon(
          leadingIcon,
          size: context.widthPct(.07),
          color: Theme.of(context).primaryColor,
        ),
        subtitle: subtitle != null ? Text(subtitle) : subtitle = null,
        trailing: Icon(
          Icons.chevron_right,
          color: Theme.of(context).primaryColor,
          size: context.widthPct(.07),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Center(
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(250),
            child: Image.asset('assets/images/account.png', height: 200),
          ),
          const SizedBox(height: 20),
          Text(
            "Mahmoud Zeineddin",
            style: Theme.of(
              context,
            ).textTheme.headlineMedium!.copyWith(fontWeight: FontWeight.bold),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              orderVoucherItem(context, name: 'Orders', number: 10),
              orderVoucherItem(context, name: 'Vouchers', number: 4),
            ],
          ),
          const Divider(),
          itemTapTile(
            context,
            title: "Available Vouchers",
            leadingIcon: Icons.local_offer,
          ),
          const Divider(),
          itemTapTile(
            context,
            title: "Past Orders",
            leadingIcon: Icons.shopping_cart,
          ),
        ],
      ),
    );
  }
}
