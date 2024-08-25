import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_appk/map_screen.dart';
import 'customStepper.dart' as custom_stepper;

import 'pocs.dart';

void main() {
  runApp(const Myapp());
}

class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    final infoKey = GlobalKey();
    final serviceKey = GlobalKey();

    return MaterialApp(
        theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(
                seedColor: Colors.deepOrange, brightness: Brightness.dark)),
        scrollBehavior: MyCustomScrollBehavior(),
        home: Scaffold(
            appBar: AppBar(
              title: const Text("КотлоЭнергоСтрой"),
            ),
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Head(
                    onInfoTap: () {
                      Scrollable.ensureVisible(infoKey.currentContext!,
                          duration: const Duration(seconds: 1));
                    },
                    onServiceTap: () {
                      Scrollable.ensureVisible(serviceKey.currentContext!,
                          duration: const Duration(seconds: 1));
                    },
                  ),
                  Padding(
                    key: serviceKey,
                    padding:
                        const EdgeInsets.only(left: 20, top: 16, bottom: 16),
                    child: const Text("Услуги",
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold)),
                  ),
                  ExpansionTile(
                      title: Text("Газоснабжение"),
                      initiallyExpanded: true,
                      children: [
                        SizedBox(
                          height: 300,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: const [
                              image(im: "assets/gaz.JPG"),
                              image(im: "assets/Gaz1.JPG"),
                              image(im: "assets/gaz3.JPG"),
                            ],
                          ),
                        ),
                      ]),
                  ExpansionTile(
                    title: Text("Канализация"),
                    children: [
                      SizedBox(
                        height: 300,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: const [
                            image(im: "assets/tryba.jpg"),
                            image(im: "assets/kanalizatsionnye-truby.jpg"),
                            image(im: "assets/canRender.jpg"),
                          ],
                        ),
                      ),
                    ],
                  ),
                  ExpansionTile(title: Text("Водоснабжение"), children: [
                    SizedBox(
                      height: 300,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: const [
                          image(im: "assets/tryba.jpg"),
                          image(im: "assets/tryba1.jpg"),
                          image(im: "assets/tryba2.jpg"),
                          image(im: "assets/tryba3.jpg"),
                        ],
                      ),
                    ),
                  ]),
                  ExpansionTile(
                      title: Text("Дымоходы и вентиляция"),
                      children: [
                        SizedBox(
                            height: 300,
                            child: ListView(
                              scrollDirection: Axis.horizontal,
                              children: const [
                                image(im: "assets/vent.jpeg"),
                                image(im: "assets/vent.jpeg"),
                                image(im: "assets/vent.jpeg"),
                              ],
                            )),
                      ]),
                  Mail(
                    key: infoKey,
                    MapScreen: null,
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 20, top: 16, bottom: 16),
                    child: const Text("Этапы газофикации",
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold)),
                  ),
                  const StepperExample(),
                  Info(),
                  const SizedBox(height: 500, child: MapScreen()),
                ],
              ),
            )));
  }
}

class image extends StatelessWidget {
  final im;
  const image({
    this.im,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image(
          image: AssetImage(im),
        ),
      ),
    );
  }
}

class Head extends StatelessWidget {
  final Null Function() onServiceTap;
  final Null Function() onInfoTap;
  const Head({super.key, required this.onInfoTap, required this.onServiceTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 800,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
          colorFilter:
              ColorFilter.mode(Colors.black.withOpacity(0.4), BlendMode.darken),
          image: const AssetImage("assets/fon.jpg"),
          fit: BoxFit.cover,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(28.0),
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                (constraints.maxWidth > 600)
                    ? const Row(
                        children: [
                          Flexible(
                            flex: 3,
                            child: Text(
                              'Строительство инженерных систем, газоснабжение котельных. Газоснабжение жилых домов, СНТ, коттеджных посёлков. Системы водоснабжения отопления и водоотведения. Системы вентиляции и дымоходов. Теплотрассы',
                              style: TextStyle(
                                fontFamily: 'Roboto',
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          Spacer()
                        ],
                      )
                    : const Text(
                        'Строительство инженерных систем, газоснабжение котельных. Газоснабжение жилых домов, СНТ, коттеджных посёлков. Системы водоснабжения отопления и водоотведения. Системы вентиляции и дымоходов. Теплотрассы',
                        style: TextStyle(
                          fontFamily: 'Roboto',
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center,
                      ),
                const SizedBox(height: 20),
                 (constraints.maxWidth > 600) ?
                Row(
                  children: [
                    SizedBox(
                      height: 75,
                      width: 200,
                      child: ElevatedButton(
                        onPressed: onInfoTap,
                        child: const Text("Оставить заявку",
                            style: TextStyle(fontSize: 18)),
                      ),
                    ),
                    const SizedBox(width: 12),
                    SizedBox(
                      height: 75,
                      width: 200,
                      child: TextButton(
                        onPressed: onServiceTap,
                        child: Text(
                          "Услуги",
                          style: TextStyle(
                              fontSize: 18,
                              decoration: TextDecoration.underline,
                              decorationColor:
                                  Theme.of(context).colorScheme.primary),
                        ),
                      ),
                    ),
                  ],
                ) : Column(
                  children: [
                    SizedBox(
                      height: 75,
                      width: 200,
                      child: ElevatedButton(
                        onPressed: onInfoTap,
                        child: const Text("Оставить заявку",
                            style: TextStyle(fontSize: 18)),
                      ),
                    ),
                    const SizedBox(height: 12),
                    SizedBox(
                      height: 75,
                      width: 200,
                      child: TextButton(
                        onPressed: onServiceTap,
                        child: Text(
                          "Услуги",
                          style: TextStyle(
                              fontSize: 18,
                              decoration: TextDecoration.underline,
                              decorationColor:
                                  Theme.of(context).colorScheme.primary),
                        ),
                      ),
                    ),
                  ]
                ),
              ],
            );
          }
        ),
      ),
    );
  }
}

