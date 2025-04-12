import 'package:flutter/material.dart';
import '../model/radios_response.dart';
import '../network/radio_api.dart';
import '../widgets/radio_player_controls.dart';

class RadioScreen extends StatelessWidget {
  const RadioScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final api = RadioApi();

    return Scaffold(
      backgroundColor: const Color(0xFFF3E8FF),
      appBar: AppBar(
        title: const Text("📻 إذاعات القرآن الكريم"),
        backgroundColor: Colors.deepPurple,
        centerTitle: true,
      ),
      body: FutureBuilder<RadiosResponse>(
        future: api.fetchRadios(Localizations.localeOf(context).languageCode),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(
              child: Text("حدث خطأ أثناء تحميل البيانات.",
                  style: theme.textTheme.titleMedium),
            );
          } else if (snapshot.hasData && snapshot.data!.radios != null) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: RadioPlayerControls(radios: snapshot.data!.radios!),
            );
          } else {
            return const Center(child: Text("لا توجد بيانات متاحة"));
          }
        },
      ),
    );
  }
}
