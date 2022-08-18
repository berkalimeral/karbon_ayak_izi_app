class SliderModel {
  String imageAssetPath;
  String title;
  String desc;

  SliderModel(this.imageAssetPath, this.title, this.desc);

  String getImageAssetPath() {
    return imageAssetPath;
  }

  String getTitle() {
    return title;
  }

  String getDesc() {
    return desc;
  }
}

class OnBoardModel {
  static final List<SliderModel> slides = <SliderModel>[
    SliderModel(
      "assets/illustration.png",
      "Merhaba Dostum,",
      "Karbon Ayak İzin'i indirdiğin için ve gelecek nesillerimizi daha güvenli hale getirmek için ilk adımı attığın için teşekkür ederiz."),
      SliderModel(
      "assets/illustration2.png",
      "Etkinizi Anlayın",
      "Faaliyetlerinin bitkileri, hayvanları ve daha fazlasını nasıl etkilediğini gör."),
      SliderModel(
      "assets/illustration3.png",
      "Etkiyi azaltmak için harekete geç",
      "Her gün küçük adımlar atmak, gelecek için büyük değişiklikleri yönlendirmek için temel taşlardır.")
  ];

}
