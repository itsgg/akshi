Paloma.controller('Admin', {
    before: ['all -> initialize'],
    initialize: function () {
        this.initSortable();
    },
    initSortable: function () {
        Sortable.create($('.subjects')[0]);
    }
});