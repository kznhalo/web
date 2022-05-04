import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:kozarni_ecome/controller/home_controller.dart';
import 'package:kozarni_ecome/data/constant.dart';
import 'package:kozarni_ecome/model/hive_purchase.dart';

class OrderHistory extends StatelessWidget {
  const OrderHistory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HomeController controller = Get.find();
    final size = MediaQuery.of(context).size;
    return ValueListenableBuilder(
      valueListenable: Hive.box<HivePurchase>(purchaseBox).listenable(),
      builder: (context, Box<HivePurchase> box, widget) {
        debugPrint("*************${box.values.length}*****");
        return box.isNotEmpty
            ? SizedBox(
                height: size.height,
                width: size.width,
                child: ListView(
                  children: box.values.map((purchase) {
                    return Obx(() {
                      return Dismissible(
                        key: Key(purchase.id),
                        background: Container(
                          color: Colors.black12,
                        ),
                        onDismissed: (direction) {
                          box.delete(purchase.id);
                        },
                        direction: DismissDirection.startToEnd,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ExpansionPanelList(
                              expansionCallback: (index, isExpanded) =>
                                  controller.setPurchaseId(purchase.id),
                              children: [
                                ExpansionPanel(
                                  isExpanded:
                                      controller.purchaseId == purchase.id,
                                  canTapOnHeader: true,
                                  headerBuilder: (context, isExpand) {
                                    return ListTile(
                                      title: Text(
                                          // "Number of Order = ${purchase.items.length} ခု",
                                          "နေ့ရက် : ${purchase.dateTime.day}/${purchase.dateTime.month}/${purchase.dateTime.year}",
                                      style: TextStyle(fontSize: 14),),
                                      trailing: Text(
                                          "စုစုပေါင်း ${purchase.totalPrice} ကျပ် "),
                                    );
                                  },
                                  body: Padding(
                                    padding: const EdgeInsets.only(left: 10, right: 10),
                                    child: Column(
                                      children: [
                                        SizedBox(
                                          height: purchase.items.length * 50,
                                          width: size.width,
                                          child: ListView.builder(
                                            padding: EdgeInsets.all(0),
                                            itemCount: purchase.items.length,
                                            itemBuilder: (_, o) => Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "${o + 1}. ${controller.getItem(
                                                          purchase.items[o]
                                                              .toString()
                                                              .split(',')[1],
                                                        ).name}",
                                                    style: TextStyle(fontSize: 12),
                                                  ),
                                                  Text(
                                                    "${purchase.items[o].toString().split(',')[1]}",
                                                    style: TextStyle(fontSize: 12),
                                                    overflow: TextOverflow.ellipsis,
                                                    maxLines: 1,
                                                  ),
                                                  SizedBox(
                                                    width: 50,
                                                  ),
                                                  Expanded(
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment.start,
                                                      children: [
                                                        Text(
                                                          "${purchase.items[o].toString().split(',')[2]}",
                                                          style:
                                                              TextStyle(fontSize: 12),
                                                        ),
                                                        Text(
                                                          "${purchase.items[o].toString().split(',')[3]}",
                                                          style:
                                                              TextStyle(fontSize: 12),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                  Text(
                                                    "${purchase.items[o].toString().split(',').last} x  ${purchase.items[o].toString().split(',')[4]} ထည်",
                                                    style: TextStyle(fontSize: 12),
                                                  ),
                                                ],
                                              ),

                                            ),


                                          ),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: [

                                            Text(
                                              "Qty : ${purchase.items.length}",
                                              style: TextStyle(color: Colors.black,
                                                  fontSize: 14),),
                                            Text(
                                              "စုစုပေါင်း ${purchase.totalPrice} ကျပ်",
                                              style: TextStyle(color: Colors.black,
                                                  fontSize: 14),),
                                            SizedBox(
                                              height: 30,
                                            )
                                          ],
                                        ),
                                        Text("(${purchase.deliveryTownshipInfo[0]} ပို့ခ ပေါင်းပြီး)",
                                          style: TextStyle(color: Colors.black,
                                              fontSize: 12),),
                                      ],
                                    ),
                                  ),
                                ),
                              ]),
                        ),
                      );
                    });
                  }).toList(),
                ),
              )
            : Center(
                child: Text("No order history."),
              );
      },
    );
  }
}
