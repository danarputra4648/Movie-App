import 'package:GrubNet/constant.dart';
import 'package:GrubNet/core/getx/movie_controller.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailScreen extends StatelessWidget {
  static const routeName = '/detail-screen';

  @override
  Widget build(BuildContext context) {
    final movie = Get.put(MovieController());
    final routeArgs = Get.arguments as Map<String, Object>;
    final backdropImg = routeArgs['backdrop_img'];
    final posterImg = routeArgs['poster_img'];
    final overview = routeArgs['overview'];
    final genres = routeArgs['genres'] as List;
    final title = routeArgs['title'] as String;
    final date = routeArgs['date'];
    final vote = routeArgs['vote_avg'];

    return Scaffold(
      body: SafeArea(
        bottom: true,
        top: false,
        child: CustomScrollView(
          slivers: [
            buildPosterImage(posterImg, backdropImg),
            buildPosterTitle(title, vote),
            buildPosterDescription(overview, date),
            buildPosterGenres(movie, genres),
            buildSimiliarPoster(),
          ],
        ),
      ),
    );
  }

  GetBuilder<MovieController> buildSimiliarPoster() {
    return GetBuilder<MovieController>(
      init: MovieController(),
      builder: (similiar) => SliverToBoxAdapter(
        child: similiar.similiarViewModel.isNotEmpty
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      'Similiar Movie',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  Divider(
                    indent: 10,
                    endIndent: 10,
                    thickness: 5,
                  ),
                  CarouselSlider.builder(
                    carouselController: CarouselController(),
                    itemCount: similiar.similiarViewModel.length,
                    itemBuilder: (context, index) => InkWell(
                      splashColor: disabledIconColor,
                      onTap: () {},
                      child: CachedNetworkImage(
                        errorWidget: (context, url, error) => FlutterLogo(),
                        placeholder: (context, url) => Container(),
                        imageUrl:
                            'https://image.tmdb.org/t/p/w300${similiar.similiarViewModel[index].posterImg}',
                        imageBuilder: (context, imageProvider) => Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          width: 150,
                          height: 200,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            image: DecorationImage(
                              colorFilter: ColorFilter.mode(
                                  primaryColor, BlendMode.softLight),
                              image: imageProvider,
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ),
                    ),
                    options: CarouselOptions(
                      viewportFraction: 0.4,
                      autoPlay: true,
                      autoPlayInterval: Duration(seconds: 8),
                      autoPlayCurve: Curves.ease,
                      height: 200,
                      enableInfiniteScroll: true,
                    ),
                  ),
                ],
              )
            : Container(),
      ),
    );
  }

  SliverToBoxAdapter buildPosterGenres(MovieController genre, List genres) {
    return SliverToBoxAdapter(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: genre.genreViewModel
            .where((genreIds) => genres.contains(genreIds.id))
            .map(
              (genresName) => Chip(
                avatar: Icon(Icons.clear, color: Colors.grey[700]),
                label: Text(
                  genresName.name,
                  maxLines: 1,
                  overflow: TextOverflow.fade,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            )
            .toList(),
      ),
    );
  }

  SliverToBoxAdapter buildPosterDescription(Object overview, date) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Text(
              overview,
              style: TextStyle(
                color: Colors.grey,
                fontSize: 16,
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                date,
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 16,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  SliverToBoxAdapter buildPosterTitle(String title, double vote) {
    return SliverToBoxAdapter(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title.toUpperCase(),
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                  ),
                ),
                Chip(
                  avatar: Icon(
                    Icons.star,
                    color: Colors.yellow,
                  ),
                  label: Text(
                    '$vote / 10',
                    style: TextStyle(
                      color: Colors.yellow,
                    ),
                  ),
                )
              ],
            ),
          ),
          Divider(
            thickness: 2,
            indent: 10,
            endIndent: 10,
            height: 10,
          ),
        ],
      ),
    );
  }

  SliverAppBar buildPosterImage(Object posterImg, Object backdropImg) {
    return SliverAppBar(
      floating: true,
      // snap: true,
      pinned: false,
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
                fit: BoxFit.cover,
              ),
            ),
          ),
          errorWidget: (context, url, error) => FlutterLogo(),
          placeholder: (context, url) => Container(),
        ),
      ),
    );
  }
}
