import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

///
/// author: hefei
/// time  : 2020/11/11
/// desc  : 通用图像查看页面
///
class CommonPhotosPage extends StatefulWidget {
  final List<String> images;

  const CommonPhotosPage({Key key, this.images}) : super(key: key);

  @override
  _CommonPhotosPageState createState() => _CommonPhotosPageState();
}

class _CommonPhotosPageState extends State<CommonPhotosPage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return widget.images.length > 1 ? _buildGallery() : _buildPhotoView();
  }

  ///
  /// build PhotoView for just one image
  ///
  Widget _buildPhotoView() {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text("${_currentIndex + 1}/${widget.images.length}"),
      ),
      body: PhotoView(
        imageProvider: NetworkImage(widget.images[0]),
        initialScale: PhotoViewComputedScale.contained,
        minScale: PhotoViewComputedScale.contained * 0.5,
        maxScale: PhotoViewComputedScale.covered * 4.0,
        loadingBuilder: (context, event) => Center(
          child: Container(
            width: 20.0,
            height: 20.0,
            child: CircularProgressIndicator(
              value: event == null
                  ? 0
                  : event.cumulativeBytesLoaded / event.expectedTotalBytes,
            ),
          ),
        ),
        backgroundDecoration: BoxDecoration(
          color: Colors.black,
        ),
      ),
      backgroundColor: Colors.black,
    );
  }

  ///
  /// build PhotoViewGallery for images
  ///
  Widget _buildGallery() {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text("${_currentIndex + 1}/${widget.images.length}"),
      ),
      body: PhotoViewGallery.builder(
        scrollPhysics: const BouncingScrollPhysics(),
        builder: (BuildContext context, int index) {
          return PhotoViewGalleryPageOptions(
            imageProvider: NetworkImage(widget.images[index]),
            initialScale: PhotoViewComputedScale.contained,
            minScale: PhotoViewComputedScale.contained * 0.5,
            maxScale: PhotoViewComputedScale.covered * 2.0,
            heroAttributes: PhotoViewHeroAttributes(tag: index),
          );
        },
        itemCount: widget.images.length,
        loadingBuilder: (context, event) => Center(
          child: Container(
            width: 20.0,
            height: 20.0,
            child: CircularProgressIndicator(
              value: event == null
                  ? 0
                  : event.cumulativeBytesLoaded / event.expectedTotalBytes,
            ),
          ),
        ),
        backgroundDecoration: BoxDecoration(
          color: Colors.black,
        ),
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
      backgroundColor: Colors.black,
    );
  }
}
