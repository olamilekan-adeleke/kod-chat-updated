import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kod_chat/cores/components/custom_circular_progress_indicator.dart';
import 'package:kod_chat/cores/components/custom_scaffold_widget.dart';
import 'package:kod_chat/cores/components/search_text_field.dart';
import 'package:kod_chat/cores/utils/custom_sizer_utils.dart';
import 'package:kod_chat/cores/utils/emums.dart';
import 'package:kod_chat/features/search/controllers/search_controllers.dart';
import 'package:kod_chat/features/search/views/widgets/init_search_widget.dart';
import 'package:kod_chat/features/search/views/widgets/error_search_Widget.dart';
import 'package:kod_chat/features/search/views/widgets/search_result_list.dart';

class SearchHomeScreen extends StatelessWidget {
  const SearchHomeScreen({Key? key}) : super(key: key);

  static final SearchController searchController = Get.find<SearchController>();

  @override
  Widget build(BuildContext context) {
    return scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: sizerSp(20)),
          searchTextField(
            hint: 'Search for users',
            textEditingController: searchController.searchTextEditingController,
            callback: () => searchController.searchByQuery(),
          ),
          SizedBox(height: sizerSp(10)),
          Expanded(
            child: Obx(
              () {
                if (searchController.controllerState.value ==
                    ControllerState.init) {
                  return InitSearchWidget();
                } else if (searchController.controllerState.value ==
                    ControllerState.error) {
                  return ErrorSearchWidget();
                } else if (searchController.controllerState.value ==
                        ControllerState.busy &&
                    searchController.searchResults.isEmpty) {
                  return loadingIndicator(
                    text: "Searching for user \nPlease Wait",
                  );
                }

                return Stack(
                  children: <Widget>[
                    SearchResultListWidget(),
                    searchController.controllerState.value ==
                                ControllerState.busy &&
                            searchController.searchResults.isNotEmpty
                        ? Align(
                            alignment: Alignment.bottomCenter,
                            child: loadingMoreWidget(),
                          )
                        : Container(),
                  ],
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
