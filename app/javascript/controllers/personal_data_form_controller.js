import { Controller } from 'stimulus'

export default class extends Controller {
    static targets = ['field', 'save']

    validateFields() {
        const fields = this.fieldTargets
        const saveButton = this.saveTarget

        if (fields.every(field => field.value.trim() !== '')) {
            saveButton.removeAttribute('disabled')
        } else {
            saveButton.setAttribute('disabled', true)
        }
    }
}
