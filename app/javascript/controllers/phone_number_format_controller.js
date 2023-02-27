import { Controller } from 'stimulus'

export default class extends Controller {
    static targets = ['field']

    formatPhoneNumber() {
        const field = this.fieldTarget
        const value = field.value.trim().replace(/\D/g, '')

        if (value === '') {
            return
        }

        const formattedValue = value.replace(/^(\d{3})(\d{3})(\d{4})$/, '$1-$2-$3')
        field.value = formattedValue
    }
}