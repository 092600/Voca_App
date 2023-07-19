import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';

class OAuth2LoginBox extends StatelessWidget {
  const OAuth2LoginBox({
    super.key,
    required this.color,
    required this.imageName,
  });

  final Color color;
  final String imageName;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(50),
      ),
      child: Center(
        child: SvgPicture.asset(
          "assets/svg/$imageName.svg",
          width: 40,
          height: 40,
        ),
      ),
    );
  }
}
