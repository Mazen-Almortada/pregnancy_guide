import 'package:flutter/material.dart';
import 'package:pregnancy_guide/core/style/app_colors.dart';
import 'package:pregnancy_guide/core/style/app_text_style.dart';

class AdviceScreen extends StatefulWidget {
  const AdviceScreen({super.key, this.index = 0});
  final int index;

  @override
  State<AdviceScreen> createState() => _AdviceScreenState();
}

class _AdviceScreenState extends State<AdviceScreen> {
  final images = [
    [
      'assets/images/1-1.jpg',
      'assets/images/1-2.jpg',
      'assets/images/1-3.jpg',
      'assets/images/1-4.jpg',
    ],
    [
      'assets/images/2-1.jpg',
      'assets/images/2-2.jpg',
    ],
    [
      'assets/images/3-1.jpg',
      'assets/images/3-2.jpg',
      'assets/images/3-3.jpg',
    ],
    [
      'assets/images/4-1.jpg',
      'assets/images/4-2.jpg',
      'assets/images/4-3.jpg',
    ],
    [
      'assets/images/5-1.jpg',
      'assets/images/5-2.jpg',
    ],
    [
      'assets/images/6-1.jpg',
      'assets/images/6-2.jpg',
      'assets/images/6-3.jpg',
    ],
    [
      'assets/images/7-1.jpg',
      'assets/images/7-2.jpg',
    ],
    [
      'assets/images/8-1.jpg',
      'assets/images/8-2.jpg',
    ],
    [
      'assets/images/9-1.jpg',
    ],
  ];

  @override
  void initState() {
    setState(() {
      index = widget.index;
    });
    super.initState();
  }

