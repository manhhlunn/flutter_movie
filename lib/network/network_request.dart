import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_movie/model/movie.dart';
import 'package:flutter_movie/model/movie_detail.dart';
import 'package:http/http.dart';

class NetworkRequest {
  static const String domain = "ophim1.com";
  static String imageDomain = "ophim1.com";

  static Future<MovieResponse> fetchList(PageType pageType, int page,
      String category, String country, String keyword) async {
    final query = {
      'page': '$page',
      'category': category,
      'country': country,
      'keyword': keyword
    };

    final uri = Uri.https(domain, "/v1/api/${pageType.jsonName}", query);
    final response = await get(uri);
    if (response.statusCode == 200) {
      return MovieResponse.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Failed to fetchList type: $pageType");
    }
  }

  static Future<MovieDetail> fetchData(String slug) async {
    final uri = Uri.https(domain, "/v1/api/phim/$slug");
    final response = await get(uri);
    if (response.statusCode == 200) {
      return MovieDetail.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to fetchData slug:$slug');
    }
  }
}

enum PageType {
  homes,
  search,
  movie,
  tvSeries,
}

extension PageTypeExt on PageType {
  IconData get icon {
    switch (this) {
      case PageType.homes:
        return CupertinoIcons.home;
      case PageType.movie:
        return CupertinoIcons.film;
      case PageType.tvSeries:
        return CupertinoIcons.tv;
      case PageType.search:
        return CupertinoIcons.search;
    }
  }

  String get name {
    switch (this) {
      case PageType.homes:
        return "Phim mới";
      case PageType.movie:
        return "Phim lẻ";
      case PageType.tvSeries:
        return "Phim bộ";
      case PageType.search:
        return "Tìm kiếm";
    }
  }

  String get jsonName {
    switch (this) {
      case PageType.homes:
        return "danh-sach/phim-moi";
      case PageType.movie:
        return "danh-sach/phim-le";
      case PageType.tvSeries:
        return "danh-sach/phim-bo";
      case PageType.search:
        return "tim-kiem";
    }
  }
}

enum CategoryItem {
  tat_ca,
  hanh_dong,
  tinh_cam,
  hai_huoc,
  co_trang,
  tam_ly,
  hinh_su,
  chien_tranh,
  the_thao,
  vo_thuat,
  vien_tuong,
  phieu_luu,
  khoa_hoc,
  kinh_di,
  am_nhac,
  than_thoai,
  tai_lieu,
  gia_dinh,
  chinh_kich,
  bi_an,
  hoc_duong,
  kinh_dien,
  phim_18
}

extension CategoryItemExtension on CategoryItem {
  static String labelName = "Thể loại";

  String get name {
    switch (this) {
      case CategoryItem.tat_ca:
        return "Tất cả";
      case CategoryItem.hanh_dong:
        return "Hành động";
      case CategoryItem.tinh_cam:
        return "Tình cảm";
      case CategoryItem.hai_huoc:
        return "Hài hước";
      case CategoryItem.co_trang:
        return "Cổ trang";
      case CategoryItem.tam_ly:
        return "Tâm lý";
      case CategoryItem.hinh_su:
        return "Hình sự";
      case CategoryItem.chien_tranh:
        return "Chiến tranh";
      case CategoryItem.the_thao:
        return "Thể thao";
      case CategoryItem.vo_thuat:
        return "Võ thuật";
      case CategoryItem.vien_tuong:
        return "Viễn tưởng";
      case CategoryItem.phieu_luu:
        return "Phiêu lưu";
      case CategoryItem.khoa_hoc:
        return "Khoa học";
      case CategoryItem.kinh_di:
        return "Kinh dị";
      case CategoryItem.am_nhac:
        return "Âm nhạc";
      case CategoryItem.than_thoai:
        return "Thần thoại";
      case CategoryItem.tai_lieu:
        return "Tài liệu";
      case CategoryItem.gia_dinh:
        return "Gia đình";
      case CategoryItem.chinh_kich:
        return "Chính kịch";
      case CategoryItem.bi_an:
        return "Bí ẩn";
      case CategoryItem.hoc_duong:
        return "Học đường";
      case CategoryItem.kinh_dien:
        return "Kinh điển";
      case CategoryItem.phim_18:
        return "Phim 18+";
    }
  }

  String get param {
    switch (this) {
      case CategoryItem.tat_ca:
        return "";
      case CategoryItem.hanh_dong:
        return "hanh-dong";
      case CategoryItem.tinh_cam:
        return "tinh-cam";
      case CategoryItem.hai_huoc:
        return "hai-huoc";
      case CategoryItem.co_trang:
        return "co-trang";
      case CategoryItem.tam_ly:
        return "tam-ly";
      case CategoryItem.hinh_su:
        return "hinh-su";
      case CategoryItem.chien_tranh:
        return "chien-tranh";
      case CategoryItem.the_thao:
        return "the-thao";
      case CategoryItem.vo_thuat:
        return "vo-thuat";
      case CategoryItem.vien_tuong:
        return "vien-tuong";
      case CategoryItem.phieu_luu:
        return "phieu-luu";
      case CategoryItem.khoa_hoc:
        return "khoa-hoc";
      case CategoryItem.kinh_di:
        return "kinh-di";
      case CategoryItem.am_nhac:
        return "am-nhac";
      case CategoryItem.than_thoai:
        return "than-thoai";
      case CategoryItem.tai_lieu:
        return "ta-lieu";
      case CategoryItem.gia_dinh:
        return "gia-dinh";
      case CategoryItem.chinh_kich:
        return "chinh-kich";
      case CategoryItem.bi_an:
        return "bi-an";
      case CategoryItem.hoc_duong:
        return "hoc-duong";
      case CategoryItem.kinh_dien:
        return "kinh-dien";
      case CategoryItem.phim_18:
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
