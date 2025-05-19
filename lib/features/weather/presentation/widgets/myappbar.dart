import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MyAppBar extends StatelessWidget {
  const MyAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 50,
        left: 20,
        right: 20,
      ),
      child: Row(
        children: [
          Flexible(
            fit: FlexFit.tight,
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        'assets/icons/map.svg',
                        colorFilter: const ColorFilter.mode(
                          Color(0xFFFFFFFF),
                          BlendMode.srcIn,
                        ),
                        width: 20,
                        height: 20,
                      ),
                      const SizedBox(width: 20),
                      const Text(
                        'Semarang',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(width: 10),
                      const Icon(Icons.keyboard_arrow_down,
                          color: Colors.white),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            width: 15,
          ),
          //icon notifikasi
          GestureDetector(
            onTap: () {
              showNotification(
                  context: context,
                  builder: (builder) {
                    return Container();
                  });
            },
            child: SvgPicture.asset(
              'assets/icons/notifikasi.svg',
              colorFilter: const ColorFilter.mode(
                Color(0xFFFFFFFF),
                BlendMode.srcIn,
              ),
            ),
          )
        ],
      ),
    );
  }
}

void showNotification(
    {required BuildContext context,
    required Widget Function(BuildContext) builder}) {
  showModalBottomSheet(
    context: context,
    builder: (context) {
      return Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 20,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              //header
              Container(
                padding: const EdgeInsets.all(20),
                child: const Text(
                  'Your Notifications',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              //new
              Text(
                'New',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                  color: Colors.black.withOpacity(0.5),
                ),
              ),
              ListTile(
                leading: SvgPicture.asset(
                  'assets/icons/sun.svg',
                  colorFilter: const ColorFilter.mode(
                    Color(0xFF000000),
                    BlendMode.srcIn,
                  ),
                ),
                title: const Text(
                  '10 minutes ago',
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.normal,
                      color: Colors.black54),
                ),
                subtitle: const Text(
                  'A sunny day in your location, consider wearing your UV protection',
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: Colors.black),
                ),
                trailing: const Icon(
                  Icons.keyboard_arrow_down,
                  color: Colors.black54,
                ),
                onTap: () {
                  // Handle notification tap
                  Navigator.pop(context);
                },
              ),

              //earlier
              const SizedBox(
                height: 20,
              ),
              Text(
                'Earlier',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                  color: Colors.black.withOpacity(0.5),
                ),
              ),
              ListTile(
                leading: SvgPicture.asset(
                  'assets/icons/windy.svg',
                  colorFilter: const ColorFilter.mode(
                    Color(0xFF000000),
                    BlendMode.srcIn,
                  ),
                ),
                title: const Text(
                  '1 day ago',
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.normal,
                      color: Colors.black54),
                ),
                subtitle: const Text(
                  'A cloudy day will occur all day long, dont worry about the heat of the sun',
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: Colors.black),
                ),
                trailing: const Icon(
                  Icons.keyboard_arrow_down,
                  color: Colors.black54,
                ),
                onTap: () {
                  // Handle notification tap
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: SvgPicture.asset(
                  'assets/icons/raini.svg',
                  colorFilter: const ColorFilter.mode(
                    Color(0xFF000000),
                    BlendMode.srcIn,
                  ),
                ),
                title: const Text(
                  '2 day ago',
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.normal,
                      color: Colors.black54),
                ),
                subtitle: const Text(
                  'Potential for rain today is 84%, dont forget to bring your umbrella.',
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: Colors.black),
                ),
                trailing: const Icon(
                  Icons.keyboard_arrow_down,
                  color: Colors.black54,
                ),
                onTap: () {
                  // Handle notification tap
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      );
    },
  );
}
