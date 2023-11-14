class Information {
  String? information;

  Information({this.information});

  Information.fromJson(Map<String, dynamic> info)
      : information = info['information'];

  Map<String, dynamic> toJson() => {
        'information': information,
      };
}