class Mail extends StatefulWidget {
  const Mail({
    super.key,
    required MapScreen,
  });

  @override
  State<Mail> createState() => _MailState();
}

class _MailState extends State<Mail> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
          colorFilter:
              ColorFilter.mode(Colors.black.withOpacity(0.4), BlendMode.darken),
          image: const AssetImage("assets/post.jpg"),
          fit: BoxFit.cover,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text("Оставить заявку", style: TextStyle(fontSize: 24)),
              ),
              TextFormField(
                onChanged: (value) {},
                controller: nameController,
                decoration: const InputDecoration(
                  hintText: 'Фамилия Имя Отчество',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Введите Фамилию Имя Отчество';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: emailController,
                decoration: const InputDecoration(
                  hintText: 'email@example.com',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Введите email';
                  }
                  if (!RegExp(
                          r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$")
                      .hasMatch(value)) {
                    return 'Введите корректный E-mail';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 12),
              SizedBox(
                height: 75,
                width: 200,
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      submitForm(nameController.text, emailController.text,
                          "Просьба связатся с нами");
                    }
                  },
                  child: const Text("Отправить"),
                  style: const ButtonStyle(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class StepperExample extends StatefulWidget {
  const StepperExample({super.key});

  @override
  State<StepperExample> createState() => _StepperExampleState();
}

class _StepperExampleState extends State<StepperExample> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return SizedBox(
        height: (constraints.maxWidth > 700) ? 200 : null,
        child: custom_stepper.Stepper(
          type: (constraints.maxWidth > 700)
              ? custom_stepper.StepperType.horizontal
              : custom_stepper.StepperType.vertical,
          physics: const NeverScrollableScrollPhysics(),
          controlsBuilder: (context, details) {
            return Padding(
              padding: const EdgeInsets.only(top: 12),
              child: Row(
                children: <Widget>[
                  if (_index < 3)
                    ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(
                            Theme.of(context).colorScheme.primary),
                        foregroundColor: MaterialStatePropertyAll(
                            Theme.of(context).colorScheme.onPrimary),
                      ),
                      onPressed: details.onStepContinue,
                      child: const Text('Далее'),
                    ),
                  const SizedBox(width: 12),
                  if (_index > 0)
                    TextButton(
                      onPressed: details.onStepCancel,
                      child: const Text('Назад'),
                    ),
                ],
              ),
            );
          },
          currentStep: _index,
          onStepCancel: () {
            if (_index > 0) {
              setState(() {
                _index -= 1;
              });
            }
          },
          onStepContinue: () {
            if (_index < 3) {
              setState(() {
                _index += 1;
              });
            }
          },
          onStepTapped: (int index) {
            setState(() {
              _index = index;
            });
          },
          steps: <custom_stepper.Step>[
            custom_stepper.Step(
              title: const Text('Подача заявки'),
              content: Container(
                alignment: Alignment.centerLeft,
                child: const Text(
                    'Заключение договора с АО "Газпром газораспределение Тверь" на технологическое присоединение к газовым сетям.'),
              ),
            ),
            custom_stepper.Step(
              title: const Text('Проектирование'),
              content: Container(
                  alignment: Alignment.centerLeft,
                  child: const Text('Разработка проекта газоснабжения')),
            ),
            custom_stepper.Step(
              title: const Text('Строительство'),
              content: Container(
                alignment: Alignment.centerLeft,
                child: const Text(
                    'Поставка материалов и выполнение монтажных работ на объекте.'),
              ),
            ),
            custom_stepper.Step(
              title: const Text('Сдача объекта'),
              content: Container(
                alignment: Alignment.centerLeft,
                child: const Text(
                    'Сдача исполнительной документации в АО "Газпром газораспределение Тверь"\n* Оказываем помощь в оформлении документов на поставку газа и технического обслуживания.'),
              ),
            ),
          ],
        ),
      );
    });
  }
}

class Info extends StatelessWidget {
  const Info({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(
        child: Column(
      children: [
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Text("KES2012Tver@yandex.ru"),
        ),
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Text("г. Тверь, ул. Орджоникидзе, д.3А, оф. 26"),
        ),
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Text("+7 (904) 017-27-50"),
        ),
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Text("+7(910) 936-94-74"),
        ),
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Text("Пн.–Пт. 9:00–17:00"),
        ),
      ],
    ));
  }
}

class MyCustomScrollBehavior extends MaterialScrollBehavior {
  // Override behavior methods and getters like dragDevices
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      };
}
