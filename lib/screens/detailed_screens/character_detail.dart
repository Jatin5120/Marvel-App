import 'package:flutter/material.dart';
import 'package:marvel_app/constants/colors.dart';
import 'package:marvel_app/data/data.dart';
import 'package:marvel_app/models/characters_model.dart';
import 'package:marvel_app/widgets/widgets.dart';
import 'package:provider/provider.dart';

class CharacterDetail extends StatefulWidget {
  @required
  final Character? character;
  final String? imageUrl;
  final String? tag;

  const CharacterDetail({Key? key, this.character, this.imageUrl, this.tag})
      : super(key: key);

  @override
  _CharacterDetailState createState() => _CharacterDetailState();
}

class _CharacterDetailState extends State<CharacterDetail> {
  late CurrentTheme _currentTheme;
  Color? _currentColor;
  int? _detailsLength;

  @override
  void initState() {
    super.initState();
    _currentTheme = Provider.of<CurrentTheme>(context, listen: false);
    _currentColor =
        _currentTheme.isDark ? CustomColors.white : CustomColors.black;
    _detailsLength = 0;
  }

  void _calculateDetailsLength() {
    _detailsLength = widget.character!.comics!.returned! +
        widget.character!.events!.returned! +
        widget.character!.series!.returned! +
        widget.character!.stories!.returned!;
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    _calculateDetailsLength();
    return SafeArea(
      child: Scaffold(
        backgroundColor: CustomColors.frostWhite,
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              backgroundColor: _currentTheme.isDark
                  ? CustomColors.darkBg
                  : CustomColors.lightBg,
              title: TitleText(widget.character!.name!),
              floating: true,
              expandedHeight: size.width / 1.1,
              flexibleSpace: Hero(
                tag: widget.tag!,
                transitionOnUserGestures: true,
                child: (widget.imageUrl == '' || checkIfImage(widget.imageUrl!))
                    ? ShowNoImage(
                        model: widget.character,
                      )
                    : HeaderImage(
                        imageUrl: widget.imageUrl,
                        width: size.width,
                        backFit: BoxFit.fitWidth,
                        foreFit: BoxFit.fitHeight,
                      ),
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 30.0),
                decoration: BoxDecoration(
                  color: _currentTheme.isDark
                      ? CustomColors.darkBg
                      : CustomColors.lightBg,
                  borderRadius:
                      const BorderRadius.vertical(top: Radius.circular(40.0)),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    widget.character!.comics!.returned != 0
                        ? SubHeader(
                            'Comics',
                            currentColor: _currentColor,
                          )
                        : SizedBox.shrink(),
                    widget.character!.comics!.returned != 0
                        ? CardList(widget.character!.comics!.returned!)
                        : SizedBox.shrink(),
                    widget.character!.events!.returned != 0
                        ? SubHeader(
                            'Events',
                            currentColor: _currentColor,
                          )
                        : SizedBox.shrink(),
                    widget.character!.events!.returned != 0
                        ? CardList(widget.character!.events!.returned!)
                        : SizedBox.shrink(),
                    widget.character!.series!.returned != 0
                        ? SubHeader(
                            'Series',
                            currentColor: _currentColor,
                          )
                        : SizedBox.shrink(),
                    widget.character!.series!.returned != 0
                        ? CardList(widget.character!.series!.returned!)
                        : SizedBox.shrink(),
                    widget.character!.stories!.returned != 0
                        ? SubHeader(
                            'Stories',
                            currentColor: _currentColor,
                          )
                        : SizedBox.shrink(),
                    widget.character!.stories!.returned != 0
                        ? CardList(widget.character!.stories!.returned!)
                        : SizedBox.shrink(),
                    if (_detailsLength == 0) ShowEmptyDetails()
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ShowNoImage extends StatelessWidget {
  final dynamic? model;

  const ShowNoImage({Key? key, this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: Container(
            color: CustomColors.white,
            child: Center(
              child: Image.network(
                convertImageUrl(model.thumbnail),
                height: MediaQuery.of(context).size.height,
                fit: BoxFit.fitHeight,
              ),
            ),
          ),
        ),
        Positioned.fill(
          child: BlurFilter(
            child: Container(
              color: CustomColors.frostDark,
              child: Center(
                child: NoImageFound(),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class SubHeader extends StatelessWidget {
  final String? heading;
  final Color? currentColor;

  const SubHeader(this.heading, {Key? key, required this.currentColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            heading!,
            style: TextStyle(
              color: currentColor,
              fontSize: 16.0,
            ),
          ),
          IconButton(
            icon: Icon(
              Icons.arrow_forward_rounded,
              color: currentColor,
              size: 20.0,
            ),
            onPressed: () {},
          )
        ],
      ),
    );
  }
}

class CardList extends StatelessWidget {
  final int length;

  const CardList(this.length, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120.0,
      child: ListView(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        children: <Widget>[
          for (int i = 0; i < length; i++) Carousel(),
          const SizedBox(
            width: 20.0,
          )
        ],
      ),
    );
  }
}

class ShowEmptyDetails extends StatelessWidget {
  const ShowEmptyDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.75,
      color: Colors.green,
    );
  }
}
