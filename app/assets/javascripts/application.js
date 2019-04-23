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
}

function initNavbar() {
    $('.navbar-burger').click(function () {
        $('.navbar-burger').toggleClass('is-active');
        $('.navbar-menu').toggleClass('is-active');
    });
}

function initFileUpload() {
    addEventListener('trix-attachment-add', function (event) {
        if (event.attachment.file) {
            uploadFileAttachment(event.attachment);
        }
    });

    function uploadFileAttachment(attachment) {
        uploadFile(attachment.file, setProgress, setAttribute);

        function setProgress(progress) {
            attachment.setUploadProgress(progress);
        }

        function setAttribute(attributes) {
            attachment.setAttributes(attributes);
        }
    }

    function uploadFile(file, progressCallback, successCallback) {

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