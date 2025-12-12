import 'package:flutter/material.dart';
import '../../core/resources/responsive.dart';
import '../../core/resources/string.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/bottom_button_layout.dart';
import '../sample_data/vehicle_type_sample_data.dart';

class SpecificModelScreen extends StatefulWidget {
  final int? vehiclevehicleTypeId;

  const SpecificModelScreen({super.key, required this.vehiclevehicleTypeId});

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
      body: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: appContext.widthPct(1),
              vertical: appContext.heightPct(8),
            ),
            child: _mainView(),
          ),
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
            .where((model) => model.vehicleTypeId == widget.vehiclevehicleTypeId)
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
            margin: EdgeInsets.symmetric(vertical: appContext.heightPct(1), horizontal: appContext.widthPct(2)),
            child: ListTile(
              contentPadding: EdgeInsets.symmetric(
                vertical: appContext.heightPct(2),
                horizontal: appContext.widthPct(2),
              ),
              leading: Container(
                width: appContext.widthPct(20),
                height: appContext.widthPct(20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image: AssetImage(model.image),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              title: Text(
                  model.name,
                  style: TextStyle(fontSize: appContext.textNormal_16()),
              ),
              trailing: Radio<int>(
                value: model.id,
                groupValue: selectedModelId,
                onChanged: (value) {
                  setState(() => selectedModelId = value);
                },
              ),
              onTap: () {
                setState(() => selectedModelId = model.id);
              },
            ),
          );
        },
    );
  }
}
