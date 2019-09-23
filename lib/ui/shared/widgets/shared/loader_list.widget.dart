import 'package:flutter/cupertino.dart';
import 'package:shopping/ui/shared/widgets/shared/progress_indicator.widget.dart';

class LoaderList extends StatelessWidget {
  final object;
  final Function callback;

  LoaderList({@required this.object, @required this.callback});

  @override
  Widget build(BuildContext context) {
    if (object == null)
      return Center(
        child: GenericProgressIndicator(),
      );

    if (object.length == 0)
      return Center(
        child: Text("Nenhum ítem encontraado"),
      );

    return callback();
  }
}
