class LevelSystem {
  int xp = 0;
  int level = 1;

  void addXP(int amount) {
    xp += amount;
    if (xp >= level * 100) {
      xp = 0;
      level++;
      print("🎉 تهانينا! وصلت إلى المستوى $level");
    }
  }

  String getTitle() {
    if (level < 5) return "مبتدئ";
    if (level < 10) return "محلل متقدم";
    if (level < 20) return "خبير تداول";
    return "أسطورة التداول 💎";
  }
}
