package com.tomu28.tcakmpsampleapp

import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.asStateFlow

class SampleClass {
    private val _currentStep = MutableStateFlow(SampleStep.Step1)
    val currentStep = _currentStep.asStateFlow()

    fun nextStep() {
        when (_currentStep.value) {
            SampleStep.Step1 -> _currentStep.value = SampleStep.Step2
            SampleStep.Step2 -> _currentStep.value = SampleStep.Step3
            SampleStep.Step3 -> {} // No further steps
        }
    }

    fun backStep() {
        when (_currentStep.value) {
            SampleStep.Step1 -> {} // No action on first step
            SampleStep.Step2 -> _currentStep.value = SampleStep.Step1
            SampleStep.Step3 -> _currentStep.value = SampleStep.Step2
        }
    }

    enum class SampleStep {
        Step1, Step2, Step3
    }
}
