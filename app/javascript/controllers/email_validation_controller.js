import { Controller } from 'stimulus'

export default class extends Controller {
    static targets = ['field']

    validateEmail() {
        const field = this.fieldTarget
        const value = field.value.trim()

        if (value === '') {
            return
        }

        const pattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/
        const valid = pattern.test(value)

        if (valid) {
            field.classList.remove('border-red-500')
        } else {
            field.classList.add('border-red-500')
        }
    }
}