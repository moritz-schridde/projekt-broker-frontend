import 'package:flutter/material.dart';

class DraggableOverview extends StatelessWidget {
  final Widget child;

  DraggableOverview({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: (550 / MediaQuery.of(context).size.height),
      maxChildSize: (550 / MediaQuery.of(context).size.height),
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
                  child,
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
