enum PageType { news, movie, tvSeries }

extension PageTypeExt on PageType {

  static String labelName = "Danh sách";

  String get name {
    switch (this) {
      case PageType.news:
        return "Phim mới";
      case PageType.movie:
        return "Phim lẻ";
      case PageType.tvSeries:
        return "Phim bộ";
    }
  }

  String get jsonName {
    switch (this) {
      case PageType.news:
        return "danh-sach/phim-moi";
      case PageType.movie:
        return "danh-sach/phim-le";
      case PageType.tvSeries:
        return "danh-sach/phim-bo";
    }
  }
}

enum CategoryItem {
  all,
  action,
  romance,
  comedy,
  historical,
  psychological,
  criminal,
  war,
  sports,
  martialArts,
  fantasy,
  adventure,
  scientific,
  horror,
  music,
  mythological,
  document,
  family,
  drama,
  mystery,
  school,
  classic,
  adult
}

extension CategoryItemExtension on CategoryItem {
  static String labelName = "Thể loại";

  String get name {
    switch (this) {
      case CategoryItem.all:
        return "Tất cả";
      case CategoryItem.action:
        return "Hành động";
      case CategoryItem.romance:
        return "Tình cảm";
      case CategoryItem.comedy:
        return "Hài hước";
      case CategoryItem.historical:
        return "Cổ trang";
      case CategoryItem.psychological:
        return "Tâm lý";
      case CategoryItem.criminal:
        return "Hình sự";
      case CategoryItem.war:
        return "Chiến tranh";
      case CategoryItem.sports:
        return "Thể thao";
      case CategoryItem.martialArts:
        return "Võ thuật";
      case CategoryItem.fantasy:
        return "Viễn tưởng";
      case CategoryItem.adventure:
        return "Phiêu lưu";
      case CategoryItem.scientific:
        return "Khoa học";
      case CategoryItem.horror:
        return "Kinh dị";
      case CategoryItem.music:
        return "Âm nhạc";
      case CategoryItem.mythological:
        return "Thần thoại";
      case CategoryItem.document:
        return "Tài liệu";
      case CategoryItem.family:
        return "Gia đình";
      case CategoryItem.drama:
        return "Chính kịch";
      case CategoryItem.mystery:
        return "Bí ẩn";
      case CategoryItem.school:
        return "Học đường";
      case CategoryItem.classic:
        return "Kinh điển";
      case CategoryItem.adult:
        return "Phim 18+";
    }
  }

  String get param {
    switch (this) {
      case CategoryItem.all:
        return "";
      case CategoryItem.action:
        return "hanh-dong";
      case CategoryItem.romance:
        return "tinh-cam";
      case CategoryItem.comedy:
        return "hai-huoc";
      case CategoryItem.historical:
        return "co-trang";
      case CategoryItem.psychological:
        return "tam-ly";
      case CategoryItem.criminal:
        return "hinh-su";
      case CategoryItem.war:
        return "chien-tranh";
      case CategoryItem.sports:
        return "the-thao";
      case CategoryItem.martialArts:
        return "vo-thuat";
      case CategoryItem.fantasy:
        return "vien-tuong";
      case CategoryItem.adventure:
        return "phieu-luu";
      case CategoryItem.scientific:
        return "khoa-hoc";
      case CategoryItem.horror:
        return "kinh-di";
      case CategoryItem.music:
        return "am-nhac";
      case CategoryItem.mythological:
        return "than-thoai";
      case CategoryItem.document:
        return "ta-lieu";
      case CategoryItem.family:
        return "gia-dinh";
      case CategoryItem.drama:
        return "chinh-kich";
      case CategoryItem.mystery:
        return "bi-an";
      case CategoryItem.school:
        return "hoc-duong";
      case CategoryItem.classic:
        return "kinh-dien";
      case CategoryItem.adult:
        return "phim-18";
    }
  }
}

enum CountryItem {
  TatCa,
  TrungQuoc,
  HanQuoc,
  NhatBan,
  ThaiLan,
  AuMy,
  DaiLoan,
  HongKong,
  AnDo,
  Anh,
  Phap,
  Canada,
  Other,
  Duc,
  TayBanNha,
  ThoNhiKy,
  HaLan,
  Indonesia,
  Nga,
  Mexico,
  BaLan,
  Uc,
  ThuyDien,
  Malaysia,
  Brazil,
  Philippines,
  BoDaoNha,
  Y,
  DanMach,
  UAE,
  NaUy,
  ThuySy,
  ChauPhi,
  NamPhi,
  Ukraina,
  ARapXeUt,
}

extension CountryItemExtension on CountryItem {
  static String labelName = "Quốc gia";

