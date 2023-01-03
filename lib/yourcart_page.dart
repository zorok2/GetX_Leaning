import 'package:container_test/Product.dart';
import 'package:container_test/ProductPage.dart';
import 'package:container_test/controllers/youCart_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class YourCartPage extends StatefulWidget {
  const YourCartPage({Key? key}) : super(key: key);

  @override
  State<YourCartPage> createState() => _YourCartPageState();
}

class _YourCartPageState extends State<YourCartPage> {
  var cbvisible = false;
  var isclickdelete = false;
  final controllerCart = Get.put(Product());
  final YourCartController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    print('rebuild yourcart');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your cart'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Container(
              height: 80,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.25),
                        blurRadius: 6,
                        offset: Offset(2, 2))
                  ]),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Total',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                              color: Colors.purple.shade300,
                              borderRadius: BorderRadius.circular(15)),
                          child: Obx(() {
                            return Text(
                              '\$ ${controller.getTotalPrice()}',
                              style: const TextStyle(color: Colors.white),
                            );
                          }),
                        ),
                        Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                              color: Colors.purple.shade300,
                              borderRadius: BorderRadius.circular(15)),
                          child: const Text(
                            'ORDER NOW',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              isclickdelete = !isclickdelete;
                              controller.deleteProductChecked();
                              ProductPage.refreshIsdelected();
                            });
                          },
                          child: Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                                color:
                                    isclickdelete ? Colors.red : Colors.white,
                                border:
                                    Border.all(width: 2, color: Colors.red)),
                            child: Text(
                              isclickdelete == false
                                  ? 'DELETE'
                                  : 'DELETE SELECTED',
                              style: TextStyle(
                                  color: isclickdelete == false
                                      ? Colors.red
                                      : Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Obx(() {
              return ListView.builder(
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.symmetric(vertical: 5),
                    alignment: Alignment.center,
                    height: 100,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black.withOpacity(0.25),
                              blurRadius: 6,
                              offset: Offset(2, 2))
                        ]),
                    child: ListTile(
                      leading: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Obx(() {
                            return Visibility(
                              visible: isclickdelete,
                              child: Checkbox(
                                value: controller
                                    .listProduct[index].isDeleted.value,
                                onChanged: (value) {
                                  controller.listProduct[index]
                                      .changeStateChecked(value!);
                                },
                              ),
                            );
                          }),
                          Container(
                            padding: const EdgeInsets.all(18),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.purple.shade300,
                            ),
                            child: Text(
                              '\$ ${controller.listProduct.elementAt(index).price}',
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14),
                            ),
                          ),
                        ],
                      ),
                      title: Text(
                        controller.listProduct[index].name!,
                        style: TextStyle(
                            color: Colors.black87, fontWeight: FontWeight.bold),
                      ),
                      subtitle: Obx(() {
                        return Text(
                          'total: \$ ${controller.getTotalItem(controller.listProduct[index])}',
                          style: TextStyle(
                              color: Colors.black38,
                              fontWeight: FontWeight.bold),
                        );
                      }),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                              onPressed: () {
                                controller.listProduct[index].decrementAmount();
                              },
                              icon: const Icon(Icons.exposure_minus_1)),
                          Obx(() {
                            return Text(
                              '${controller.listProduct[index].amount1}x',
                              style: const TextStyle(
                                  color: Colors.black54,
                                  fontWeight: FontWeight.bold),
                            );
                          }),
                          IconButton(
                              onPressed: () {
                                controller.listProduct[index].incrementAmount();
                              },
                              icon: const Icon(Icons.add))
                        ],
                      ),
                    ),
                  );
                },
                itemCount: controller.listProduct.length,
                shrinkWrap: true,
              );
            })
          ],
        ),
      ),
    );
  }
}
// Row(
// children: [
// IconButton(
// onPressed: () {}, icon: Icon(Icons.exposure_minus_1)),
// Text(
// '3x',
// style: TextStyle(
// color: Colors.black54, fontWeight: FontWeight.bold),
// ),
// IconButton(
// onPressed: () {}, icon: Icon(Icons.plus_one_outlined))
// ],
// )
