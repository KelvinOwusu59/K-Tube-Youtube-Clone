import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class Filters extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
        final ScrollController controller = ScrollController();
double width = MediaQuery.of(context).size.width;
    return  Row(
      children: [
        Container(
          width: width*0.2,
          child: Center(
                      child: Container(
                        width: 50, // Adjust the width of each item as needed
                        height: 30,
                        margin: EdgeInsets.symmetric(horizontal: 8),
                        decoration: BoxDecoration(
                          color: Color.fromARGB(115, 214, 214, 214),
                          border: Border.all(width: 1),borderRadius: BorderRadius.circular(6)),
                        child: Center(child: const Text('All'))
                      
                      ),
                    )
        ),
        Expanded(
          child: SizedBox(
            child: ScrollConfiguration(
              behavior: MyCustomScrollBehavior(),
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 20, // Change this to your desired item count
                  controller: controller,
                  itemBuilder: (context, index) {
                    return Center(
                      child: Container(
                        width: 50, // Adjust the width of each item as needed
                        height: 30,
                        margin: EdgeInsets.symmetric(horizontal: 8),
                        decoration: BoxDecoration(
                          color: Color.fromARGB(115, 214, 214, 214),
                          border: Border.all(width: 1),borderRadius: BorderRadius.circular(6)),
                        child: Container(child: Center(child: Text('$index'))),
                      
                      ),
                    );
                  },
                ),
            ),
          ),
        ),
      ],
    );
    
  }
}

    class MyCustomScrollBehavior extends MaterialScrollBehavior {
      // Override behavior methods and getters like dragDevices
      @override
      Set<PointerDeviceKind> get dragDevices => { 
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
        // etc.
      };
    }