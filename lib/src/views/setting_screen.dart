import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    AlertDialog clearhistroy = AlertDialog(
      title: const Text("Clear History"),
      titleTextStyle: const TextStyle(
        fontWeight: FontWeight.w800,
        color: Colors.black,
        fontSize: 25,
      ),
      content: const Text('Clear your Wishlists and trip details '
          'and \nsearch history'),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text(
            "Cancel",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        TextButton(
          onPressed: () {
            // Navigator.pushNamed(context, 'home');
          },
          child: const Text(
            "OK",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
    AlertDialog deleteAccount = AlertDialog(
      alignment: Alignment.center,
      title: const Text("Are You Sure?"),
      titleTextStyle: const TextStyle(
        fontWeight: FontWeight.w800,
        color: Colors.black,
        fontSize: 25,
      ),
      content: const Text(
        "Delete Account",
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.red,
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pushNamed(context, 'home');
          },
          child: const Text(
            "Cancel",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        TextButton(
          onPressed: () {
            Navigator.pushNamed(context, 'home');
          },
          child: const Text(
            "OK",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );

    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.close_outlined),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            ListTile(
              title: const Text("Notification"),
              titleTextStyle: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w700,
                fontSize: 20,
              ),
              trailing: Switch(
                value: false,
                onChanged: (value) {},
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            ListTile(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext) {
                    return clearhistroy;
                  },
                );
              },
              title: const Text("Clear History"),
              subtitle: const Text(
                'Clear your Wishlists and trip details '
                'and \nsearch history',
                style: TextStyle(
                  color: Color(0xFF616161),
                  fontSize: 16,
                  fontFamily: 'SF Pro Display',
                  fontWeight: FontWeight.w400,
                  height: 0,
                ),
              ),
              trailing: const Icon(
                CupertinoIcons.forward,
                size: 30,
              ),
              titleTextStyle: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w700,
                fontSize: 20,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            ListTile(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext) {
                    return deleteAccount;
                  },
                );
              },
              title: const Text("Delete Account"),
              subtitle: const Text(
                'Permanently remove your accunt and data \nform Tripify, proceed with caution',
                style: TextStyle(
                  color: Color(0xFF616161),
                  fontSize: 16,
                  fontFamily: 'SF Pro Display',
                  fontWeight: FontWeight.w400,
                  height: 0,
                ),
              ),
              titleTextStyle: const TextStyle(
                color: Colors.red,
                fontWeight: FontWeight.w700,
                fontSize: 20,
              ),
              trailing: const Icon(
                CupertinoIcons.forward,
                size: 30,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
