import 'package:flutter/material.dart';
import 'package:foode/controllers/home_controller.dart';
import 'package:foode/view/widgets/custom_textform.dart';
import 'package:provider/provider.dart';

class ProductListPage extends StatefulWidget {
  const ProductListPage({Key? key}) : super(key: key);

  @override
  State<ProductListPage> createState() => _ProductListPageState();
}

class _ProductListPageState extends State<ProductListPage> {
  final TextEditingController search = TextEditingController();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<HomeController>()
        ..getProduct(isLimit: false)
        ..getCategory(isLimit: false)
        ..getUser();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final state = context.watch<HomeController>();
    final event = context.read<HomeController>();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Products"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                  child: CustomTextFrom(
                    controller: search,
                    label: "Search",
                    onChange: (s) {
                      // event.searchCategory(s);
                    },
                    hintext: '',
                  ),
                ),
                IconButton(
                    onPressed: () {
                      event.setFilterChange();
                    },
                    icon: Icon(Icons.menu))
              ],
            ),
          ),
          state.setFilter || (state.selectIndex == -1)
              ? const SizedBox.shrink()
              : Container(
                  margin: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    color: Colors.pinkAccent,
                    borderRadius: BorderRadius.circular(24),
                    border: Border.all(color: Colors.pinkAccent),
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                  child:
                      Text(state.listOfCategory[state.selectIndex].name ?? ""),
                ),
          Expanded(
            child: state.setFilter
                ? Wrap(
                    children: [
                      for (int i = 0; i < state.listOfCategory.length; i++)
                        InkWell(
                          onTap: () {
                            event.changeIndex(i);
                          },
                          child: Container(
                            margin: const EdgeInsets.all(6),
                            decoration: BoxDecoration(
                              color: state.selectIndex == i
                                  ? Colors.pinkAccent
                                  : Colors.white,
                              borderRadius: BorderRadius.circular(24),
                              border: Border.all(color: Colors.pinkAccent),
                            ),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 6),
                            child: Text(state.listOfCategory[i].name ?? ""),
                          ),
                        )
                    ],
                  )
                : ListView.builder(
                    shrinkWrap: true,
                    itemCount:
                        context.watch<HomeController>().listOfProduct.length,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.all(16),
                        width: double.infinity,
                        height: 90,
                        color: Colors.pinkAccent,
                        child: Row(
                          children: [
                            state.listOfProduct[index].image == null
                                ? const SizedBox.shrink()
                                : Image.network(
                                    state.listOfProduct[index].image ?? "",
                                    height: 64,
                                    width: 64,
                                  ),
                            Column(
                              children: [
                                Text(state.listOfProduct[index].name ?? ""),
                                Text(state.listOfProduct[index].desc ?? ""),
                              ],
                            ),
                            const Spacer(),
                            Text(state.listOfProduct[index].price.toString())
                          ],
                        ),
                      );
                    }),
          )
        ],
      ),
    );
  }
}
