enum Region {
  SEOUL(1, 'Seoul', '서울'),
  INCHEON(2, 'Incheon', '인천'),
  GYEONGGI(3, 'Gyeonggi', '경기'),
  DAEJEON(4, 'Daejeon', '대전'),
  CHUNGCHEONG(5, 'Chungcheong', '충청'),
  DAEGU(6, 'Daegu', '대구'),
  GYEONGSANG(7, 'Gyeongsang', '경상'),
  ULSAN(8, 'Ulsan', '울산'),
  BUSAN(9, 'Busan', '부산'),
  GWANGJU(10, 'Gwangju', '광주'),
  JEONLA(11, 'Jeonla', '전라'),
  GANGWON(12, 'Gangwon', '강원'),
  JEJU(13, 'Jeju', '제주');

  const Region(this.id, this.englishName, this.koreanName);

  final int id;
  final String englishName;
  final String koreanName;

  factory Region.fromId(int id) {
    return Region.values.firstWhere((element) => element.id == id);
  }

  factory Region.fromEnglishName(String englishName) {
    return Region.values.firstWhere(
        (element) => element.englishName.toUpperCase() == englishName.toUpperCase());
  }

  factory Region.fromKoreanName(String koreanName) {
    return Region.values.firstWhere((element) => element.koreanName == koreanName);
  }
}