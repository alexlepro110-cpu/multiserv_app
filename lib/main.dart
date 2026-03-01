import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const CupertinoApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  // Ouvre Discord
  Future<void> _openDiscord() async {
    final Uri url = Uri.parse('https://discord.gg/UACRdsmMu');
    if (await canLaunchUrl(url)) {
      await launchUrl(url, mode: LaunchMode.externalApplication);
    }
  }

  // Copie l'adresse ET ouvre Minecraft
  Future<void> _openMinecraft() async {
    // 1. Copie l'adresse dans le presse-papiers
    await Clipboard.setData(const ClipboardData(text: 'listings-newport.gl.at.ply.gg:12971'));
   
    // 2. Ouvre Minecraft
    final Uri url = Uri.parse('minecraft://');
    if (await canLaunchUrl(url)) {
      await launchUrl(url, mode: LaunchMode.externalApplication);
    }
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('Multiserv'),
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Logo
              Container(
                padding: const EdgeInsets.all(30),
                decoration: BoxDecoration(
                  color: CupertinoColors.systemIndigo.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Text(
                  'Multiserv',
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: CupertinoColors.systemIndigo,
                  ),
                ),
              ),
             
              const SizedBox(height: 50),
             
              // Bouton Discord
              CupertinoButton(
                padding: const EdgeInsets.all(25),
                color: CupertinoColors.systemIndigo,
                borderRadius: BorderRadius.circular(15),
                onPressed: _openDiscord,
                child: const Column(
                  children: [
                    Icon(CupertinoIcons.chat_bubble_fill, size: 50),
                    SizedBox(height: 10),
                    Text('Discord', style: TextStyle(fontSize: 24)),
                    Text('Rejoindre le serveur', style: TextStyle(fontSize: 14)),
                  ],
                ),
              ),
             
              const SizedBox(height: 20),
             
              // Bouton Minecraft (avec copie)
              CupertinoButton(
                padding: const EdgeInsets.all(25),
                color: CupertinoColors.systemOrange,
                borderRadius: BorderRadius.circular(15),
                onPressed: _openMinecraft,
                child: const Column(
                  children: [
                    Icon(CupertinoIcons.game_controller, size: 50),
                    SizedBox(height: 10),
                    Text('Minecraft', style: TextStyle(fontSize: 24)),
                    Text('Copie + Lancement', style: TextStyle(fontSize: 14)),
                  ],
                ),
              ),
             
              const SizedBox(height: 30),
             
              // Adresse affichée
              Container(
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: CupertinoColors.systemGrey6,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Text(
                  'listings-newport.gl.at.ply.gg:12971',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
} 