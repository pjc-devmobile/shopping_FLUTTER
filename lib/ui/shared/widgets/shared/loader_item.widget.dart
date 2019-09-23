import 'package:flutter/cupertino.dart';
import 'package:shopping/ui/shared/widgets/shared/progress_indicator.widget.dart';

class LoaderItem extends StatelessWidget {
  final object;
  final Function callback;

  LoaderItem({@required this.object, @required this.callback});

  @override
  Widget build(BuildContext context) {
    if (object == null)
      return Center(
        child: GenericProgressIndicator(),
      );

  /*  if (object)
      return Center(
        child: Text("Ítem encontraado"),
      );*/

    return callback(object);
  }
}
