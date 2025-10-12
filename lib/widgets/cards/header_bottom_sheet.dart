import 'package:flutter/material.dart';

class HeaderBottomSheet extends StatefulWidget {
  final String title;
  final String? description;
  final String? imageSrc;

  const HeaderBottomSheet({
    super.key,
    required this.title,
    this.description,
    this.imageSrc,
  });

  @override
  State<HeaderBottomSheet> createState() => _HeaderBottomSheetState();
}

class _HeaderBottomSheetState extends State<HeaderBottomSheet> {
  late String title;
  String? description;
  String? imageSrc;

  @override
  void initState() {
    title = widget.title;
    description = widget.description;
    imageSrc = widget.imageSrc;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      spacing: 8,
      children: [
        if (imageSrc != null) PreviewImage(source:imageSrc) else SizedBox(),
        TextColumn(title: title, description: description)
      ],
    );
  }
}


class PreviewImage extends StatelessWidget {
  final String? source;
  const PreviewImage({super.key, this.source});

  @override
  Widget build(BuildContext context) {
    final double borderRadius = 5.0;
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      width: 25,
      height: 25,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(borderRadius),
        child: Image.asset(source ?? "",fit: BoxFit.cover,),
      ),
    );

  }

}

class TextColumn extends StatelessWidget {

  final String title;
  final String? description;
  const TextColumn({super.key, required this.title, this.description});

  @override
  Widget build(BuildContext context) {
return Column(children: [
  Text(title),
  Text(description ?? ""),
],);
  }

}