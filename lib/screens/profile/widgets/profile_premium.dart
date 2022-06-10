import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:projekt_broker_frontend/constants/frontend/ui_theme.dart';
import 'package:projekt_broker_frontend/screens/profile/profile_provider.dart';
import 'package:projekt_broker_frontend/widgets/draggable_overview.dart';
import 'package:projekt_broker_frontend/widgets/rounded_button.dart';
import 'package:provider/provider.dart';

class ProfilePremium extends StatelessWidget {
  const ProfilePremium({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Consumer<ProfileProvider>(
      builder: (context, profileProvider, _) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Premium",
            style: theme.textTheme.bodyText1,
          ),
          profileProvider.premium
              ? Text(
                  "Sie sind Premiumkunde",
                  style: theme.textTheme.bodyText2,
                )
              : Text(
                  "Sie sind kein Premiumkunde. Werden Sie Premiumkunde um keine Transaktionskosten mehr zu bezahlen.",
                  style: theme.textTheme.bodyText2,
                ),
          SizedBox(
            height: 10,
          ),
          Center(
            child: RoundedButton(
              width: double.infinity,
              label: Text(
                "Premium ${profileProvider.premiumButtonLabel}",
                style: theme.textTheme.headline5?.copyWith(
                  color: UiTheme.textColorWhite,
                ),
              ),
              onPressed: () => showModalBottomSheet(
                context: context,
                builder: (context) => DraggableOverview(
                  header: "Premium ${profileProvider.premiumButtonLabel}",
                  inizialSize: profileProvider.premium
                      ? (500 / MediaQuery.of(context).size.height)
                      : (530 / MediaQuery.of(context).size.height),
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 18.0,
                      top: 10.0,
                      bottom: 10.0,
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 18.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Monatliche Kosten",
                                style: theme.textTheme.bodyText1,
                              ),
                              Text(
                                "${profileProvider.premiumPrice.toStringAsFixed(2)}€",
                                style: theme.textTheme.bodyText2,
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 10.0,
                          ),
                          child: Divider(
                            color: UiTheme.primaryGradientEnd.withOpacity(0.5),
                            height: 3,
                            thickness: 1,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 18.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Flexible(
                                child: Text(
                                  profileProvider.premiumOverviewText,
                                  style: theme.textTheme.bodyText2,
                                  softWrap: true,
                                  overflow: TextOverflow.clip,
                                ),
                              ),
                              Checkbox(
                                value: false,
                                //TODO save state of Checkbox
                                onChanged: (value) {},
                              )
                            ],
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(
                            horizontal: 15.0,
                            vertical: 20.0,
                          ),
                          child: RoundedButton(
                            width: double.infinity,
                            label: Text(
                              profileProvider.premiumButtonLabel.replaceFirst("k", "K"),
                              style: theme.textTheme.headline5?.copyWith(
                                color: UiTheme.textColorWhite,
                              ),
                            ),
                            onPressed: () {
                              //TODO check if CheckBox is checked
                              profileProvider.setPremiumStatus = !profileProvider.premium;
                              Navigator.of(context).pop();
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
