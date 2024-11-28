import PageContainer from '../../components/PageContainer'

@Builder
export function renderStepper() {
  StepperDemo()
}

@Component
export struct StepperDemo {
  build() {
    PageContainer({
      title: 'Stepper 步进器',
    }) {

    }
  }
}