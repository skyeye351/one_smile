import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["input", "preview", "before"]

  preview() {
    const file = this.inputTarget.files[0]
    if (!file) {
      this.previewTarget.classList.add("hidden") // ファイルが選択されていない場合はプレビューを非表示にする
      if (this.hasBeforeTarget) {
        this.beforeTarget.classList.remove("hidden") // ビフォーアフター処理のためにbeforeを表示
      }
      return
    }

    const reader = new FileReader()
    reader.onload = (e) => {
      this.previewTarget.src = e.target.result
      this.previewTarget.classList.remove("hidden")
      if (this.hasBeforeTarget) {
        this.beforeTarget.classList.add("hidden")
      }
    }
    reader.readAsDataURL(file)
  }
}
