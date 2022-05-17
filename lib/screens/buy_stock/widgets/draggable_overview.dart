import 'package:flutter/material.dart';

class DraggableOverview extends StatelessWidget {
  const DraggableOverview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: (325 / MediaQuery.of(context).size.height),
      maxChildSize: 0.9,
      minChildSize: 0.3,
      expand: false,
      builder: (context, controller) {
        return Container(
          color: Colors.black45,
          child: Material(
            elevation: 10,
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(20),
            ),
            color: Colors.white,
            child: SingleChildScrollView(
              controller: controller,
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 18.0,
                  right: 18.0,
                ),
                // content of the scrollableSheet
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // line on top of the Sheet
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Container(
                          width: 40,
                          color: Colors.grey[400],
                          height: 2,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
