import 'package:demo/shared/placeholder_image.dart';
import 'package:flutter/material.dart';

class GalleryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    bool isLandscape = MediaQuery.of(context).size.aspectRatio > 1;
    var columnCount = isLandscape ? 4 : 2;

    return Container(
      child: GridView.count(
        padding: EdgeInsets.zero,
        crossAxisCount: columnCount,
        children: [
          Image.network("https://cfw42.rabbitloader.xyz/eyJjIjp0cnVlLCJoIjoid3d3Lndkdy1tYWdhemluZS5jb20iLCJ2Ijo4ODIyNDM2MzJ9/wp-content/uploads/2020/10/How-Many-Disney-Parks-Hong-Kong-Castle-DPB.jpg", fit: BoxFit.fitHeight),
          Image.network("https://cfw42.rabbitloader.xyz/eyJjIjp0cnVlLCJoIjoid3d3Lndkdy1tYWdhemluZS5jb20iLCJ2Ijo4ODIyNDM2MzJ9/wp-content/uploads/2023/09/Cinderella-Castle-Magic-Kingdom-FI-1030x539.png", fit: BoxFit.fitHeight),
          Image.network("https://disneyconnect.com/app/uploads/2023/09/Header-Image-2-1024x521.jpg", fit: BoxFit.fitHeight),
          Image.network("https://www.tampabay.com/resizer/v2/beginning-oct-1-mickey-and-minnie-mouse-MBDTRGIF4VAP7B7QZ3P32XSIHE.jpg?auth=5e5ede1e91701e0e63a85088b3ecce2eb4fd19beb6104772ec2cfa7ee32002f8&width=620", fit: BoxFit.fitHeight),
          Image.network("https://www.tampabay.com/resizer/v2/in-this-artist-rendering-spaceship-earth-R765YHRX2RE6LC2ZNNG7VMREMA.jpg?auth=1479b09e42d003b083de60f53f8491fac92171ee5132a9b5e952a0dd273a3bbb&width=620", fit: BoxFit.fitHeight),
          Image.network("https://magicguides.com/wp-content/uploads/2023/05/which-disney-park-has-the-least-walking.webp", fit: BoxFit.fitHeight),
          Image.network("https://res.cloudinary.com/graham-media-group/image/upload/f_auto/q_auto/c_scale,w_900/v1/media/gmg/I6AR2YDXKFG7FLZ3UFWD77JBMM.JPG?_a=AJFJtWIA", fit: BoxFit.fitHeight),
          Image.network("https://theparkprodigy.com/wp-content/uploads/2021/02/dreamstime_s_72375186.jpg", fit: BoxFit.fitHeight),
          Image.network("https://www.runtothemagic.com/wp-content/uploads/N0264531-e1551703302559-640x427.jpg", fit: BoxFit.fitHeight),
          Image.network("https://images.squarespace-cdn.com/content/v1/5de203bf4d009912ef872c6a/b9d740ba-1501-4116-91a4-c7bb4c2f0226/Rupunzel+Washrooms.jpg?format=1500w", fit: BoxFit.fitHeight),
        ],
      ),
    );
  }
}
