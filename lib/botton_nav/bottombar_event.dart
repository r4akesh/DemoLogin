part of 'bottombar_bloc.dart';


abstract class BottombarEvent{}

class TabSelected  extends BottombarEvent{
  final int index;

  TabSelected(this.index);
}
