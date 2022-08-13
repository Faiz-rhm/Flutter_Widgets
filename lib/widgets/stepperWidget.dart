import 'package:flutter/material.dart';

class StepperWidget extends StatefulWidget {
  const StepperWidget({Key? key}) : super(key: key);

  @override
  State<StepperWidget> createState() => _StepperWidgetState();
}

class _StepperWidgetState extends State<StepperWidget> {

  //
  //
  // ContentView.Flutter
  // Stepper Widget
  //
  // Created by: Faiz Rhm

  // Mark: Github
  // Faiz Rhm
  // https://github.com/Faiz-rhm

  int  _currentStepper = 0;

  _stepTapped(int step){
    setState(() => _currentStepper = step);
  }

  _stepContinue(){
    _currentStepper < 2 ? setState(() => _currentStepper += 1) : null;
  }

  _stepCancel(){
    _currentStepper > 0 ? setState(() => _currentStepper -= 1) : null;
  }

  bool _isVerticalStepper = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stepper Widget'),
      ),
      body: Column(
        children: [
          SwitchListTile(
            title: const Text('Vertical Stepper'),
            subtitle: const Text('vertical/horizontal direction'),
            value: _isVerticalStepper,
            onChanged: (_){
              setState(() {
                _isVerticalStepper = !_isVerticalStepper;
              });
            },
          ),
          Expanded(
            child: Stepper(
              type: _isVerticalStepper
                ? StepperType.vertical
                : StepperType.horizontal,
              physics: const ScrollPhysics(),
              currentStep: _currentStepper,
              onStepTapped: (step) => _stepTapped(step),
              onStepContinue: _stepContinue,
              onStepCancel: _stepCancel,
              steps: [
                Step(
                  title: const Text('Personal'),
                  content: Column(
                    children: [
                      TextFormField(
                        decoration: const InputDecoration(
                          labelText: 'Full name'
                        ),
                      )
                    ],
                  ),
                  isActive: _currentStepper >= 0,
                  state: _currentStepper >= 0
                    ? StepState.complete
                    : StepState.disabled
                ),
                Step(
                  title: const Text('Account'),
                  content: Column(
                    children: [
                      TextFormField(
                        decoration: const InputDecoration(
                          labelText: 'Email Address'
                        ),
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                          labelText: 'Password'
                        ),
                      )
                    ],
                  ),
                  isActive: _currentStepper >= 0,
                  state: _currentStepper >= 1
                    ? StepState.complete
                    : StepState.disabled
                ),
                Step(
                  title: const Text('Contact'),
                  content: Column(
                    children: [
                      TextFormField(
                        decoration: const InputDecoration(
                          labelText: 'Contact Number'
                        ),
                      )
                    ],
                  ),
                  isActive: _currentStepper >= 0,
                  state: _currentStepper >= 2
                    ? StepState.complete
                    : StepState.disabled
                )
              ]
            ),
          )
        ],
      )
    );
  }
}