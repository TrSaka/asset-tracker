import 'package:asset_tracker/core/config/theme/extension/currency_widget_title_extension.dart';
import 'package:asset_tracker/domain/entities/web/socket/currency_entity.dart';

class CurrencyWidgetEntity {
  // final String name;
  String? name;
  String code;
  String alis;
  String satis;
  final CurrencyEntity entity;

  CurrencyWidgetEntity({
    this.name,
    required this.code,
    required this.alis,
    required this.satis,
    required this.entity,
  });

  factory CurrencyWidgetEntity.fromCurrency(CurrencyEntity entity) {
    final String label = setCurrencyLabel(entity.code);
    return CurrencyWidgetEntity(
      name: label,
      code: entity.code,
      alis: entity.alis,
      satis: entity.satis,
      entity: entity,
    );
  }
}

String setCurrencyLabel(String currencyCode) {
  String newTitle = currencyTypeMap[currencyCode]?.getCurrencyTitle() ?? "N/A";
  //burası gereksiz zaten switch case default ta N/A döndürecek
  return newTitle; // Return this if no match is found in the map
}

Map<String, String> currencyTypeMap = {
  "ATA5_YENI": "ata5_yeni",
  "ATA5_ESKI": "ata5_eski",
  "GREMESE_YENI": "gremese_yeni",
  "GREMESE_ESKI": "gremese_eski",
  "AYAR14": "ayar14",
  "GUMUSTRY": "gumustry",
  "XAGUSD": "xagusd",
  "GUMUSUSD": "gumususd",
  "AUDUSD": "audusd",
  "GBPUSD": "gbpusd",
  "XPTUSD": "xptusd",
  "XPDUSD": "xpdusd",
  "PLATIN": "platin",
  "PALADYUM": "paladyum",
  "USDJPY": "usdjpy",
  "USDCHF": "usdchf",
  "USDCAD": "usdcad",
  "EURUSD": "eurusd",
  "USDSAR": "usdsar",
  "NOKTRY": "noktry",
  "AUDTRY": "audtry",
  "ALTIN": "altin",
  "USDPURE": "usdpure",
  "USDTRY": "usdtry",
  "ONS": "ons",
  "EURTRY": "eurtry",
  "USDKG": "usdkg",
  "EURKG": "eurkg",
  "AYAR22": "ayar22",
  "GBPTRY": "gbptry",
  "CHFTRY": "chftry",
  "KULCEALTIN": "kulcealtin",
  "XAUXAG": "xauxag",
  "CEYREK_YENI": "ceyrek_yeni",
  "CADTRY": "cadtry",
  "CEYREK_ESKI": "ceyrek_eski",
  "SARTRY": "sartry",
  "YARIM_YENI": "yarim_yeni",
  "YARIM_ESKI": "yarim_eski",
  "JPYTRY": "jpytry",
  "TEK_YENI": "tek_yeni",
  "TEK_ESKI": "tek_eski",
  "SEKTRY": "sektry",
  "ATA_YENI": "ata_yeni",
  "DKKTRY": "dkktry",
  "XAUUSD": "xauusd",
  "PLNTRY": "plntry",
  "HUFTRY": "huftry",
  "ZARTRY": "zartry"
};