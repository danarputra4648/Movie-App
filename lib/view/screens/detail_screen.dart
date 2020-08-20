import 'package:GrubNet/constant.dart';
import 'package:GrubNet/core/getx/movie_controller.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailScreen extends StatelessWidget {
  static const routeName = '/detail-screen';

  @override
  Widget build(BuildContext context) {
    final genre = Get.put(MovieController());
    final routeArgs = Get.arguments as Map<String, Object>;
    final backdropImg = routeArgs['backdrop_img'];
    final posterImg = routeArgs['poster_img'];
    final overview = routeArgs['overview'];
    final genres = routeArgs['genres'] as List;
    final title = routeArgs['title'] as String;

    return Scaffold(
      body: SafeArea(
        bottom: true,
        top: false,
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              floating: true,
              // snap: true,
              pinned: true,
              expandedHeight: 300,
              flexibleSpace: FlexibleSpaceBar(
                title: Padding(
                  padding: const EdgeInsets.fromLTRB(130, 0, 0, 0),
                  child: CachedNetworkImage(
                    imageUrl: posterImg,
                    imageBuilder: (context, imageProvider) => Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 5,
                            color: Colors.grey[700],
                            offset: Offset.fromDirection(20, 2.5),
                          )
                        ],
                        image: DecorationImage(
                          colorFilter: ColorFilter.srgbToLinearGamma(),
                          image: imageProvider,
                          fit: BoxFit.fill,
                        ),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      width: 80,
                      height: 100,
                    ),
                  ),
                ),
                background: CachedNetworkImage(
                  imageUrl: backdropImg,
                  imageBuilder: (context, imageProvider) => Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: imageProvider,
                        colorFilter: ColorFilter.mode(
                          primaryColor,
                          BlendMode.softLight,
                        ),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  errorWidget: (context, url, error) => FlutterLogo(),
                  placeholder: (context, url) => Container(),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      title.toUpperCase(),
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  Divider(
                    thickness: 2,
                    indent: 10,
                    endIndent: 10,
                    height: 10,
                  )
                ],
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Text(
                  overview,
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 16,
                  ),
                ),
              ),
            ),

            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Row(
                  children: genre.genreViewModel
                      .where((genreIds) => genres.contains(genreIds.id))
                      .map(
                        (genresName) => Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: Chip(
                            avatar: Icon(Icons.clear, color: Colors.grey[700]),
                            label: Text(
                              genresName.name,
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      )
                      .toList(),
                ),
              ),
            )

            // SliverList(
            //   delegate: SliverChildBuilderDelegate(
            //     (context, index) {
            //       return Container(
            //         margin: const EdgeInsets.all(10),
            //         width: 200,
            //         height: 200,
            //         color: Colors.red,
            //       );
            //     },
            //     childCount: 5,
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}
