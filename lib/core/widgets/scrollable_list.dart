import 'package:flutter/material.dart';

class InfiniteScrollableList extends StatefulWidget {

  final int itemCount;
  final Function itemBuilder;
  final Function onTopReached;
  final Function onBottomReached;

  InfiniteScrollableList({
    @required this.itemCount,
    @required this.itemBuilder,
    this.onTopReached,
    this.onBottomReached
  });

  @override
  _InfiniteScrollableListState createState() => _InfiniteScrollableListState();
}

class _InfiniteScrollableListState extends State<InfiniteScrollableList> {
  ScrollController _controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = ScrollController();

    _controller.addListener((){
      if (isTop && widget.onTopReached != null) widget.onTopReached();
      else if (isBottom && widget.onBottomReached != null) widget.onBottomReached();
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.itemCount,
      controller: _controller,
      itemBuilder: widget.itemBuilder
    );
  }

  bool get isTop {
    return _controller.offset <= _controller.position.minScrollExtent &&
          !_controller.position.outOfRange;
  }

  bool get isBottom {
    return _controller.offset >= _controller.position.maxScrollExtent &&
          !_controller.position.outOfRange;
  }
}
