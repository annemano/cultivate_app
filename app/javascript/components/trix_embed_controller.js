import Rails from "@rails/ujs"
import Trix from "trix"
window.trix = Trix
Trix.config.blockAttributes.heading2 = {
  tagName: "h2",
  terminal: true,
  breakOnReturn: true,
  group: false
}
class TrixEmbedController {
  constructor(element) {
    this.pattern = /^https:\/\/([^\.]+\.)?youtube\.com\/watch\?v=(.*)/
    this.spotpattern = /^https:\/\/([^\.]+\.)?open.spotify\.com\/track\/(.*)(\?.*)$/
    this.element = element
    this.editor = element.editor
    this.toolbar = element.toolbarElement
    this.hrefElement = this.toolbar.querySelector("[data-trix-input][name='href']")
    this.embedContainerElement = this.toolbar.querySelector("[data-behavior='embed_container']")
    this.embedElement = this.toolbar.querySelector("[data-behavior='embed_url']")
    this.reset()
    this.installEventHandlers()
  }

  installEventHandlers() {
    this.hrefElement.addEventListener("input", this.didInput.bind(this))
    this.hrefElement.addEventListener("focusin", this.didInput.bind(this))
    this.embedElement && this.embedElement.addEventListener("click", this.embed.bind(this))
  }
  didInput(event) {
    let value = event.target.value.trim()
    let matches = value.match(this.pattern)
    let spotmatches = value.match(this.spotpattern)
    if (matches != null) {
      this.fetch(matches[2])
    } else if (spotmatches != null) {
      this.spotfetch(spotmatches[2])
    } else {
      this.reset()
    }
  }
  fetch(value) {
    Rails.ajax({
      url: `/youtube/${encodeURIComponent(value)}`,
      type: 'get',
      error: this.reset.bind(this),
      success: this.showEmbed.bind(this)
    })
  }
   spotfetch(value) {
    Rails.ajax({
      url: `/spotify/${encodeURIComponent(value)}`,
      type: 'get',
      error: this.reset.bind(this),
      success: this.showEmbed.bind(this)
    })
  }
  embed(event) {
    if (this.currentEmbed == null) { return }
    let attachment = new Trix.Attachment(this.currentEmbed)
    this.editor.insertAttachment(attachment)
    this.element.focus()
  }
  showEmbed(embed) {
    this.currentEmbed = embed
    this.embedContainerElement && (this.embedContainerElement.style.display = "block")
  }
  reset() {
    this.embedContainerElement && (this.embedContainerElement.style.display = "none")
    this.currentEmbed = null
  }
}
export default TrixEmbedController
