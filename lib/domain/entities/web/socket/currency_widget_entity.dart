import 'package:asset_tracker/core/config/theme/extension/currency_widget_title_extension.dart';
import 'package:asset_tracker/data/model/web/direction_model.dart';
import 'package:asset_tracker/domain/entities/web/socket/currency_entity.dart';

class CurrencyWidgetEntity {
  // final String name;
  String name;
  String code;
  String alis;
  String satis;
  Direction dir;
  final CurrencyEntity entity;
  //final kullanılmayan yerlerden dolayı const eklenmedi
  CurrencyWidgetEntity({
    required this.name,
    required this.code,
    required this.alis,
    required this.satis,
    required this.entity,
    required this.dir,
  });

  factory CurrencyWidgetEntity.fromCurrency(CurrencyEntity entity) {
    final String label = setCurrencyLabel(entity.code);
    return CurrencyWidgetEntity(
      name: label,
      code: entity.code,
      alis: entity.alis,
      // 8825.25956 tarzındaki satış değerlerini => 8825.25 şeklinde düzenlemek için
      satis: entity.satis.contains('.')
          ? entity.satis.length - entity.satis.indexOf('.') > 3
              ? entity.satis.substring(0, entity.satis.indexOf('.') + 3) +
                  _currenyType(entity.code)
              : entity.satis + _currenyType(entity.code)
          : entity.satis + _currenyType(entity.code),
      entity: entity,
      dir: entity.dir,
    );
  }

  getCurrencyIcon() {
    const String basePath = "assets/image/currency/";
    if (_currencyContains('GOLD')) {
      return "${basePath}gold_coin.png";
    } else if (_currencyContains("gbp")) {
      return "${basePath}gbp_coin.png";
    } else if (_currencyContains("chf_coin.png")) {
    } else if (_currencyContains("AUD")) {
      return "${basePath}aud_coin.png";
    } else if (_currencyContains("XAU")) {
      return "${basePath}xau_coin.png";
    } else if (_currencyContains("SEK") || _currencyContains("DKK")) {
      return "${basePath}sek_coin.png";
    } else if (_currencyContains("NOK")) {
      return "${basePath}nok_coin.png";
    } else if (_currencyContains("JPY")) {
      return "${basePath}jpy_coin.png";
    } else if (_currencyContains("Silver") || _currencyContains("XAG")) {
      return "${basePath}silver_coin.png";
    } else if (_currencyContains("XPT")) {
      return "${basePath}xpt_coin.png";
    } else if (_currencyContains("SAR")) {
      return "${basePath}sar_coin.png";
    } else if (_currencyContains("GBP")) {
      return "${basePath}gbp_coin.png";
    } else if (_currencyContains("CAD")) {
      return "${basePath}cad_coin.png";
    } else if (_currencyContains('USD')) {
      return "${basePath}usd_coin.png";
    } else if (_currencyContains("EUR")) {
      return "${basePath}euro_coin.png";
    } else {
      return "${basePath}default_coin.png";
    }
  }

  bool _currencyContains(String value) {
    return name.contains(value);
  }

  static String _currenyType(String code) {
    return code.contains("USD")
        ? "\t\$"
        : code.contains("EUR")
            ? "\t€"
            : "\t₺";
  }
}

enum CurrencyDirectionEnum {
  UP('up'),
  DOWN('down'),
  NONE('none');

  final String value;
  const CurrencyDirectionEnum(this.value);
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
