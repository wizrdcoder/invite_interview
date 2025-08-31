class WeddingInvitation {
  String title;
  String coupleNames;
  String backgroundColor;
  String eventDate;
  String eventTime;
  String eventLocation;
  String ceremonyVenue;
  String ceremonyTime;
  String receptionVenue;
  String receptionTime;
  String rsvpPhone;
  String dressCode;
  bool gatePassRequired;
  String fontFamily;
  String textColor;
  String accentColor;
  bool isItalic;
  bool isBold;
  double fontSize;

  WeddingInvitation({
    this.title = 'A Celebration of Love',
    this.coupleNames = 'John & Sarah',
    this.backgroundColor = 'White',
    this.eventDate = 'Saturday, 11 October 2025',
    this.eventTime = '2:00 PM',
    this.eventLocation = 'Harbour Point, Victoria Island, Lagos',
    this.ceremonyVenue = 'Quila Hall',
    this.ceremonyTime = '11:00 AM',
    this.receptionVenue = 'Harbour Point',
    this.receptionTime = '2:00 PM',
    this.rsvpPhone = '+234 801 234 5678',
    this.dressCode = 'Emerald & Gold',
    this.gatePassRequired = true,
    this.fontFamily = 'Georgia',
    this.textColor = '#111827',
    this.accentColor = '#0AA83F',
    this.isItalic = false,
    this.isBold = false,
    this.fontSize = 16.0,
  });

  WeddingInvitation copyWith({
    String? title,
    String? coupleNames,
    String? backgroundColor,
    String? eventDate,
    String? eventTime,
    String? eventLocation,
    String? ceremonyVenue,
    String? ceremonyTime,
    String? receptionVenue,
    String? receptionTime,
    String? rsvpPhone,
    String? dressCode,
    bool? gatePassRequired,
    String? fontFamily,
    String? textColor,
    String? accentColor,
    bool? isItalic,
    bool? isBold,
    double? fontSize,
  }) {
    return WeddingInvitation(
      title: title ?? this.title,
      coupleNames: coupleNames ?? this.coupleNames,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      eventDate: eventDate ?? this.eventDate,
      eventTime: eventTime ?? this.eventTime,
      eventLocation: eventLocation ?? this.eventLocation,
      ceremonyVenue: ceremonyVenue ?? this.ceremonyVenue,
      ceremonyTime: ceremonyTime ?? this.ceremonyTime,
      receptionVenue: receptionVenue ?? this.receptionVenue,
      receptionTime: receptionTime ?? this.receptionTime,
      rsvpPhone: rsvpPhone ?? this.rsvpPhone,
      dressCode: dressCode ?? this.dressCode,
      gatePassRequired: gatePassRequired ?? this.gatePassRequired,
      fontFamily: fontFamily ?? this.fontFamily,
      textColor: textColor ?? this.textColor,
      accentColor: accentColor ?? this.accentColor,
      isItalic: isItalic ?? this.isItalic,
      isBold: isBold ?? this.isBold,
      fontSize: fontSize ?? this.fontSize,
    );
  }
}
