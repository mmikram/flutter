import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ocr_ovd_mobile/src/feature/news/data/pojo/news.dart';
import 'package:cached_network_image/cached_network_image.dart';


class NewsCell extends StatelessWidget {
  final News ? news;
  final bool ? isRemovable;
  final void Function(News article) ? onRemove;
  final void Function(News article) ? onNewsPressed;

  const  NewsCell({
    Key ? key,
    this.news,
    this.onNewsPressed,
    this.isRemovable = false,
    this.onRemove,
  }): super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: _onTap,
      child: Container(
        padding: const EdgeInsetsDirectional.only(start: 14, end: 14, bottom: 7, top: 7),
        height: MediaQuery.of(context).size.width / 2.2,
        child: Row(
          children: [
            _buildImage(context),
            _buildTitleAndDescription(),
            _buildRemovableArea(),
          ],
        ),
      ),
    );
  }

  Widget _buildImage(BuildContext context) {
    return CachedNetworkImage(
        imageUrl: news!.urlToImage??"",
        imageBuilder : (context, imageProvider) => Padding(
          padding: const EdgeInsetsDirectional.only(end: 14),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(4.0),
            child: Container(
              width: MediaQuery.of(context).size.width / 3,
              height: double.maxFinite,
              decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.08),
                  image: DecorationImage(
                      image: imageProvider,
                      fit: BoxFit.cover
                  )
              ),
            ),
          ),
        ),
        progressIndicatorBuilder : (context, url, downloadProgress) => Padding(
          padding: const EdgeInsetsDirectional.only(end: 14),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child: Container(
              width: MediaQuery.of(context).size.width / 3,
              height: double.maxFinite,
              child: CupertinoActivityIndicator(),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.08),
              ),
            ),
          ),
        ),
        errorWidget : (context, url, error) =>
            Padding(
              padding: const EdgeInsetsDirectional.only(end: 14),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: Container(
                  width: MediaQuery.of(context).size.width / 3,
                  height: double.maxFinite,
                  child: Icon(Icons.error),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.08),
                  ),
                ),
              ),
            )
    );
  }

  Widget _buildTitleAndDescription() {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 7),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title
            Text(
              news!.title?? '',
              maxLines : 3,
              overflow : TextOverflow.ellipsis,
              style: const TextStyle(
                fontFamily: 'Butler',
                fontWeight: FontWeight.w900,
                fontSize: 18,
                color: Colors.black87,
              ),
            ),

            // Description
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 4),
                child: Text(
                  news!.description ?? '',
                  maxLines : 2,
                ),
              ),
            ),

            // Datetime
            Row(
              children: [
                const Icon(Icons.punch_clock, size: 16),
                const SizedBox(width: 4),
                Text(
                  news!.publishedAt!,
                  style: const TextStyle(
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRemovableArea() {
    if (isRemovable!) {
      return GestureDetector(
        onTap: _onRemove,
        child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 8),
          child: Icon(Icons.remove_circle_outline, color: Colors.red),
        ),
      );
    }
    return Container();
  }

  void _onTap() {
    if (onNewsPressed != null) {
      onNewsPressed!(news!);
    }
  }

  void _onRemove() {
    if (onRemove != null) {
      onRemove!(news!);
    }
  }
}