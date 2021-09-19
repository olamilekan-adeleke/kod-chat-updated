import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kod_chat/cores/constants/color.dart';
import 'package:kod_chat/cores/utils/emums.dart';
import 'package:kod_chat/features/auth/model/user_details_model.dart';
import 'package:kod_chat/features/search/controllers/search_controllers.dart';
import 'package:kod_chat/features/search/views/widgets/empty_search_widget.dart';
import 'package:kod_chat/features/search/views/widgets/serach_item_widget.dart';

class SearchResultListWidget extends StatefulWidget {
  const SearchResultListWidget({Key? key}) : super(key: key);

  @override
  State<SearchResultListWidget> createState() => _SearchResultListWidgetState();
}

class _SearchResultListWidgetState extends State<SearchResultListWidget> {
  late ScrollController _controller = ScrollController();
  static final SearchController searchController = Get.find<SearchController>();

  @override
  void initState() {
    _controller.addListener(() => _scrollListener());
    super.initState();
  }

  void _scrollListener() {
    if (_controller.position.pixels >= _controller.position.maxScrollExtent &&
        searchController.controllerState.value != ControllerState.busy &&
        searchController.hasMore) {
      debugPrint(_controller.position.atEdge.toString());
      searchController.searchByQuery(ignoreRepeat: false);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (searchController.searchResults.isEmpty) {
      return EmptySearchWidget();
    }

    return Obx(() {
      return ListView.separated(
        controller: _controller,
        physics: const AlwaysScrollableScrollPhysics(),
        separatorBuilder: (_, __) => const Divider(color: kcGrey400),
        itemCount: searchController.searchResults.length,
        itemBuilder: (_, int index) {
          final UserDetailsModel user = searchController.searchResults[index];

          return SearchItemWidget(user);
        },
      );
    });
  }
}
