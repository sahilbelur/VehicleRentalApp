import 'package:flutter/material.dart';
import '../../core/resources/responsive.dart';
import '../../core/resources/string.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/bottom_button_layout.dart';
import '../vehicle_type_sample_data.dart';

class SpecificModelScreen extends StatefulWidget {
  final int? vehicleTypeId;

  const SpecificModelScreen({super.key, required this.vehicleTypeId});

  @override
  State<SpecificModelScreen> createState() => _SpecificModelScreenState();
}

class _SpecificModelScreenState extends State<SpecificModelScreen> {
  late BuildContext appContext;
  late CustomButtons customButtons;
  late var modelsToShow;

  int? selectedModelId;

  @override
  Widget build(BuildContext context) {
    appContext = context;
    _initialiseViews();

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: appContext.widthPct(1),
          vertical: appContext.heightPct(4),
        ),
        child: _mainView(),
      ),
      bottomNavigationBar: bottomButtonLayout(
        context: appContext,
        customButtons: customButtons,
        onClick: selectedModelId == null ? null : () {},
      ),
    );
  }

  void _initialiseViews() {
    customButtons = CustomButtons(appContext);
    modelsToShow =
        vehicleModels
            .where((model) => model.typeId == widget.vehicleTypeId)
            .toList();
  }

  Widget _mainView() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppStrings.modelTitle,
          style: TextStyle(
            fontSize: appContext.textLargeTitle_20(),
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: appContext.heightPct(2)),
        Expanded(child: _vehicleListing()),
      ],
    );
  }

  Widget _vehicleListing() {
    return ListView.builder(
        itemCount: modelsToShow.length,
        itemBuilder: (_, index) {
          final model = modelsToShow[index];
          return Card(
            margin: EdgeInsets.symmetric(vertical: appContext.heightPct(1)),
            child: ListTile(
              leading: Image.asset(model.image, width: 50, height: 50),
              title: Text(model.name),
              trailing: Radio<int>(
                value: model.typeId,
                groupValue: selectedModelId,
                onChanged: (value) {
                  setState(() => selectedModelId = value);
                },
              ),
              onTap: () {
                setState(() => selectedModelId = model.typeId);
              },
            ),
          );
        },
    );
  }
}
