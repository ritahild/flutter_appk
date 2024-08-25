import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_appk/map_screen.dart';

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
                      padding: const EdgeInsets.all(20.0), child: const Text("Услуги")),
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
                  const Padding(
                      padding: EdgeInsets.all(20.0), child: Text("Газ")),
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
                  const Padding(
                      padding: EdgeInsets.all(20.0),
                      child: Text("Канализация")),
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
                  const Padding(
                      padding: EdgeInsets.all(20.0), child: Text("Трубы")),
                  SizedBox(
                    height: 300,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: const [
                        image(im: "assets/vent.jpeg"),
                        image(im: "assets/vent.jpeg"),
                        image(im: "assets/vent.jpeg"),
                      ],
                    ),
                  ),
                  const Padding(
                      padding: EdgeInsets.all(20.0), child: Text("Вода")),
                  Mail(
                    key: infoKey,
                    MapScreen: null,
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text("Этапы газификации"),
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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(28.0),
            child: LayoutBuilder(builder: (context, constraints) {
              if (constraints.maxWidth > 600) {
                return const Row(
                  children: [
                    Flexible(
                      flex: 3,
                      child: Text(
                        'Строительство инженерных систем, газоснабжение котельных.Газоснабжение жилых домов, СНТ, коттеджных посёлков.Системы водоснабжения отопления и водоотведения.Системы вентиляции и дымоходов.Теплотрассы',
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
                );
              }
              return const Text(
                'Строительство инженерных систем, газоснабжение котельных.Газоснабжение жилых домов, СНТ, коттеджных посёлков.Системы водоснабжения отопления и водоотведения.Системы вентиляции и дымоходов.Теплотрассы',
                style: TextStyle(
                  fontFamily: 'Roboto',
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              );
            }),
          ),
          SizedBox(
            height: 30,
            width: 100,
            child: ElevatedButton(
              onPressed: onServiceTap,
              child: const Text("Услуги"),
              style: const ButtonStyle(),
            ),
          ),
          SizedBox(
            height: 90,
            width: 500,
            child: ElevatedButton(
              onPressed: onInfoTap,
              child: const Text("Оставить заявку"),
              style: const ButtonStyle(),
            ),
          ),
        ],
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
  final myController = TextEditingController();
  final youController = TextEditingController();
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
      child: Center(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text("Оставить заявку"),
            ),
            TextField(
              onChanged: (value) {},
              controller: myController,
              decoration: const InputDecoration(
                hintText: 'Enter text here',
              ),
            ),
            TextField(
              controller: youController,
              decoration: const InputDecoration(
                hintText: 'Enter text here',
              ),
            ),
            SizedBox(
              height: 120,
              width: 200,
              child: ElevatedButton(
                onPressed: () {
                  myController.text;
                  youController.text;
                  submitForm(myController.text, youController.text,
                      "Просьба связатся с нами");
                },
                child: const Text("Отправить"),
                style: const ButtonStyle(),
              ),
            ),
          ],
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
    return Stepper(
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
      steps: <Step>[
        Step(
          title: const Text('Подача заявки'),
          content: Container(
            alignment: Alignment.centerLeft,
            child: const Text(
                'Заключение договора с АО "Газпром газораспределение Тверь" на технологическое присоединение к газовым сетям.'),
          ),
        ),
        Step(
          title: const Text('Проектирование'),
          content: Container(
              alignment: Alignment.centerLeft,
              child: const Text('Разработка проекта газоснабжения')),
        ),
        Step(
          title: const Text('Строительство'),
          content: Container(
            alignment: Alignment.centerLeft,
            child: const Text(
                'Поставка материалов и выполнение монтажных работ на объекте.'),
          ),
        ),
        Step(
          title: const Text('Сдача объекта'),
          content: Container(
            alignment: Alignment.centerLeft,
            child: const Text(
                'Сдача исполнительной документации в АО "Газпром газораспределение Тверь"\n* Оказываем помощь в оформлении документов на поставку газа и технического обслуживания.'),
          ),
        ),
      ],
    );
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
