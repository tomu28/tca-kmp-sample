package com.tomu28.tcakmpsampleapp

import kotlinx.coroutines.flow.Flow
import kotlinx.coroutines.flow.MutableStateFlow

private val currentStep = MutableStateFlow(SampleStep.Step1)

fun getCurrentStep(): Flow<SampleStep> {
    return currentStep
}

fun nextStep() {
    when (currentStep.value) {
        SampleStep.Step1 -> currentStep.value = SampleStep.Step2
        SampleStep.Step2 -> currentStep.value = SampleStep.Step3
        SampleStep.Step3 -> {} // No further steps
    }
}

fun backStep() {
    when (currentStep.value) {
        SampleStep.Step1 -> {} // No action on first step
        SampleStep.Step2 -> currentStep.value = SampleStep.Step1
        SampleStep.Step3 -> currentStep.value = SampleStep.Step2
    }
}

enum class SampleStep {
    Step1, Step2, Step3
}
