class MedicineModel{
  String title;

  String frequency;

  int frequencyTime;

  String period;

  int periodTime;

  String image;

  MedicineModel({
    required this.periodTime,
    required this.frequencyTime,
    required this.period,
    required this.image,
    required this.title,
    required this.frequency,
  });

  @override
  String toString() {
    return 'title =$title  frequency=$frequency';
  }

}
