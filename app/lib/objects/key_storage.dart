import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

//Used to create and keep track of the local file stored on the phone
class KeyStorage {
  // finds the local document directory on phone for persistent storage
  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();

    return directory.path;
  }

  // create a reference to the local file location
  Future<File> get _localFile async {
    final path = await _localPath;
    final name = p.join(path, "MYCHIPsPersonalKey.txt");
    return File(name);
  }

  // reads the personal key stored on the phone
  Future<String> readKeyValue() async {
    try {
      final file = await _localFile;

      if (file.existsSync()) {
        String contents = await file.readAsString();
        return contents;
      } else {
        // This should only should only ever fire once per phone/emulator
        // Their key will be deleted upon deletion of the app
        // TODO: Generate the string randomly according to how Kyle would want it (the information should be somewhat specific)
        String uniqueValue =
            "308204BD020100300D06092A864886F70D0101010500048204A7308204A30201000282010100D40B70B0AC85EA1F7F3968EABBDC5BABFD72CBE5B0EF04359F943A03E7E918DC6C58C0FAF30F77E5696912D14877708C19B273423D989E50EBE31E024AD4A699F35AE4134A70F174FC64D552128C226ADAD7013970D41C01108577E38DFEDEA5423049825B1080D0BE322A1136D778BBD7BE6D6F8200D323C49C01AA15068066E1374B453B601D7A83F1AFFBBB39BA02E8B097899F1C00FD92CC4FD8A1B9EBCC5A3913E37D493D0BA7A91F0355B3FCD9BE44BC4A71D767972D805863DE1DA6D02C55726EE6B3871ECB44F7E5CBE834B1B05495F7DC2D2269294DD87004207E8250E3836E21A3B58E1F5C6029DAFC6285D4CE04E029D439765D1B1DD3E96FB415020301000102820100017948E1B9793ECCD43E0A6823411F53FD317890529FFEA7FEC1717BC8775AC8616A6680F802820352ADBBC73F9930EB905C28A7EBB4AD5903A2B2F9321AF3437BA9048FCBC3283277749DF4F1930EC42E5C33327A81C6E60CFED87BF8E72E15F8F54BF57F7B8861AB08BF391A67F9FB583F0714B0D31FA48E7FC515310B38063BC95EA57D2684A0700F397DDF2CE940D1E19F59BFD77F5868884B346B2AC0A6DD425FECD566FB02F83894A7C61E94D695EA81380B97D804BB452E25337FED91BF101DA1CD91AB4BDC667C340D81E09DECDD61E7A391DFD3252A847996DE593753546043C2CFE1CB12B6D9F94D5F8742B84CC270E7762438A8E4FFEB9460F71102818100F4CB153A7CF29902B1C3B128D4D501CAB0B96A87584000D3DF3F90CEBB4CFFE8946D57BFCAC24965B06A0F60045F8F535A267BE9B15B23C6BD6FCACE54F159E577A09B5E61B4DA4545DE92E6C37BED7D32D17B30BE8BFA86C21FFB68F95566E61781794595FBDD364D54CFE42092D5103328853CB2B7B15DDF6BAE973FF08BA902818100DDC08D3C08E43A9658B132C1AA192B05D79C8F6F3354BACE711E2D133ED8EE5A68A5B1E7F0742C28C921E7D0F7C4DB0663815F42CA1A21352874EBCA00CF8744D5F16DBB42B131303E1C264F48884F2F295136DDE44BC9BC30DA52FDDB566CF0805D7D9391320AF336F4596399E90E4DB1ACF35296D704F9CBB7682ACA59888D028180540D936974D3BC143FC3A90613265CAA234A5738C7E59A2325E9E6A8058A27E8CD664A1611E1EA5FDF565B972589466661730B632FC1D2A40011EDBA31527A029FB3E7055E5942053D3B72878821FA66DDD72E0C8BB0F6C1E4D0247C63F89E0F6D8CC87E4B44A32D6D1A2D13F0D75A0F68F185E6549B5C6C96359C4A54EB1C9902818100BE1853BA9450BA1CAA7974EE6A17DB36CDE7AB5A0361EE260CF876619A2DB2DE93F8FEF2BAC18C1D869667384F3E55183BF2EAABC1BEF69AB04CD2D8BF2B28658D15C32095827A8D45A1320223469EC2EA2371EA73CBB86B7861A0657842B56ED24BD2DBCECB5C71B4B9716B9DC418FBE78540AD9B1B466BB1044FEAE6BE2BFD0281802340314076682745A7E283D922DAF6C67D141A8DB9D8490B08513DCB6569BCD13BF3E5E4DD00C0368FCB71288D5B815487C58C97007801FA64F82200F35DBA384DE9D12A3999AC1D5087C96E703AE12ED623FF62117BF0BA492FF5F54D8D24D70BF32FEF1958F15293692D5061D31181ABCF2423669B65D8A4AE798C6B433280";
        writeKeyValue(uniqueValue);
        return uniqueValue;
      }
    } catch (e) {
      // If encountering an error, return string
      return "Something went wrong";
    }
  }

  void writeKeyValue(String key) async {
    final file = await _localFile;
    // Write the file
    file.writeAsString(key);
  }
}
