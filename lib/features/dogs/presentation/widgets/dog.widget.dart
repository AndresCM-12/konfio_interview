import 'package:flutter/material.dart';
import 'package:sh_mobile/features/dogs/domain/entities/dog.entity.dart';
import 'package:sh_mobile/shared/widgets/header1_title.dart';
import 'package:sh_mobile/shared/widgets/span_body.dart';
import 'package:sh_mobile/shared/widgets/text_body.dart';
import 'package:cached_network_image/cached_network_image.dart';

class DogWidget extends StatelessWidget {
  final DogEntity dog;

  const DogWidget({super.key, required this.dog});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 200,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [imageCard(), whiteCard()],
      ),
    );
  }

  Container imageCard() {
    return Container(
      width: 133,
      height: double.infinity,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(12.0),
          topRight: Radius.circular(12.0),
          bottomLeft: Radius.circular(12.0),
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12.0),
        child: CachedNetworkImage(
          imageUrl: dog.image!,
          errorWidget: (context, url, error) => const Icon(Icons.error),
          fit: BoxFit.fitWidth,
        ),
      ),
    );
  }

  Expanded whiteCard() {
    return Expanded(
      child: Container(
        height: 180,
        padding: const EdgeInsets.only(
            top: 16.0, left: 24.0, right: 12.0, bottom: 16.0),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(12.0),
            bottomRight: Radius.circular(12.0),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            Header1(title: dog.dogName!),
            const SizedBox(height: 4.0),
            Expanded(child: TextBody(text: dog.description!, maxLines: 4)),
            const SizedBox(height: 4.0),
            SpanBody(text: "Almost ${dog.age!} years"),
            const SizedBox(height: 16.0),
          ],
        ),
      ),
    );
  }
}
