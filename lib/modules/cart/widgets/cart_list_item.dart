import 'package:ecommerce_app/widgets/ui/qty_counter.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_app/models/product_model.dart';

class CartListItem extends StatelessWidget {
  final Product item;

  const CartListItem(
    this.item, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Card(
      clipBehavior: Clip.antiAlias,
      elevation: 2,
      child: SizedBox(
        height: size.height * .15,
        child: Row(children: [
          Image.network(
            item.imageUrl,
            height: size.height * .15,
            width: size.height * .15,
            fit: BoxFit.cover,
            alignment: Alignment.topCenter,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                        Text(
                          item.title,
                          style: Theme.of(context).textTheme.headline2!.copyWith(fontSize: 16),
                        ),
                        const SizedBox(height: 4),
                        Row(
                          children: [
                            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                              Text(
                                "Color: ",
                                style: Theme.of(context).textTheme.caption,
                              ),
                              Text(
                                item.selColor!,
                                style:
                                    Theme.of(context).textTheme.headline3!.copyWith(fontSize: 11),
                              )
                            ]),
                            const SizedBox(width: 13),
                            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                              Text(
                                "Size: ",
                                style: Theme.of(context).textTheme.caption,
                              ),
                              Text(
                                item.selSize!,
                                style:
                                    Theme.of(context).textTheme.headline3!.copyWith(fontSize: 11),
                              )
                            ]),
                          ],
                        )
                      ]),
                      PopupMenuButton(
                          child: Container(
                            width: 18,
                            alignment: Alignment.centerRight,
                            child: const Icon(
                              Icons.more_vert,
                            ),
                          ),
                          itemBuilder: (_) => [
                                const PopupMenuItem(
                                  value: 1,
                                  child: Text("Add to favorites"),
                                ),
                                const PopupMenuItem(
                                  value: 2,
                                  child: Text("Delete from the list"),
                                ),
                              ])
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Counter(item.qty!),
                      Text(
                        "${item.price.round()}\$",
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )
        ]),
      ),
    );
  }
}
