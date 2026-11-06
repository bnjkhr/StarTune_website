// Setzt Mailadressen erst im Browser zusammen, damit sie nicht im Quelltext stehen.
document.querySelectorAll('.js-mail[data-m]').forEach(function (el) {
    try {
        var addr = atob(el.getAttribute('data-m'));
        var a = document.createElement('a');
        a.href = 'mailto:' + addr;
        a.textContent = addr;
        el.replaceWith(a);
    } catch (e) { /* Fallback-Text bleibt stehen */ }
});
