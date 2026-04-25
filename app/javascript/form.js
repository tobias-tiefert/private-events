// Source - https://stackoverflow.com/a/25621277
// Posted by DreamTeK, modified by community. See post 'Timeline' for change history
// Retrieved 2026-04-25, License - CC BY-SA 4.0

document.querySelectorAll("textarea").forEach(function(textarea) {
  textarea.style.height = textarea.scrollHeight + "px";
  textarea.style.overflowY = "hidden";

  textarea.addEventListener("input", function() {
    this.style.height = "auto";
    this.style.height = this.scrollHeight + "px";
  });
});