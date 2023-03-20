import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sv/view_models/app_view_model.dart';
import 'package:sv/views/bottom_sheets/delete_bottom_sheet_view.dart';
import 'package:sv/views/bottom_sheets/settings_bottom_sheet_view.dart';

class HeaderView extends StatelessWidget {
  const HeaderView({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AppViewModel>(builder: (context, viewModel, child) {
      return Row(
        children: [
          Expanded(
            flex: 3,
            child: Container(
              margin: const EdgeInsets.only(left: 15),
              child: Column(
                children: [
                  Expanded(
                    flex: 1,
                    child: Align(
                      alignment: Alignment.bottomLeft,
                      child: FittedBox(
                        fit: BoxFit.fitHeight,
                        child: Text(
                          "Welcome back,",
                          style: TextStyle(
                              fontSize: 23,
                              fontWeight: FontWeight.w400,
                              color: viewModel.H4),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: FittedBox(
                        fit: BoxFit.fitHeight,
                        child: Text(
                          viewModel.username,
                          style: TextStyle(
                              fontSize: 42,
                              fontWeight: FontWeight.bold,
                              color: viewModel.H4),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          //Trash icon
          Expanded(
            flex: 1,
            child: InkWell(
              onTap: () {
                viewModel.bottomSheetBuilder(
                    const DeleteBottomSheetView(), context);
              },
              child: Icon(
                Icons.delete,
                color: viewModel.H3,
                size: 40,
              ),
            ),
          ),
          // Setting icon
          Expanded(
            flex: 1,
            child: InkWell(
              onTap: () {
                viewModel.bottomSheetBuilder(
                    const SettingsBottomSheetView(), context);
              },
              child: Icon(
                Icons.settings,
                color: viewModel.H3,
                size: 40,
              ),
            ),
          ),
        ],
      );
    });
  }
}
