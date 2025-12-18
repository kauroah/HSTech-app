import 'package:shared_preferences/shared_preferences.dart';

enum AccessStatus {
  none,        // new user
  trial,       // free trial active
  subscribed,  // paid user
}

class SubscriptionStorage {
  static const _statusKey = 'access_status';
  static const _trialStartKey = 'trial_start';

  static const int trialDays = 3;

  Future<AccessStatus> getStatus() async {
    final prefs = await SharedPreferences.getInstance();
    final value = prefs.getString(_statusKey);

    if (value == null) return AccessStatus.none;

    return AccessStatus.values.firstWhere(
      (e) => e.name == value,
      orElse: () => AccessStatus.none,
    );
  }

  Future<bool> hasAccess() async {
    final prefs = await SharedPreferences.getInstance();
    final status = await getStatus();

    if (status == AccessStatus.subscribed) return true;

    if (status == AccessStatus.trial) {
      final startMillis = prefs.getInt(_trialStartKey);
      if (startMillis == null) return false;

      final start =
          DateTime.fromMillisecondsSinceEpoch(startMillis);
      final daysPassed =
          DateTime.now().difference(start).inDays;

      return daysPassed < trialDays;
    }

    return false;
  }

  Future<void> startTrial() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_statusKey, AccessStatus.trial.name);
    await prefs.setInt(
      _trialStartKey,
      DateTime.now().millisecondsSinceEpoch,
    );
  }

  Future<void> subscribe() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(
        _statusKey, AccessStatus.subscribed.name);
    await prefs.remove(_trialStartKey);
  }

  Future<void> clearAll() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }
}
