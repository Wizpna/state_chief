import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.nigerianState.isEmpty) {
        return const Center(
          child: Text("No date"),
        );
      }
      return Scaffold(
        body: ListView(
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(10.0),
                  topLeft: Radius.circular(10.0),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 40,
                    ),
                    Container(
                      width: double.infinity,
                      height: 50.0,
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7.0),
                        border: Border.all(color: Colors.blueGrey),
                      ),
                      child: DropdownButton(
                        underline: const SizedBox(),
                        isExpanded: true,
                        hint: controller.selectedState.value.isEmpty
                            ? const Text("Select state")
                            : Text(
                                controller.selectedState.value,
                                style: const TextStyle(color: Colors.black),
                              ),
                        items:
                            controller.nigerianState.map((userSelectedState) {
                          return DropdownMenuItem(
                            value: userSelectedState,
                            child: Text(userSelectedState),
                          );
                        }).toList(),
                        onChanged: (value) {
                          controller.getStateSelected(value);
                        },
                      ),
                    ),
                    controller.isSelectedState.value == false
                        ? const SizedBox()
                        : const SizedBox(
                            height: 10.0,
                          ),
                    controller.isSelectedState.value == false
                        ? const SizedBox()
                        : Container(
                            width: double.infinity,
                            height: 50.0,
                            padding:
                                const EdgeInsets.symmetric(horizontal: 10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(7.0),
                              border: Border.all(color: Colors.blueGrey),
                            ),
                            child: DropdownButton(
                              underline: const SizedBox(),
                              isExpanded: true,
                              hint: controller.selectedLGA.value.isEmpty
                                  ? const Text("Select LGA")
                                  : Text(
                                      controller.selectedLGA.value,
                                      style: const TextStyle(
                                          color: Colors.black),
                                    ),
                              items: controller.lgaList.map((state) {
                                return DropdownMenuItem(
                                  value: state,
                                  child: Text(state),
                                );
                              }).toList(),
                              onChanged: (value) {
                                controller.getLGASelected(value);
                              },
                            ),
                          ),
                    controller.isSelectedLGA.value == false
                        ? const SizedBox()
                        : const SizedBox(
                            height: 10.0,
                          ),
                    controller.isSelectedLGA.value == false
                        ? const SizedBox()
                        : ListView.builder(
                            shrinkWrap: true,
                            itemCount: controller.ezeList.length,
                            itemBuilder: (context, index) {
                              return Column(
                                children: [
                                  Container(
                                    width: double.infinity,
                                    height: 50.0,
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10),
                                    decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.circular(7.0),
                                      border:
                                          Border.all(color: Colors.blueGrey),
                                    ),
                                    child: ListTile(
                                      contentPadding: EdgeInsets.zero,
                                      title: Text(controller.ezeList[index]
                                          .toString()),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10.0,
                                  ),
                                ],
                              );
                            },
                          ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}
