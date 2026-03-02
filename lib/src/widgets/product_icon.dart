import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app_new/src/model/category.dart';
import 'package:flutter_ecommerce_app_new/src/themes/light_color.dart';
import 'package:flutter_ecommerce_app_new/src/themes/theme.dart';
import 'package:flutter_ecommerce_app_new/src/widgets/title_text.dart';
import 'package:flutter_ecommerce_app_new/src/widgets/extentions.dart';

class ProductIcon extends StatelessWidget {
  // final String imagePath;
  // final String text;
  final ValueChanged<Category> onSelected;
  final Category model;
  const ProductIcon({super.key, required this.model, required this.onSelected});

  Widget build(BuildContext context) {
    return Container(
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
            child: Container(
              padding: AppTheme.hPadding,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                color: model.isSelected
                    ? LightColor.background
                    : Colors.transparent,
                border: Border.all(
                  color: model.isSelected ? LightColor.orange : LightColor.grey,
                  width: model.isSelected ? 2 : 1,
                ),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                    color: model.isSelected ? Color(0xfffbf2ef) : Colors.white,
                    blurRadius: 10,
                    spreadRadius: 5,
                    offset: Offset(5, 5),
                  ),
                ],
              ),
              child: Row(
                children: <Widget>[
                  Image.asset(model.image),
                  TitleText(
                    text: model.name,
                    fontWeight: FontWeight.w700,
                    fontSize: 15,
                  )
                ],
              ),
            ).ripple(
              () {
                onSelected(model);
              },
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
          );
  }
}
