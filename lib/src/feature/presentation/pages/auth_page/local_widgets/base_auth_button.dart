import 'package:file_up_mobile/src/feature/presentation/pages/auth_page/auth_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

enum PlatformType {
  google('구글', 'google_icon'),
  apple('애플', 'apple_icon'),
  kakao('카카오', 'kakao_icon'),
  naver('네이버', 'naver_icon');

  final String name;
  final String path;

  const PlatformType(this.name, this.path);
}

class BaseAuthButton extends StatelessWidget {
  final PlatformType platformType;
  final AuthType type;

  const BaseAuthButton.google({
    Key? key,
    required this.type,
    this.platformType = PlatformType.google,
  }) : super(key: key);

  const BaseAuthButton.apple({
    Key? key,
    required this.type,
    this.platformType = PlatformType.apple,
  }) : super(key: key);

  const BaseAuthButton.kakao({
    Key? key,
    required this.type,
    this.platformType = PlatformType.kakao,
  }) : super(key: key);

  const BaseAuthButton.naver({
    Key? key,
    required this.type,
    this.platformType = PlatformType.naver,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String buttonText;
    List<Color> colors = _initColors();
    Color backgroundColor = colors[0];
    Color textColor = colors[1];

    switch (type) {
      case AuthType.signIn:
        buttonText = '${platformType.name} 로그인';
        break;
      case AuthType.signUp:
        buttonText = '${platformType.name}로 시작하기';
        break;
    }

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 25),
      width: double.infinity,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(backgroundColor),
        ),
        onPressed: () {},
        child: Row(
          children: [
            SvgPicture.asset('assets/images/${platformType.path}.svg'),
            Expanded(
              child: Center(
                child: Text(
                  buttonText,
                  style: TextStyle(
                    color: textColor,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Color> _initColors() {
    Color backgroundColor = Colors.black;
    Color textColor = Colors.black;

    switch (platformType) {
      case PlatformType.google:
        backgroundColor = Colors.white;
        textColor = Colors.black;
        break;
      case PlatformType.apple:
        backgroundColor = Colors.black;
        textColor = Colors.white;
        break;
      case PlatformType.kakao:
        backgroundColor = const Color.fromRGBO(254, 229, 0, 1);
        textColor = Colors.black;
        break;
      case PlatformType.naver:
        backgroundColor = const Color.fromRGBO(3, 199, 90, 1);
        textColor = Colors.white;
        break;
    }

    return [backgroundColor, textColor];
  }
}
