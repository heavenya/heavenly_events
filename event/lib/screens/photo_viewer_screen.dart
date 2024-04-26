import '../utils/common_imports.dart';

class MyPhotoViewer extends StatelessWidget {
  final String url;
  MyPhotoViewer({required this.url});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: Padding(
            padding: const EdgeInsets.all(14.0),
            child: CircularShadow(
              child: SvgPicture.asset(
                '${AppImages.iconPath}back.svg',
                height: 16,
              ),
            ),
          ),
        ),
      ),
      body: Center(
        child: Hero(
          tag: url,
          child: PhotoView(
            imageProvider: AssetImage(
              url,
            ),
            maxScale: 1.0,
            minScale: 0.2,
          ),
        ),
      ),
    );
  }
}
