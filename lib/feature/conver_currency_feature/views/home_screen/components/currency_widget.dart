import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'list_of_items_widget.dart';

class CurrencyWidget extends StatelessWidget {
  const CurrencyWidget({Key? key,required this.from,required this.title}) : super(key: key);
  final bool from;
  final String title;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDialog(
            context: context,
            builder: (BuildContext _) =>  ListOfItemsWidget(from: from,)
        );
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(15)),
          border: Border.all(color: Colors.grey.shade400),
        ),
        padding: EdgeInsets.all(10),
        child: Row(
          children: [
            if (title != "Choose")
            CachedNetworkImage(
              imageUrl:"https://flagcdn.com/144x108/${title[0].toLowerCase()}${title[1].toLowerCase()}.png",
              fit: BoxFit.cover,
              imageBuilder: (context, imageProvider) {
                return Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: imageProvider,
                        fit: BoxFit.cover),
                    borderRadius: const BorderRadius.all(
                        Radius.circular(25)),
                  ),
                );
              },
              placeholder: (context, url) => Container(
                      decoration: BoxDecoration(
                        color: Colors.grey.withAlpha(200),
                        borderRadius:
                        BorderRadius.circular(4),
                      )),
              errorWidget: (context, url, error) =>
              const Icon(Icons.error),
            ),
            const SizedBox(width: 10,),
            Text(title,style: const TextStyle(color: Colors.black,fontSize: 14,fontWeight: FontWeight.w500),),
            const Icon(Icons.keyboard_arrow_down)
          ],
        ),
      ),
    );
  }
}
