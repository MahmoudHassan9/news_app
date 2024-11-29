import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:news_app/presentation/screens/home/tabs/articels/view/articles_view.dart';
import 'package:news_app/presentation/screens/home/tabs/sources/widgets/source_widget.dart';

import '../../../../core/app_colors.dart';
import '../../../../data/models/articles_resposne/Source.dart';
import '../category_details.dart';

class SourcesTab extends StatefulWidget {
  const SourcesTab({super.key, required this.sources});

  final List<Source> sources;

  @override
  State<SourcesTab> createState() => _SourcesTabState();
}

class _SourcesTabState extends State<SourcesTab> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DefaultTabController(
          length: widget.sources.length,
          child: TabBar(
            labelPadding: EdgeInsets.zero,
            onTap: (index) {
              selectedIndex = index;
              setState(() {});
            },
            isScrollable: true,
            dividerColor: Colors.transparent,
            indicatorColor: Colors.transparent,
            tabAlignment: TabAlignment.start,
            tabs: widget.sources
                .map(
                  (source) => SourceWidget(
                    source: source,
                    isSelected: selectedIndex == widget.sources.indexOf(source),
                  ),
                )
                .toList(),
          ),
        ),
        ArticlesView(
          source: widget.sources[selectedIndex],
        ),
      ],
    );
  }
}
