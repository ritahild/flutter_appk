import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:io/ansi.dart';

import 'pocs.dart';

void main() {
  runApp(Myapp());
}

class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        scrollBehavior: MyCustomScrollBehavior(),
        home: Scaffold(
            appBar: AppBar(
              title: Text("КотлоЭнергоСтрой"),
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Head(),
                  Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Text("Услуги")),
                  SizedBox(
                    height: 300,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        image(im: "assets/gaz.JPG"),
                        image(im: "assets/Gaz1.JPG"),
                        image(im: "assets/gaz3.JPG"),
                      ],
                    ),
                  ),
                  Padding(
                      padding: const EdgeInsets.all(20.0), child: Text("Газ")),
                  SizedBox(
                    height: 300,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        image(im: "assets/tryba.jpg"),
                        image(im: "assets/kanalizatsionnye-truby.jpg"),
                        image(im: "assets/canRender.jpg"),
                      ],
                    ),
                  ),
                  Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Text("Канализация")),
                  SizedBox(
                    height: 300,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        image(im: "assets/tryba.jpg"),
                        image(im: "assets/tryba1.jpg"),
                        image(im: "assets/tryba2.jpg"),
                        image(im: "assets/tryba3.jpg"),
                      ],
                    ),
                  ),
                  Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Text("Трубы")),
                  SizedBox(
                    height: 300,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        image(im: "assets/vent.jpeg"),
                        image(im: "assets/vent.jpeg"),
                        image(im: "assets/vent.jpeg"),
                      ],
                    ),
                  ),
                  Padding(
                      padding: const EdgeInsets.all(20.0), child: Text("Вода")),
                  Mail(),

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Этапы газификации"),
                  ),
                  // Image(
                  //   image: AssetImage(
                  //     "assets/back.jpg",
                  //   ),
                  //   fit: BoxFit.cover,
                  //   height: 420,
                  //   width: double.infinity,
                  // ),

                  StepperExample(),

                  Info(),
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
  const Head({
    super.key,
  });

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
          image: AssetImage("assets/fon.jpg"),
          fit: BoxFit.cover,
        ),
      ),
      child: Padding(
        
        padding: const EdgeInsets.only(left: 20,right: 300,top: 40,bottom: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          
          children: [
            Center(
              child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text(
                    'Строительство инженерных систем, газоснабжение котельных.Газоснабжение жилых домов, СНТ, коттеджных посёлков.Системы водоснабжения отопления и водоотведения.Системы вентиляции и дымоходов.Теплотрассы',
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  )),
            ),
            SizedBox(
              child: ElevatedButton(
                onPressed: () {},
                child: Text("Услуги"),
                style: ButtonStyle(),
              ),
              height: 30,
              width: 100,
            ),
            SizedBox(
              child: ElevatedButton(
                onPressed: () {},
                child: Text("Оставить заявку"),
                style: ButtonStyle(),
              ),
              height: 90,
              width: 500,
            ),
          ],
        ),
      ),
    );
  }
}

class Mail extends StatefulWidget {
  const Mail({
    super.key,
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
          image: AssetImage("assets/post.jpg"),
          fit: BoxFit.cover,
        ),
      ),
      child: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Оставить заявку"),
            ),
            TextField(
              onChanged: (value) {},
              controller: myController,
              decoration: InputDecoration(
                hintText: 'Enter text here',
              ),
            ),
            TextField(
              controller: youController,
              decoration: InputDecoration(
                hintText: 'Enter text here',
              ),
            ),
            SizedBox(
              child: ElevatedButton(
                onPressed: () {
                  myController.text;
                  youController.text;
                  submitForm(myController.text, youController.text,
                      "Просьба связатся с нами");
                },
                child: Text("Отправить"),
                style: ButtonStyle(),
              ),
              height: 120,
              width: 200,
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
      currentStep: _index,
      onStepCancel: () {
        if (_index > 0) {
          setState(() {
            _index -= 1;
          });
        }
      },
      onStepContinue: () {
        if (_index <= 0) {
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
          title: const Text('Step 1 title'),
          content: Container(
            alignment: Alignment.centerLeft,
            child: const Text('Content for Step 1'),
          ),
        ),
        const Step(
          title: Text('Step 2 title'),
          content: Text('Content for Step 2'),
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
    return Center(
        child: Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text("KES2012Tver@yandex.ru"),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text("г. Тверь, ул. Орджоникидзе, д.3А, оф. 26"),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text("+7 (904) 017-27-50"),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text("+7(910) 936-94-74"),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
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
