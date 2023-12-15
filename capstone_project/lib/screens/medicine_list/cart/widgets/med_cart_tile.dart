import 'package:animated_overflow/animated_overflow.dart';
import 'package:capstone_project/constants/color_theme.dart';
import 'package:capstone_project/constants/text_theme.dart';
import 'package:flutter/material.dart';

class MedCartTile extends StatelessWidget {
  final String title;
  final String category;
  final double price;
  final String quantity;
  final String image;

  const MedCartTile({
    super.key,
    required this.title,
    required this.category,
    required this.price,
    required this.quantity,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Container(
        height: MediaQuery.of(context).size.height * .139,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          boxShadow: const [
            BoxShadow(
              color: Color(0x19000000),
              blurRadius: 24,
              offset: Offset(0, 0),
              spreadRadius: 0,
            )
          ],
        ),
        child: MaterialButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          elevation: 0,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          color: ThemeColor().white,
          onPressed: () {},
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image(
                image: NetworkImage(image),
                width: MediaQuery.of(context).size.width * .21,
                height: MediaQuery.of(context).size.height * .12,
                fit: BoxFit.cover,
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 6),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width * .53,
                            child: AnimatedOverflow(
                              animatedOverflowDirection:
                                  AnimatedOverflowDirection.HORIZONTAL,
                              maxWidth: MediaQuery.of(context).size.width * .51,
                              padding: 3,
                              speed: 70,
                              child: Text(
                                title,
                                maxLines: 1,
                                overflow: TextOverflow.visible,
                                style:
                                    ThemeTextStyle().labelMediumBold.copyWith(
                                          color: ThemeColor().cartMedTitle,
                                        ),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: const Icon(Icons.close, size: 20),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      category,
                      style: ThemeTextStyle()
                          .labelMediumBold
                          .copyWith(color: ThemeColor().cartMedTypeTitle),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          flex: 2,
                          child: Text("Rp. $price"),
                        ),
                        Flexible(
                          flex: 1,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Material(
                                borderRadius: BorderRadius.circular(50),
                                color: ThemeColor().cartTileButton,
                                child: SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * .068,
                                  height:
                                      MediaQuery.of(context).size.height * .033,
                                  child: IconButton(
                                    padding: EdgeInsets.zero,
                                    onPressed: () {},
                                    icon: const Icon(Icons.remove),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 9),
                              Text(quantity),
                              const SizedBox(width: 9),
                              Material(
                                borderRadius: BorderRadius.circular(50),
                                color: ThemeColor().cartTileButton,
                                child: SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * .068,
                                  height:
                                      MediaQuery.of(context).size.height * .033,
                                  child: IconButton(
                                    padding: EdgeInsets.zero,
                                    onPressed: () {},
                                    icon: const Icon(Icons.add),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
