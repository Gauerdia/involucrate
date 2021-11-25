import 'package:flutter/cupertino.dart';

class TestTabHeader extends SliverPersistentHeaderDelegate{
  TestTabHeader(
      this.searchUI,
      this.titleLength
      );
  final Widget searchUI;
  final int titleLength;

  double neededExtent = 52;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent){
    if(titleLength > 23){
      neededExtent = 88;
    }
    if(titleLength > 47){
      neededExtent = 120;
    }
    if(titleLength > 70){
      neededExtent = 160;
    }
    if(titleLength > 93){
      neededExtent = 200;
    }
    return searchUI;
  }

  @override
  double get maxExtent => neededExtent;

  @override
  double get minExtent => 52.0;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate){
    return false;
  }
}
