import 'package:flutter/material.dart';
import 'package:marvel_app/constants/constants.dart';
import 'package:marvel_app/data/data.dart';
import 'package:marvel_app/models/models.dart';
import 'package:marvel_app/widgets/widgets.dart';
import 'package:provider/provider.dart';

class CreatorScreen extends StatefulWidget {
  final String? type;

  const CreatorScreen({Key? key, this.type}) : super(key: key);
  @override
  _CreatorScreenState createState() => _CreatorScreenState();
}

class _CreatorScreenState extends State<CreatorScreen> {
  late CurrentTheme currentTheme;

  @override
  void initState() {
    super.initState();
    currentTheme = Provider.of<CurrentTheme>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    const double _crossAxisSpacing = 15, _aspectRatio = 0.75;
    const int _crossAxisCount = 2;
    final double cardWidth =
        (size.width - ((_crossAxisCount - 1) * _crossAxisSpacing)) /
            _crossAxisCount;
    final double cardHeight = size.width * _aspectRatio;
    return SafeArea(
      child: Scaffold(
        backgroundColor: currentTheme.isDark ? CustomColors.darkBg : CustomColors.lightBg,
        body: Body(
          type: widget.type,
          title: TitleText(widget.type!.toUpperCase()),
          scrollingChild: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: FutureBuilder(
              future: fetchData(widget.type),
              builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                while (!snapshot.hasData) {
                  return Loading(isDark: currentTheme.isDark);
                }
                final dynamic futureData = snapshot.data;
                final dynamic data = futureData['data'];
                final dynamic results = data['results'];
                return GridView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: data['count'],
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: _crossAxisCount,
                      childAspectRatio: _aspectRatio),
                  itemBuilder: (context, index) {
                    final Creator creator = Creator.fromJson(results[index]);
                    final String imageUrl = convertImageUrl(creator.thumbnail);
                    return CommonCard(
                      name: creator.fullName,
                      imageUrl: imageUrl,
                      tag: '$imageUrl-$index',
                      width: cardWidth,
                      height: cardHeight,
                    );
                  },
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
