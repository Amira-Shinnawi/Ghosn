// import 'package:flutter/material.dart';
// import 'package:ghosn_app/core/utils/style.dart';

// import '../../../../../core/utils/assets_data.dart';

// class ArticleItemDetails extends StatelessWidget {
//   const ArticleItemDetails({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     double height = MediaQuery.of(context).size.height;
//     double blocHeight = (height / 100);
//     double width = MediaQuery.of(context).size.width;
//     double blocWidth = (width / 100);
//     return Row(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Expanded(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               const Text(
//                 'Article Title',
//                 style: Styles.textStyle16Inter,
//               ),
//               SizedBox(
//                 height: blocHeight * 1,
//               ),
//               const Text(
//                 'Its effects and importance, The relationship between progress and decline in cover.',
//                 style: Styles.textStyle16Inter,
//                 maxLines: 2,
//                 overflow: TextOverflow.ellipsis,
//               ),
//               SizedBox(
//                 height: blocHeight * 1,
//               ),
//               AspectRatio(
//                 aspectRatio: 1 / 1,
//                 child: Image.asset(
//                   AssetsData.article,
//                   fit: BoxFit.cover,
//                 ),
//               ),
//               SizedBox(
//                 height: blocHeight * 1,
//               ),
//               const Text(
//                 'The process of photosynthesis helps plants stabilize the climate, by compensating for fluctuations in temperature and humidity during the process of excreting oxygen in the process of photosynthesis. Plants use carbon dioxide in the process of photosynthesis, and account for the amount of gases in the atmosphere emitted by fires.',
//                 maxLines: 7,
//                 overflow: TextOverflow.ellipsis,
//               ),
//             ],
//           ),
//         ),
//         SizedBox(
//           width: blocWidth * 3,
//         ),
//         Expanded(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               const Text(
//                 'The process of photosynthesis helps plants stabilize the climate, by compensating for fluctuations in temperature and humidity during the process of excreting oxygen in the process of photosynthesis. Plants use carbon dioxide in the process of photosynthesis, and account for the amount of gases in the atmosphere emitted by fires.',
//                 maxLines: 7,
//                 overflow: TextOverflow.ellipsis,
//               ),
//               SizedBox(
//                 height: blocHeight * 1,
//               ),
//               AspectRatio(
//                 aspectRatio: 1 / 1,
//                 child: Image.asset(
//                   AssetsData.article,
//                   fit: BoxFit.cover,
//                 ),
//               ),
//               SizedBox(
//                 height: blocHeight * 1,
//               ),
//               const Text(
//                 'The process of photosynthesis helps plants stabilize the climate, by compensating for fluctuations in temperature and humidity during the process of excreting oxygen in the process of photosynthesis. Plants use carbon dioxide in the process of photosynthesis, and account for the amount of gases in the atmosphere emitted by fires.',
//                 maxLines: 7,
//                 overflow: TextOverflow.ellipsis,
//               ),
//             ],
//           ),
//         ),
//       ],
//     );
//   }
// }
