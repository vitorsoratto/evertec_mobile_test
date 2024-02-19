import 'package:evertec_mobile_test/app/modules/details/models/state_current.dart';
import 'package:evertec_mobile_test/app/modules/details/models/state_info.dart';

class StateDetailModel {
  String? state;
  String? notes;
  String? covid19Site;
  String? covid19SiteSecondary;
  String? covid19SiteTertiary;
  String? twitter;
  String? covid19SiteOld;
  String? covidTrackingProjectPreferredTotalTestUnits;
  String? covidTrackingProjectPreferredTotalTestField;
  String? totalTestResultsField;
  String? pui;
  bool? pum;
  String? name;
  String? fips;
  StateCurrentModel? stateCurrent;
  StateInfoModel? stateInfo;

  StateDetailModel({
    this.state,
    this.notes,
    this.covid19Site,
    this.covid19SiteSecondary,
    this.covid19SiteTertiary,
    this.twitter,
    this.covid19SiteOld,
    this.covidTrackingProjectPreferredTotalTestUnits,
    this.covidTrackingProjectPreferredTotalTestField,
    this.totalTestResultsField,
    this.pui,
    this.pum,
    this.name,
    this.fips,
    this.stateCurrent,
    this.stateInfo,
  });

  StateDetailModel.fromJson(Map<String, dynamic> json) {
    state = json['state'];
    notes = json['notes'];
    covid19Site = json['covid19Site'];
    covid19SiteSecondary = json['covid19SiteSecondary'];
    covid19SiteTertiary = json['covid19SiteTertiary'];
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
    stateCurrent = json['stateCurrent'] != null
        ? StateCurrentModel.fromJson(json['stateCurrent'])
        : null;
    stateInfo = json['stateInfo'] != null
        ? StateInfoModel.fromJson(json['stateInfo'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['state'] = state;
    data['notes'] = notes;
    data['covid19Site'] = covid19Site;
    data['covid19SiteSecondary'] = covid19SiteSecondary;
    data['covid19SiteTertiary'] = covid19SiteTertiary;
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
    if (stateCurrent != null) {
      data['stateCurrent'] = stateCurrent!.toJson();
    }
    if (stateInfo != null) {
      data['stateInfo'] = stateInfo!.toJson();
    }
    return data;
  }
}