  List<String> content = [
    """ ١-التقليل من العمل\n
٢-اخذ حمض الفوليك\n
٣-ممنوع التعرض للتدخين أثناء الحمل\n
٤- يجب أن تقللي من الكافين\n
٥- تحققي جيدا قبل اخذ اي ادويه\n
٦-الحصول ع اكبر قدر من الراحه\n
٧-القيام بالأعمال المنزليه بأمان""",
    """ ١-المتابعه الطبيه\n
٢-شرب الماء الغني بالحديد والكالسيوم\n
٣-البعد عن الاجتهاد\n
٤-ممارسه الرياضه الخفيفه\n
٥-اخذ الفيتامينات ومن ضمنها حمض الفوليك\n
٦-عدم الوقوف لفترات زمنيه طويله\n
٧-تجنب حمل الاشياء الثقيله او دفع الاثاث""",
    """ ١-اتباع نظام غذائي منتظم ومتوازن\n
٢-الابتعاد نهائياً عن اخذ الادويه في الأشهر الأولى الا بعد استشاره الطبيب\n 
٣-ترتيب موعد لزياره الطبيب\n
٤-تناول المأكولات البحريه مره بالأسبوع\n
٥-عدم ارتداء الاحذيه ذات الكعب العالي\n
٦-حافظي على جسدك من الإرهاق\n
٧-تجنبي الإفراط في السهر""",
//#####3
    """١-الاستمرار بتناول الفيتامينات والمتممات الغذائيه\n
٢-القيام بالتمارين الرياضيه الخاصه بالحوامل\n
٣-شرب الكثير من الماء والسوائل  للحفاظ على ضغط الدم\n
٤-تناول مايكفي من السعرات الحرارية اليوميه بمعدل يزيد 300سعره حراريه""",

    """١-ارتداء الملابس الفضفاضه والواسعه وتجنب الملابس الضيقه التي تضغط على منطقه أسفل البطن\n
٢-تجنب الإكثار من الملح حتى لا تتعرضي لارتفاع ضغط الدم\n
٣-رفع القدمين عند الجلوس وخاصه في الشهر السادس\n
٤-تجنب الإكثار من المشروبات الغازيه والأطعمة التي تحتوي على مواد حافظه\n
٥-الابتعاد عن العصبيه والتوتر والخلود إلى النوم والراحه لفترات كافيه\n
٦-تجنب التعرض لاشعه الشمس لفترات طويله لتجنب ظهور الكلف والنمش""",
    """١-القيام بالفحوصات المطلوبه\n
٢-تناول الخضراوات ذات الأوراق الخضراء\n
٣-الحرص على النوم على الجانب الأيسر مع وضع وساده بين الركبتين للتأكد من تدفق الدم إلى الجنين بالشكل الصحيح\n
٤-ترطيب البشره بشكل منتظم وخاصه عند منطقه الثدي والبطن والارداف والورك  3مرات  في اليوم للتقليل من ظهور  علامات التمدد""",
    """ ١-تجنب تناول الأطعمة الحاره والمقليه والحمضيه واستبدالها بالاطعمه التي تحتوي على الحبوب الكامله والخضراوات والفواكه\n
٢-عدم العبث بأي حبوب تظهر على الجلد وعدم فرك اي جروح تجنب تهيج الجلد\n
٣-عدم النوم على الظهر تجنب لخطر عدم تدفق الدم إلى كل من الام والجنين خلال النوم\n
٤-عدم الحفاظ على وضعيه واحده عند الجلوس وتغير وضعيه الجسم بشكل منتظم مع المحافظه على الحركه""",
    """١-التأكد من زياره الطبيب بشكل دوري ومنتظم خاصه اذا لاحظت اي أعراض غريبه\n
٢-قياس السكر بشكل مستمر والحد من تناول السكريات لتجنب حدوث سكر الحمل\n
٣-قد تشعرين احياناً بتسرب البول اذا عطستِ او سعلتِ او ضحكت لا تفزعي ولكن عليك القيام بتمارين واستشيري طبيبك\n
٤-لا تظلي واقفه لمده طويله واجلسي بشكل مريح وضعي وسادات مناسبه وراء ظهرك وارفعي قدميك\n
٥-ابدئي بممارسه المشي من الشهر الثامن لمده نصف ساعه يومياً واختاري وقت تكون حرارته منخفضه\n
٦-كلي كل ساعتين وجبات صغيره خفيفه ومتنوعه صحيه\n
٧-تناولي طعام صحي ومتوازن وأكثري من الألياف لتجنب الإمساك""",
    """١-والاسترخاء والاهتمام بحالتها النفسية واجب الحامل، مع الالتزام بزيارة الطبيب بحسب المواعيد المحددة مرة كل أسبوع في الشهر التاسع.\n
٢-تناولي كمية مناسبة من اللحوم والفاصوليا والفواكه المجففة، والخضروات الورقية، فهي غنية بالحديد.. فالتغذية عموماً تلعب دوراً أساسياً في الحفاظ على صحة الأم والجنين، وتزداد أهمية الفيتامينات والمعادن في هذا الشهر.\n
٣-عدم تناول الأدوية المهدئة بدون استشارة طبية، مع القيام بأي نوع من الرياضة في الأماكن المفتوحة، لتحسين الدورة الدموية، وتغذية الجنين\n
٤-المشي اليومي دون إجهاد مهم لتسهيل عملية الولادة، ولتحسين لياقة الأم وتنشيط الجسم وتحريك الدورة الدموية\n
٥-الاستحمام بالماء الدافئ وعمل جلسات مساج وتدليك؛ تخفف من آلام الحمل وتهيئ الجسم للولادة.\n
٦-- ويُنصح بمراجعة المستشفى عند بدء التقلصات القوية والمنتظمة، والتي تتكرّر كل 4 -5 دقائق، والتي تستمر من ساعة إلى ساعتين متواصلتين.\n
٧-يُنصح بالتحضير ليوم الولادة مع بداية الشهر التاسع؛ للتأكد من إعداد كل ما يلزم الولادة ومدة البقاء في المستشفى\n
٨-- - إجراء الحجوزات اللازمة في المستشفى وتجهيز المبلغ المطلوب، وتحضير حقيبة للوازم البقاء في المستشفى؛ مثل الملابس، وحاجات الطفل."""
  ];

  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_forward_ios_rounded,
              textDirection: TextDirection.ltr,
              color: AppColors.darkColor2,
            )),
        title: Text("نصائح",
            style: AppTextStyle.primaryTextStyle.copyWith(
              fontSize: 20,
              color: AppColors.darkColor1,
              fontWeight: FontWeight.bold,
            )),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(15),
            child: Card(
              elevation: 3,
              color: AppColors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  textDirection: TextDirection.ltr,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CircleAvatar(
                      backgroundColor: const Color.fromARGB(255, 245, 208, 223),
                      radius: 20,
                      child: IconButton(
                          onPressed: () {
                            if (index > 0) {
                              setState(() {
                                index = index - 1;
                              });
                            }
                          },
                          icon: const Icon(
                            Icons.arrow_back_ios_new_rounded,
                            textDirection: TextDirection.rtl,
                            size: 20,
                            color: AppColors.darkColor2,
                          )),
                    ),
                    Text("الشهر  ${index + 1}",
                        style: AppTextStyle.secondaryTextStyle.copyWith(
                          fontSize: 20,
                          color: AppColors.darkColor1,
                          fontWeight: FontWeight.bold,
                        )),
                    CircleAvatar(
                      radius: 20,
                      backgroundColor: const Color.fromARGB(255, 245, 208, 223),
                      child: IconButton(
                          onPressed: () {
                            if (index < 8) {
                              setState(() {
                                index = index + 1;
                              });
                            }
                          },
                          icon: const Icon(
                            Icons.arrow_forward_ios_rounded,
                            textDirection: TextDirection.ltr,
                            size: 20,
                            color: AppColors.darkColor2,
                          )),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.all(10),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Text(content[index],
                      style: AppTextStyle.primaryTextStyle.copyWith(
                        fontSize: 15,
                        height: 1.6,
                        color: AppColors.darkColor1,
                        fontWeight: FontWeight.bold,
                      )),
                  const SizedBox(
                    height: 15,
                  ),
                  Column(
                    children: images[index].map((imagePath) {
                      return Image.asset(imagePath);
                    }).toList(),
                  )
                ],
              ),
            ),
          ))
        ],
      ),
    );
  }
}
