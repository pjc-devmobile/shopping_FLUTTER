import 'package:flutter/widgets.dart';
import 'package:shopping/models/category_list_item.model.dart';
import 'package:shopping/ui/shared/widgets/category/category_card.widget.dart';
import 'package:shopping/ui/shared/widgets/shared/loader_list.widget.dart';

class CategoryList extends StatelessWidget {
  final List<CategoryListItemModel> categories;

  const CategoryList({@required this.categories});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      child: LoaderList(
        object: categories,
        callback: list,
      ),
    );
  }

  Widget list() {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: categories.length,
      itemBuilder: (context, index) {
        CategoryListItemModel item = categories[index];

        return Padding(
          padding: EdgeInsets.all(5),
          child: CategoryCard(
            item: item,
          ),
        );
      },
    );
  }
}
