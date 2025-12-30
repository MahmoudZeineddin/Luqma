import 'package:flutter/material.dart';
import 'package:food_delivery/common.dart';

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
            style: context.textTheme.headlineMedium!.copyWith(
              color: context.colorScheme.primary,
            ),
          ),
          Text(name, style: context.textTheme.titleLarge),
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
          size: !context.isLandscape
              ? context.widthPct(.06)
              : context.widthPct(.04),
          color: context.colorScheme.primary,
        ),
        subtitle: subtitle != null ? Text(subtitle) : subtitle = null,
        trailing: Icon(
          Icons.chevron_right,
          color: context.colorScheme.primary,
          size: !context.isLandscape
              ? context.widthPct(.06)
              : context.widthPct(.04),
        ),
      ),
    );
  }

  Widget accountPhoto(
    BuildContext context, {
    required double height,
    required double width,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(100),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(100),
        child: Image.asset(
          'assets/images/account.png',
          height: context.heightPct(height),
          width: context.widthPct(width),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final accountName = Text(
      "Mahmoud Zeineddin",
      style: context.textTheme.headlineMedium!.copyWith(
        fontWeight: FontWeight.bold,
      ),
    );
    final orderVoucher = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        orderVoucherItem(context, name: 'Orders', number: 10),
        orderVoucherItem(context, name: 'Vouchers', number: 4),
      ],
    );
    return SingleChildScrollView(
      child: Center(
        child: Column(
          children: [
            if (!context.isLandscape) ...[
              accountPhoto(context, height: .25, width: .50),
              accountName,
              const SizedBox(height: 20),
              orderVoucher,
            ],
            if (context.isLandscape) ...[
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Row(
                  children: [
                    Column(
                      children: [
                        accountPhoto(context, height: .50, width: .25),
                      ],
                    ),
                    SizedBox(width: context.widthPct(.10)),
                    Column(children: [accountName, orderVoucher]),
                  ],
                ),
              ),
            ],

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
      ),
    );
  }
}
