class StateInfoModel {
  String? state;
  String? notes;
  String? covid19Site;
  String? covid19SiteSecondary;
  String? covid19SiteTertiary;
  String? covid19SiteQuaternary;
  String? covid19SiteQuinary;
  String? twitter;
  String? covid19SiteOld;
  String? covidTrackingProjectPreferredTotalTestUnits;
  String? covidTrackingProjectPreferredTotalTestField;
  String? totalTestResultsField;
  String? pui;
  bool? pum;
  String? name;
  String? fips;

  StateInfoModel(
      {this.state,
      this.notes,
      this.covid19Site,
      this.covid19SiteSecondary,
      this.covid19SiteTertiary,
      this.covid19SiteQuaternary,
      this.covid19SiteQuinary,
      this.twitter,
      this.covid19SiteOld,
      this.covidTrackingProjectPreferredTotalTestUnits,
      this.covidTrackingProjectPreferredTotalTestField,
      this.totalTestResultsField,
      this.pui,
      this.pum,
      this.name,
      this.fips});

  StateInfoModel.fromJson(Map<String, dynamic> json) {
    state = json['state'];
    notes = json['notes'];
    covid19Site = json['covid19Site'];
    covid19SiteSecondary = json['covid19SiteSecondary'];
    covid19SiteTertiary = json['covid19SiteTertiary'];
    covid19SiteQuaternary = json['covid19SiteQuaternary'];
    covid19SiteQuinary = json['covid19SiteQuinary'];
    twitter = json['twitter'];
    covid19SiteOld = json['covid19SiteOld'];
    covidTrackingProjectPreferredTotalTestUnits =
        json['covidTrackingProjectPreferredTotalTestUnits'];
    covidTrackingProjectPreferredTotalTestField =
        json['covidTrackingProjectPreferredTotalTestField'];
    totalTestResultsField = json['totalTestResultsField'];
    pui = json['pui'];
    pum = json['pum'];
    name = json['name'];
    fips = json['fips'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['state'] = state;
    data['notes'] = notes;
    data['covid19Site'] = covid19Site;
    data['covid19SiteSecondary'] = covid19SiteSecondary;
    data['covid19SiteTertiary'] = covid19SiteTertiary;
    data['covid19SiteQuaternary'] = covid19SiteQuaternary;
    data['covid19SiteQuinary'] = covid19SiteQuinary;
    data['twitter'] = twitter;
    data['covid19SiteOld'] = covid19SiteOld;
    data['covidTrackingProjectPreferredTotalTestUnits'] =
        covidTrackingProjectPreferredTotalTestUnits;
    data['covidTrackingProjectPreferredTotalTestField'] =
        covidTrackingProjectPreferredTotalTestField;
    data['totalTestResultsField'] = totalTestResultsField;
    data['pui'] = pui;
    data['pum'] = pum;
    data['name'] = name;
    data['fips'] = fips;
    return data;
  }
}
