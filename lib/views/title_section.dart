import 'package:flutter/material.dart';

class TitleSection extends StatelessWidget {
  const TitleSection(
      {super.key,
      required this.title,
      this.showNotificationButton = false,
      this.isCentered = false,
      this.leadingSvgAsset});

  final String title;
  final bool showNotificationButton;
  final bool isCentered;
  final String? leadingSvgAsset;
  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment:
            isCentered ? MainAxisAlignment.center : MainAxisAlignment.start,
        children: [
          // if (leadingSvgAsset != null)
          //   Padding(
          //     padding: EdgeInsets.only(right: 2.sp),
          //     child: SvgPicture.asset(
          //       leadingSvgAsset!,
          //       height: 20.sp,
          //       color: Theme.of(context).appBarTheme.iconTheme?.color ??
          //           const Color(0xFF000000),
          //       colorBlendMode: BlendMode.srcIn,
          //       matchTextDirection: true,
          //     ),
          //   ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(title,
                style: const TextStyle(
                    letterSpacing: 2,
                    fontFamily: 'AmaticSC',
                    fontSize: 40,
                    fontWeight: FontWeight.bold)),
          ),
          // if (showNotificationButton)
          //   Stack(
          //     children: [
          //       // IconButton(
          //       //   icon: SvgPicture.asset(
          //       //     "assets/new/bell.svg",
          //       //     color: Theme.of(context).appBarTheme.iconTheme?.color ??
          //       //         const Color(0xFF000000),
          //       //     colorBlendMode: BlendMode.srcIn,
          //       //     width: 20.sp,
          //       //   ),
          //       //   onPressed: () {
          //       //     Navigator.pushNamed(context, '/notification');
          //       //   },
          //       // ),
          //       Positioned.fill(
          //         child: Align(
          //           alignment: AlignmentDirectional.topEnd,
          //           child: Container(
          //             width: 15,
          //             height: 15,
          //             decoration: const BoxDecoration(
          //               boxShadow: [
          //                 BoxShadow(
          //                   blurRadius: 0,
          //                   color: Color(0xFFFFA800),
          //                 )
          //               ],
          //               borderRadius: BorderRadius.all(Radius.circular(45)),
          //             ),
          //             child: const Padding(
          //               padding:  EdgeInsets.all(3.0),
          //               child: Center(
          //                 child: FittedBox(
          //                   child: Text(
          //                     "33",
          //                     style: TextStyle(
          //                         color: Colors.white,
          //                         fontWeight: FontWeight.w900),
          //                   ),
          //                 ),
          //               ),
          //             ),
          //           ),
          //         ),
          //       ),
          //     ],
          //   ),
          // IconButton(
          //         iconSize: 35,
          //         onPressed: () => Navigator.of(context).push(),
          //         icon: SvgPicture.asset(
          //           "assets/new/menu.svg",
          //           color: Theme.of(context).appBarTheme.iconTheme?.color ??
          //               const Color(0xFF000000),
          //           colorBlendMode: BlendMode.srcIn,
          //         ),
          // )
        ]);
  }
}
