import 'dart:math';

import 'package:flutter/material.dart';
import '../model/model.dart';

class TagsList extends StatefulWidget {
  const TagsList({
    Key? key,
    required this.tags,
  }) : super(key: key);

  final List<Tag> tags;

  @override
  State<TagsList> createState() => _TagsListState();
}

class _TagsListState extends State<TagsList> {
  late List<Tag> tags;

  @override
  void initState() {
    super.initState();
    tags = widget.tags.take(3).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 4.0,
      runSpacing: 0,
      alignment: WrapAlignment.start,
      children: List<Widget>.from(tags.map(
        (tag) => Chip(
          label: Text(tag.name),
          padding: EdgeInsets.zero,
          labelPadding: const EdgeInsets.symmetric(horizontal: 16.0),
        ),
      ))
        ..add(ShowMoreLessTagsButton(
          tags.length > 3,
          onPressed: _toggleListLength,
        )),
    );
  }

  void _toggleListLength() => setState(() =>
      tags = tags.length == 3 ? widget.tags : widget.tags.take(3).toList());
}

class ShowMoreLessTagsButton extends StatefulWidget {
  const ShowMoreLessTagsButton(this.showMore, {Key? key, this.onPressed})
      : super(key: key);

  final bool showMore;
  final VoidCallback? onPressed;

  @override
  State<ShowMoreLessTagsButton> createState() => _ShowMoreLessTagsButtonState();
}

class _ShowMoreLessTagsButtonState extends State<ShowMoreLessTagsButton>
    with SingleTickerProviderStateMixin {
  late final AnimationController controller;
  late final Animation<double> rotation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 200));
    rotation = Tween<double>(begin: 0, end: pi).animate(controller);
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onPressed: () async {
          widget.onPressed?.call();
          if (controller.isAnimating) controller.stop();
          if (!widget.showMore) {
            await controller.forward();
          } else {
            await controller.reverse();
          }
        },
        icon: AnimatedBuilder(
          animation: controller,
          builder: (context, child) {
            return Transform(
              alignment: Alignment.center,
              transform: Matrix4.rotationY(rotation.value),
              child: child,
            );
          },
          child: const Icon(Icons.chevron_left),
        ));
  }
}
