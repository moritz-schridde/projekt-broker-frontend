import 'package:flutter/material.dart';
import 'package:projekt_broker_frontend/constants/frontend/ui_theme.dart';

class DraggableOverview extends StatelessWidget {
  final Widget child;
  final String header;
  final double inizialSize;

  DraggableOverview({
    Key? key,
    required this.child,
    required this.header,
    required this.inizialSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: inizialSize,
      maxChildSize: inizialSize,
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
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 18.0,
                      left: 18.0,
                      right: 18.0,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          header,
                          style: Theme.of(context).textTheme.headline5,
                        ),
                        InkWell(
                          child: Icon(
                            Icons.close,
                          ),
                          onTap: () => Navigator.pop(context),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 10.0,
                    ),
                    child: Divider(
                      color: UiTheme.primaryGradientStart,
                      height: 3,
                      thickness: 2,
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
