import 'dart:ui';

import 'package:brandie/constants.dart';
import 'package:brandie/pages/edit_caption_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ContentScreen extends StatefulWidget {
  const ContentScreen({super.key});

  @override
  State<ContentScreen> createState() => _ContentScreenState();
}

class _ContentScreenState extends State<ContentScreen> {
  int _currentPage = 0;

  late PageController _pageController;

  @override
  void initState() {
    _pageController = PageController();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((e) {
      _pageController.addListener(() {
        setState(() {
          _currentPage = _pageController.page!.toInt();
        });
      });
    });

    final h = MediaQuery.sizeOf(context).height;
    final w = MediaQuery.sizeOf(context).width;
    return Stack(
      children: [
        PageView.builder(
          controller: _pageController,
          pageSnapping: true,
          allowImplicitScrolling: false,
          itemCount: 3,
          onPageChanged: (value) {
            setState(() {});
          },
          scrollDirection: Axis.vertical,
          itemBuilder:
              (con, i) => Image.asset(contentImages[i], fit: BoxFit.fill),
        ),
        Positioned(
          top: h * 0.2,
          right: 8,
          child: BlurContainer(
            padding: EdgeInsets.symmetric(horizontal: 4, vertical: 8),
            child: Column(
              children: [
                Icon(
                  Icons.circle,
                  size: 12,
                  color: _currentPage == 0 ? greenAccent : Colors.white,
                ),
                SizedBox(height: 2),
                Icon(
                  Icons.circle,
                  size: 12,
                  color: _currentPage == 1 ? greenAccent : Colors.white,
                ),
                SizedBox(height: 2),
                Icon(
                  Icons.circle,
                  size: 12,
                  color: _currentPage == 2 ? greenAccent : Colors.white,
                ),
              ],
            ),
          ),
        ),
        Positioned.fill(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 44,
                      child: CircleAvatar(
                        backgroundImage: AssetImage('assets/images/girl.png'),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: EdgeInsets.only(left: 8, right: 8),
                          margin: EdgeInsets.only(left: 8, right: 8),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            image: DecorationImage(
                              image: AssetImage(
                                'assets/images/brandie_gradient.png',
                              ),
                              fit: BoxFit.fill,
                            ),
                          ),
                          height: 20,
                          child: Row(
                            children: [
                              SizedBox(
                                height: 16,
                                child: Image.asset(
                                  'assets/images/brandie_stars.png',
                                ),
                              ),
                              Text(
                                ' Ready to share',
                                style: Theme.of(context).textTheme.labelLarge
                                    ?.copyWith(color: Colors.white),
                              ),
                            ],
                          ),
                        ),

                        Container(
                          margin: EdgeInsets.only(left: 8, right: 8),
                          child: Text(
                            'High-converting in Oriflame Community',
                            style: Theme.of(context).textTheme.labelMedium
                                ?.copyWith(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                    Spacer(),
                    BlurContainer(
                      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      child: Container(
                        child: Text(
                          'Pick $_currentPage of 3',
                          style: Theme.of(context).textTheme.labelMedium
                              ?.copyWith(color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Spacer(),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 16),
                child: BlurContainer(
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        'assets/images/music.svg',
                        fit: BoxFit.fill,
                      ),
                      RichText(
                        text: TextSpan(
                          text: 'Recommended: ',
                          style: Theme.of(
                            context,
                          ).textTheme.bodyMedium?.copyWith(color: Colors.white),
                          children: [
                            TextSpan(
                              text: songAndArtist[_currentPage].song,
                              style: Theme.of(
                                context,
                              ).textTheme.bodyMedium?.copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            TextSpan(
                              text: ' by ${songAndArtist[_currentPage].artist}',
                              style: Theme.of(context).textTheme.bodyMedium
                                  ?.copyWith(color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 10),

              Container(
                margin: EdgeInsets.symmetric(horizontal: 16),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder:
                            (context) => EditCaptionPage(
                              captionText: contentBody[_currentPage],
                              editCaption: (e) {
                                setState(() {
                                  contentBody[_currentPage] = e;
                                });
                              },
                            ),
                      ),
                    );
                  },
                  child: BlurContainer(
                    child: CaptionView(text: contentBody[_currentPage]),
                  ),
                ),
              ),

              SizedBox(height: 10),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  children: [
                    Text(
                      "Quick Share To: ",
                      style: Theme.of(
                        context,
                      ).textTheme.labelLarge?.copyWith(color: Colors.white),
                    ),
                    Expanded(
                      child: SizedBox(
                        height: 32,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: false,
                          itemCount: 11,
                          itemBuilder:
                              (context, e) => Container(
                                padding: EdgeInsets.symmetric(horizontal: 8),
                                height: 40,
                                child: Image.asset(
                                  "assets/images/social_media/${e + 1}.png",
                                  fit: BoxFit.fill,
                                ),
                              ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: h * 0.1),
            ],
          ),
        ),
      ],
    );
    // ,);
  }
}

class BlurContainer extends StatelessWidget {
  final Widget child;
  final EdgeInsets? padding;
  const BlurContainer({super.key, required this.child, this.padding});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(2), // Rounded corners
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          padding: padding ?? EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            color: black.withValues(alpha: 0.39), // Semi-transparent
            borderRadius: BorderRadius.circular(12),
          ),
          alignment: Alignment.center,
          child: child,
        ),
      ),
    );
  }
}

class CaptionView extends StatelessWidget {
  (String, List<String>, String) extractData() {
    // Extract all hashtags
    RegExp hashtagRegExp = RegExp(r"#\w+");
    List<String> hashtags =
        hashtagRegExp.allMatches(text).map((match) => match.group(0)!).toList();

    // Find first and last hashtag positions
    int firstHashtagIndex = text.indexOf(
      hashtags.isNotEmpty ? hashtags.first : "",
    );
    int lastHashtagIndex = text.lastIndexOf(
      hashtags.isNotEmpty ? hashtags.last : "",
    );

    // Extract parts of the text
    String beforeFirstHashtag =
        firstHashtagIndex > 0
            ? text.substring(0, firstHashtagIndex).trim()
            : "";
    String afterLastHashtag =
        lastHashtagIndex != -1
            ? text.substring(lastHashtagIndex + hashtags.last.length).trim()
            : "";

    return (beforeFirstHashtag, hashtags, afterLastHashtag);
  }

  const CaptionView({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    final (before, hashtag, after) = extractData();
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: before,
            style: Theme.of(
              context,
            ).textTheme.bodyLarge?.copyWith(color: Colors.white),
          ),

          TextSpan(
            text: "${hashtag.join(" ")}\n",
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),

          TextSpan(
            text: after,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              fontStyle: FontStyle.italic,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
