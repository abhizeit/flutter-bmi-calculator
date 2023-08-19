import "package:bmi_calculator/calculator_brain.dart";
import "package:bmi_calculator/icon_content.dart";
import "package:bmi_calculator/result_page.dart";
import "package:bmi_calculator/reusable_card.dart";
import "package:flutter/material.dart";
import "package:font_awesome_flutter/font_awesome_flutter.dart";

import "round_icon_button.dart";

const activeCardColor = Color(0xFF1D1E33);
const inactiveCardColor = Color(0xFF111328);

enum Gender { male, female }

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender? selectedGender;
  int height = 126;
  int weight = 40;
  int age = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("BMI Calculator"),
        centerTitle: true,
        backgroundColor: const Color(0xFF060817),
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    onPress: () => {
                      setState(() {
                        selectedGender = Gender.male;
                      })
                    },
                    colour: selectedGender == Gender.male
                        ? activeCardColor
                        : inactiveCardColor,
                    cardChild: const IconContent(
                      icon: FontAwesomeIcons.mars,
                      label: "MALE",
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                    colour: selectedGender == Gender.female
                        ? activeCardColor
                        : inactiveCardColor,
                    cardChild: const IconContent(
                        icon: FontAwesomeIcons.venus, label: "FEMALE"),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
              colour: const Color(0xFF1D1F33),
              cardChild: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                textBaseline: TextBaseline.alphabetic,
                children: [
                  const Text(
                    "HEIGHT",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 18),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        height.toString(),
                        style: const TextStyle(
                            fontSize: 40, fontWeight: FontWeight.w500),
                      ),
                      const Text(
                        'cm',
                      )
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                        activeTrackColor: Colors.white,
                        inactiveTrackColor: const Color(0xFF8D8E98),
                        thumbColor: const Color(0xFFEB1555),
                        overlayColor: const Color(0x50EB1555),
                        thumbShape: const RoundSliderThumbShape(
                            enabledThumbRadius: 10.0)),
                    child: Slider(
                        value: height.toDouble(),
                        max: 240.0,
                        min: 100.0,
                        onChanged: (val) {
                          setState(() {
                            height = val.toInt();
                          });
                        }),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    colour: const Color(0xFF1D1F33),
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("WEIGHT", style: TextStyle(fontSize: 18)),
                        Text(
                          weight.toString(),
                          style: const TextStyle(
                              fontSize: 40, fontWeight: FontWeight.w500),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            RoundIconButton(
                              iconData: FontAwesomeIcons.plus,
                              handlePress: () {
                                setState(() {
                                  weight++;
                                });
                              },
                            ),
                            RoundIconButton(
                              iconData: FontAwesomeIcons.minus,
                              handlePress: () {
                                setState(() {
                                  weight--;
                                });
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    colour: const Color(0xFF1D1F33),
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("AGE", style: TextStyle(fontSize: 18)),
                        Text(
                          age.toString(),
                          style: const TextStyle(
                              fontSize: 40, fontWeight: FontWeight.w500),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            RoundIconButton(
                              iconData: FontAwesomeIcons.plus,
                              handlePress: () {
                                setState(() {
                                  age++;
                                });
                              },
                            ),
                            RoundIconButton(
                              iconData: FontAwesomeIcons.minus,
                              handlePress: () {
                                setState(() {
                                  age--;
                                });
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              Calculator calc = Calculator(height: height, weight: weight);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ResultPage(
                          bmiResult: "bmiResult",
                          resultText: "resultText",
                          interpretation: "interpretation")));
            },
            child: Container(
              width: double.infinity,
              margin: const EdgeInsets.only(top: 40),
              color: const Color(0xFFEB1555),
              alignment: Alignment.center,
              padding: const EdgeInsets.only(bottom: 20, top: 20),
              child:
                  const Text("CALCULATE BMI", style: TextStyle(fontSize: 18)),
            ),
          )
        ],
      ),
    );
  }
}
