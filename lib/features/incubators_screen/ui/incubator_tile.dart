import 'package:flutter/material.dart';
import 'package:mobile_app/core/helpers/extensions.dart';
import 'package:mobile_app/core/routing/routes.dart';
import 'package:mobile_app/core/theming/colors.dart';
import 'package:mobile_app/core/theming/styles.dart';
import 'package:mobile_app/features/incubators_screen/model/incubator_model.dart';

class IncubatorTile extends StatefulWidget {
  const IncubatorTile({
    super.key,
    required this.incubator,
  });

  final Incubator incubator;

  @override
  State<IncubatorTile> createState() => _IncubatorTileState();
}

class _IncubatorTileState extends State<IncubatorTile> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            margin: const EdgeInsets.only(bottom: 16),
            decoration: BoxDecoration(
              border: Border.all(
                color: widget.incubator.status == 'reserved'
                    ? ColorsManager.mainGreen
                    : ColorsManager.gray.withOpacity(0.8),
                width: 2,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            child: ListTile(
              title: Text(
                widget.incubator.name,
                style: TextStyles.bigTileTitle,
              ),
              onTap: widget.incubator.status == 'available'
                  ? null
                  : () {
                      context.pushNamed(Routes.monitoringScreen);
                    },
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 15, bottom: 20),
          child: Switch(
            value: widget.incubator.status == 'reserved',
            onChanged: (value) {
              setState(() {
                widget.incubator.switchState();
              });
            },
            activeTrackColor: ColorsManager.mainGreen,
          ),
        ),
      ],
    );
  }
}
