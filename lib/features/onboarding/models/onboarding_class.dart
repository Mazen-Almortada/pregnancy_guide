class OnboardingClass {
  final String title;
  final String discription;
  final String image;
  OnboardingClass({
    required this.title,
    required this.discription,
    required this.image,
  });
}

List<OnboardingClass> contents = [
  OnboardingClass(
      title: 'استكشاف رحلتك الممتعة نحو الأمومة',
      image: 'assets/images/1.webp',
      discription:
          "استمتع برحلة فريدة ومميزة نحو الأمومة مع تطبيق Pregnancy Tracker سنكون معك في كل خطوة من الطريق، نقدم لك معلومات مفصلة ونصائح مخصصة لكل مرحلة من مراحل الحمل. دعنا نكون رفيقك الموثوق به خلال هذه التجربة الرائعة."),
  OnboardingClass(
      title: 'تابع نمو جنينك واحتفظ بسجلاتك الصحية',
      image: 'assets/images/2.webp',
      discription:
          "مع Pregnancy Tracker، ستكون لديك وسيلة سهلة ومريحة لتتبع نمو جنينك وتسجيل كل لحظة من رحلتك الرائعة للأمومة. سنوفر لك أدوات متقدمة لتسجيل المعلومات الطبية والمواعيد الهامة، مما يساعدك على الاستمتاع بحمل صحي وسعيد."),
  OnboardingClass(
      title: "اكتشف نصائحنا المفيدة للحفاظ على صحتك وسلامة جنينك",
      image: 'assets/images/3.webp',
      discription:
          "نحن هنا لندعمك في رعاية صحتك وسلامة جنينك طوال فترة الحمل. سنقدم لك نصائح قيمة ومفيدة حول التغذية السليمة، وممارسة التمارين الرياضية المناسبة، والعناية بصحتك النفسية. دعنا نساعدك على الاستمتاع بحمل آمن وسليم."),
];
