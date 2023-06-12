import 'package:carousel_slider/carousel_slider.dart';
import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:games_free/app/bloc/detail/detail_cubit.dart';
import 'package:games_free/app/bloc/detail/detail_state.dart';
import 'package:games_free/app/core/ui/constants/constants.dart';
import 'package:games_free/app/core/ui/styles/button_styles.dart';
import 'package:games_free/app/core/ui/styles/text_styles.dart';
import 'package:games_free/app/core/ui/widgets/game_button.dart';
import 'package:games_free/app/pages/detail/widgets/grid_view_tile.dart';
import 'package:intl/intl.dart';

class DetailPage extends StatefulWidget {
  final int id;
  const DetailPage({
    super.key,
    required this.id,
  });

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      final cubit = context.read<DetailCubit>();
      cubit.getProductById(widget.id);
    });
  }

  @override
  Widget build(BuildContext context) {
    //bool select = false;
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        backgroundColor: kBackgroundColor,
        elevation: 0,
        title: const Text(''),
      ),
      body: BlocBuilder<DetailCubit, DetailState>(
        builder: (context, state) {
          if (state.status == DetailStateStatus.initial ||
              state.status == DetailStateStatus.loading) {
            return const Center(
              child: SpinKitSpinningLines(
                color: kFontColor,
                size: 30,
              ),
            );
          } else if (state.status == DetailStateStatus.error) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: kBackgroundCardColor,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Infelizmente, o jogo procurado não consta mais na nossa base de dados',
                      style: context.textStyles.textGameTitle,
                    ),
                  ),
                ),
              ),
            );
          } else if (state.status == DetailStateStatus.loaded) {
            final gameDetail = state.gameDetail;
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: SizedBox(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: FadeInImage.assetNetwork(
                            placeholder: 'assets/images/light.png',
                            image: gameDetail?.thumbnail ?? '',
                          ),
                        ),
                      ),
                    ),
                    const Divider(color: kFontColor),
                    const SizedBox(height: 10),
                    Container(
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                        color: kBackgroundCardColor,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              gameDetail?.title ?? '',
                              style: context.textStyles.textTitle,
                            ),
                            const SizedBox(height: 5),
                            Text(
                              gameDetail?.shortDescription ?? '',
                              style: context.textStyles.textComment,
                            ),
                            const SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Wishlist',
                                  style: context.textStyles.textGameTitle,
                                ),
                                GameButton(
                                  label: 'Add to my wishlist',
                                  icon: Icons.star_border,
                                  onPressed: () {},
                                  width: MediaQuery.of(context).size.width * .6,
                                  height: 35,
                                  style: context.buttonStyles.primaryButton,
                                ),
                              ],
                            ),
                            const SizedBox(height: 20),
                            Text(
                              'About ${gameDetail?.title}',
                              style: context.textStyles.textGameTitle,
                            ),
                            const Divider(color: kFontColor),
                            Text(
                              'Description',
                              style: context.textStyles.textGameTitle,
                            ),
                            ExpandableText(
                              gameDetail?.description ?? '',
                              expandText: ' + Read More',
                              linkColor: kFontColor,
                              collapseText: 'Show Less',
                              style: context.textStyles.textComment,
                            ),
                            const SizedBox(height: 20),
                            Text(
                              'Additional Details',
                              style: context.textStyles.textGameTitle,
                            ),
                            const Divider(color: kFontColor),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                GridViewTile(
                                  titleTop: 'Genre',
                                  textTop: gameDetail?.genre ?? '',
                                  titleMid: 'Publisher',
                                  textMid: gameDetail?.publisher ?? '',
                                  titleBot: 'Release Date',
                                  textBot: DateFormat.yMd()
                                      .format(gameDetail!.releaseDate),
                                ),
                              ],
                            ),
                            const SizedBox(height: 20),
                            Text(
                              'Screenshots',
                              style: context.textStyles.textGameTitle,
                            ),
                            Center(
                              child: SizedBox(
                                child: CarouselSlider(
                                    items: gameDetail.screenshots
                                        .map(
                                          (e) => ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(12),
                                            child: FadeInImage.assetNetwork(
                                              placeholder:
                                                  'assets/images/light.png',
                                              image: e.image,
                                            ),
                                          ),
                                        )
                                        .toList(),
                                    options: CarouselOptions(
                                      enlargeCenterPage: true,
                                      autoPlay: false,
                                      enableInfiniteScroll: false,
                                    )),
                              ),
                            ),
                            Text(
                              'System Requirements',
                              style: context.textStyles.textGameTitle,
                            ),
                            const Divider(color: kFontColor),
                            GridViewTile(
                              titleTop: 'OS',
                              textTop: gameDetail.minimumSystemRequirements.os,
                              titleMid: 'Processor',
                              textMid: gameDetail
                                  .minimumSystemRequirements.processor,
                              titleBot: 'Memory',
                              textBot:
                                  gameDetail.minimumSystemRequirements.memory,
                            ),
                            const SizedBox(height: 12),
                            GridViewTile(
                              titleTop: 'Graphics',
                              textTop:
                                  gameDetail.minimumSystemRequirements.graphics,
                              titleMid: 'Storage',
                              textMid:
                                  gameDetail.minimumSystemRequirements.storage,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          } else {
            return Center(
              child: Text(
                state.toString(),
              ),
            );
          }
        },
      ),
    );
  }
}
