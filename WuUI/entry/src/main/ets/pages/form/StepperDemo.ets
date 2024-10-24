@Builder
export function renderStepper() {
  StepperDemo()
}

@Component
export struct StepperDemo {
  build() {
    NavDestination() {

    }
    .title('Stepper 步进器')
  }
}