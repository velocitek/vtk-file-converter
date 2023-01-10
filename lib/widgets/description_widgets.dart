import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../tools/constants.dart';
import 'package:url_launcher/link.dart';

class DescriptionBlock extends StatelessWidget {
  const DescriptionBlock({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const String vtkLink = 'https://velocitek.com/blogs/news/vtk-files';
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          ".VTK, .GPX, AND .CSV?\nWHICH IS BEST FOR ME?",
          style: kDescriptionTitle,
          textAlign: TextAlign.left,
        ),
        const SizedBox(
          height: 40.0,
        ),
        const Text(
          "Utilizing a VTK file(s) or converting your files to GPX or CSV gives you the flexibility to view your data on many paid and unpaid platforms.",
          style: kDescriptionText,
          textAlign: TextAlign.left,
        ),
        const SizedBox(
          height: 90.0,
        ),
        const Text(
          "WHAT IS A .VTK FILE?",
          style: kDescriptionTitle,
          textAlign: TextAlign.right,
        ),
        const SizedBox(
          height: 40.0,
        ),
        const Text(
          "Check out this article describing why .VTK files are the best solution for logging data on all your Velocitek devices.",
          style: kDescriptionText,
          textAlign: TextAlign.left,
        ),
        const SizedBox(
          height: 10.0,
        ),
        RichText(
            text: TextSpan(
                style: kLinkText,
                text: vtkLink,
                recognizer: TapGestureRecognizer()
                  ..onTap = () async {
                    if (await canLaunchUrl(Uri.parse(vtkLink))) {
                      await launchUrl(Uri.parse(vtkLink));
                    } else {
                      throw 'Could not launch $vtkLink';
                    }
                  }))
        // Link(
        //   target: LinkTarget.blank,
        //   uri: Uri.parse(vtkLink),
        //   builder: (context, followLink) => ElevatedButton(
        //     onPressed: followLink,
        //     child: Text(
        //       vtkLink,
        //       style: kDescriptionText,
        //       textAlign: TextAlign.left,
        //     ),
        //   ),
        // ),
      ],
    );
  }
}
