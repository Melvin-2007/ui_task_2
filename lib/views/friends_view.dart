import 'package:flutter/material.dart';
import 'package:task_6/config/app_colors.dart';
import 'package:task_6/enums/api_fetch_state.dart';
import 'package:task_6/models/weather_model.dart';
import 'package:task_6/network/weather_service.dart';
import 'package:task_6/widgets/app_button.dart';

class FriendsView extends StatefulWidget {
  const FriendsView({super.key});

  @override
  State<FriendsView> createState() => _FriendsViewState();
}

class _FriendsViewState extends State<FriendsView> {
  late ApiFetchState apiFetchState;
  late WeatherModel weatherModel;
  late String? errorMsg;

  @override
  void initState() {
    apiFetchState = ApiFetchState.loading;
    loadData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (apiFetchState == ApiFetchState.success) {
      return SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "LATITUDE: ${weatherModel.latitude.toString()}",
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Colors.blue),
            ),
            SizedBox(height: 4),
            Text(
              "LONGITUDE: ${weatherModel.longitude.toString()}",
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Colors.blue),
            ),
            SizedBox(height: 4),
            Text(
              "TIMEZONE: ${weatherModel.timezone.toString()}",
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Colors.blue),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 100),
              child: AppButton(label: "Refresh", onTap: () => loadData(), isFilled: true, labelColor: AppColors.white),
            ),
          ],
        ),
      );
    } else if (apiFetchState == ApiFetchState.error) {
      return SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              errorMsg!,
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Colors.red),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 100),
              child: AppButton(
                label: "Try again",
                onTap: () => loadData(),
                isFilled: true,
                labelColor: AppColors.white,
              ),
            ),
          ],
        ),
      );
    }
    return Center(child: CircularProgressIndicator());
  }

  Future<void> loadData() async {
    if (apiFetchState == ApiFetchState.error || apiFetchState == ApiFetchState.success) {
      if (!mounted) return;
      setState(() {
        apiFetchState = ApiFetchState.loading;
      });
    }

    final Map<String, dynamic> response = await WeatherService.getWeather();
    if (response["success"] == true) {
      weatherModel = WeatherModel.fromJson(response);
      apiFetchState = ApiFetchState.success;
    } else {
      errorMsg = response["error"];
      apiFetchState = ApiFetchState.error;
    }
    if (!mounted) return;
    setState(() {});
  }
}
