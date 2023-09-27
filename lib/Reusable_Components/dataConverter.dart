class DataConverter {
  static String convertJenis(String dropdownValue) {
    if (dropdownValue == 'Semua') {
      return '';
    } else {
      return dropdownValue;
    }
  }

  static String convertBulan(String dropdownValue2) {
    switch (dropdownValue2) {
      case 'Januari':
        return '1';
      case 'Februari':
        return '2';
      case 'Maret':
        return '3';
      case 'April':
        return '4';
      case 'Mei':
        return '5';
      case 'Juni':
        return '6';
      case 'Juli':
        return '7';
      case 'Agustus':
        return '8';
      case 'September':
        return '9';
      case 'Oktober':
        return '10';
      case 'November':
        return '11';
      case 'Desember':
        return '12';
      default:
        return '';
    }
  }

  static String convertTahun(int SelectedYear) {
    return SelectedYear.toString() ?? '';
  }
}
