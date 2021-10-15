import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  SearchBar(this.controller, {Key? key, this.onSearch}) : super(key: key);

  final TextEditingController controller;
  final FocusNode _focusNode = FocusNode();
  final ValueChanged<String>? onSearch;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 2,
      child: Container(
        height: kToolbarHeight,
        padding: const EdgeInsets.only(left: 16.0),
        child: Row(
          children: [
            Flexible(
              child: TextField(
                controller: controller,
                focusNode: _focusNode,
                onSubmitted: onSearch,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Artist, album or song...',
                ),
                textInputAction: TextInputAction.search,
              ),
            ),
            IconButton(
              onPressed: () {
                if (!_focusNode.hasFocus) {
                  FocusScope.of(context).requestFocus(_focusNode);
                  return;
                } else if (controller.text.isNotEmpty) {
                  onSearch?.call(controller.text);
                  _focusNode.unfocus();
                }
              },
              icon: const Icon(Icons.search),
            ),
          ],
        ),
      ),
    );
  }
}
