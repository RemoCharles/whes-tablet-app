import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:whes_tablet_app/classes/heritage.dart';

class HeritageDetailGallery extends StatelessWidget {
  final Heritage heritage;
  HeritageDetailGallery(this.heritage);
  @override
  Widget build(BuildContext context) {
    return Container(child: _gridImages(heritage));
  }

  Widget _gridImages(Heritage heritage) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 1.0,
          crossAxisSpacing: 3.0,
          mainAxisSpacing: 3.0),
      itemCount: heritage.heritageGallery.length,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          padding: EdgeInsets.all(8.0),
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
            ),
            child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                child: FadeInImage(
                  placeholder: MemoryImage(kTransparentImage),
                  image: AssetImage(heritage.heritageGallery[index]),
                  fit: BoxFit.cover,
                )),
          ),
        );
      },
    );
  }
}