  String get param {
    switch (this) {
      case CountryItem.TatCa:
        return "";
      case CountryItem.TrungQuoc:
        return "trung-quoc";
      case CountryItem.HanQuoc:
        return "han-quoc";
      case CountryItem.NhatBan:
        return "nhat-ban";
      case CountryItem.ThaiLan:
        return "thai-lan";
      case CountryItem.AuMy:
        return "au-my";
      case CountryItem.DaiLoan:
        return "dai-loan";
      case CountryItem.HongKong:
        return "hong-kong";
      case CountryItem.AnDo:
        return "an-do";
      case CountryItem.Anh:
        return "anh";
      case CountryItem.Phap:
        return "phap";
      case CountryItem.Canada:
        return "canada";
      case CountryItem.Other:
        return "other";
      case CountryItem.Duc:
        return "duc";
      case CountryItem.TayBanNha:
        return "tay-ban-nha";
      case CountryItem.ThoNhiKy:
        return "tho-nhi-ky";
      case CountryItem.HaLan:
        return "ha-lan";
      case CountryItem.Indonesia:
        return "indonesia";
      case CountryItem.Nga:
        return "nga";
      case CountryItem.Mexico:
        return "mexico";
      case CountryItem.BaLan:
        return "ba-lan";
      case CountryItem.Uc:
        return "uc";
      case CountryItem.ThuyDien:
        return "thuy-dien";
      case CountryItem.Malaysia:
        return "malaysia";
      case CountryItem.Brazil:
        return "brazil";
      case CountryItem.Philippines:
        return "philippines";
      case CountryItem.BoDaoNha:
        return "bo-dao-nha";
      case CountryItem.Y:
        return "y";
      case CountryItem.DanMach:
        return "dan-mach";
      case CountryItem.UAE:
        return "uae";
      case CountryItem.NaUy:
        return "na-uy";
      case CountryItem.ThuySy:
        return "thuy-sy";
      case CountryItem.ChauPhi:
        return "chau-phi";
      case CountryItem.NamPhi:
        return "nam-phi";
      case CountryItem.Ukraina:
        return "ukraina";
      case CountryItem.ARapXeUt:
        return "a-rap-xe-ut";
      default:
        return "";
    }
  }

  String get name {
    switch (this) {
      case CountryItem.TatCa:
        return "Tất Cả";
      case CountryItem.TrungQuoc:
        return "Trung Quốc";
      case CountryItem.HanQuoc:
        return "Hàn Quốc";
      case CountryItem.NhatBan:
        return "Nhật Bản";
      case CountryItem.ThaiLan:
        return "Thái Lan";
      case CountryItem.AuMy:
        return "Âu Mỹ";
      case CountryItem.DaiLoan:
        return "Đài Loan";
      case CountryItem.HongKong:
        return "Hồng Kông";
      case CountryItem.AnDo:
        return "Ấn Độ";
      case CountryItem.Anh:
        return "Anh";
      case CountryItem.Phap:
        return "Pháp";
      case CountryItem.Canada:
        return "Canada";
      case CountryItem.Other:
        return "Khác";
      case CountryItem.Duc:
        return "Đức";
      case CountryItem.TayBanNha:
        return "Tây Ban Nha";
      case CountryItem.ThoNhiKy:
        return "Thổ Nhĩ Kỳ";
      case CountryItem.HaLan:
        return "Hà Lan";
      case CountryItem.Indonesia:
        return "Indonesia";
      case CountryItem.Nga:
        return "Nga";
      case CountryItem.Mexico:
        return "Mexico";
      case CountryItem.BaLan:
        return "Ba Lan";
      case CountryItem.Uc:
        return "Úc";
      case CountryItem.ThuyDien:
        return "Thụy Điển";
      case CountryItem.Malaysia:
        return "Malaysia";
      case CountryItem.Brazil:
        return "Brazil";
      case CountryItem.Philippines:
        return "Philippines";
      case CountryItem.BoDaoNha:
        return "Bồ Đào Nha";
      case CountryItem.Y:
        return "Ý";
      case CountryItem.DanMach:
        return "Đan Mạnh";
      case CountryItem.UAE:
        return "UAE";
      case CountryItem.NaUy:
        return "Na Uy";
      case CountryItem.ThuySy:
        return "Thụy Sỹ";
      case CountryItem.ChauPhi:
        return "Châu Phi";
      case CountryItem.NamPhi:
        return "Nam Phi";
      case CountryItem.Ukraina:
        return "Ukraina";
      case CountryItem.ARapXeUt:
        return "Ả rập xê út";
      default:
        return "";
    }
  }
}
