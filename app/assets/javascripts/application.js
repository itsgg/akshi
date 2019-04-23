// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require jquery
//= require trix
//= require_tree .

$(document).on('turbolinks:load', function () {
    init();
});

function init() {
    initNavbar();
    initFileSelection();
    initFileUpload();
    initHighlight();
}

function initHighlight() {

    $('.highlight pre').each(function () {
        let content = $(this).text();
        let match = content.match(/(?:^|\s)(```[a-z0-9]\w*)/i);
        if (match) {
            let rawHighlightLang = match[1];
            let highlightLang = rawHighlightLang.replace('```', '');
            content = content.replace(rawHighlightLang, '').replace(/^\s*[\r\n]/gm, '');
            $(this).addClass('code');
            $(this).html($('<code class="' + highlightLang + '"></code>').text(content));
            hljs.initHighlightingOnLoad($(this));
        }
    });
}

function initNavbar() {
    $('.navbar-burger').click(function () {
        $('.navbar-burger').toggleClass('is-active');
        $('.navbar-menu').toggleClass('is-active');
    });
}

function initFileUpload() {
    Trix.config.attachments.preview.caption = {
        name: false,
        size: false
    };
    addEventListener('trix-attachment-add', function (event) {
        if (event.attachment.file) {
            uploadFileAttachment(event.attachment);
        }
    });

    function uploadFileAttachment(attachment) {
        let csrfToken = $('meta[name="csrf-token"]').attr('content');
        let file = attachment.file;
        let form = new FormData;
        let endpoint = "/attachments";
        form.append("Content-Type", file.type);
        form.append("attachment[file]", file);

        let xhr = new XMLHttpRequest;
        xhr.open("POST", endpoint, true);
        xhr.setRequestHeader("X-CSRF-Token", csrfToken);

        xhr.upload.onprogress = function (event) {
            let progress = event.loaded / event.total * 100;
            return attachment.setUploadProgress(progress);
        };

        xhr.onload = function () {
            if (this.status >= 200 && this.status < 300) {
                let data = JSON.parse(this.responseText);
                return attachment.setAttributes({
                    url: data.url,
                    href: data.url
                });
            }
        };
        return xhr.send(form);
    }
}

function initFileSelection() {
    $('input[type=file]').bind('change', function () {
        let fileNameContainer = $(this).siblings('.file-name').first();
        if (fileNameContainer) {
            fileNameContainer.text($(this).val().replace(/^.*\\/i, ''));
        }
    });
}