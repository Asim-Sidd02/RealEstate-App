import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  var properties = RxList([
    {"name": "Property 1", "image": "assets/property1.jpeg"},
    {"name": "Property 2", "image": "assets/property2.jpeg"},
    {"name": "Property 3", "image": "assets/property3.jpeg"},
    {"name": "Property 4", "image": "assets/property4.jpeg"},
    {"name": "Property 5", "image": "assets/property5.jpeg"},
  ]);
}


class HomePage extends StatelessWidget {
  final HomeController _controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Real Estate"),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
        TextField(
        decoration: InputDecoration(
        hintText: "Search",
          prefixIcon: Icon(Icons.search),
          suffixIcon: IconButton(
            icon: Icon(Icons.mic),
            onPressed: () {
              // Handle mic button press
            },
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),

      Text(
              "Properties",
              style: Theme.of(context).textTheme.headline4,
            ),

            const SizedBox(height: 16.0),
            Expanded(
              child: Obx(
                    () => GridView.builder(
                  itemCount: _controller.properties.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1.5,
                    crossAxisSpacing: 16.0,
                    mainAxisSpacing: 16.0,
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    final property = _controller.properties[index];
                    return GestureDetector(
                      onTap: () => Get.toNamed('/property', arguments: property),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16.0),
                          image: DecorationImage(
                            image: AssetImage(property["image"]!),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: double.infinity,
                              padding: EdgeInsets.all(16.0),
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.7),
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(16.0),
                                  bottomRight: Radius.circular(16.0),
                                ),
                              ),
                              child: Text(
                                property["name"]!,
                                style: Theme.of(context).textTheme.headline6,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
