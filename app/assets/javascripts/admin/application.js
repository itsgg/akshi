Paloma.controller('Admin', {
    before: ['all -> initialize'],
    initialize: function () {
        this.initSortable();
    },
    initSortable: function () {
        let subjectsContainer = document.getElementById('subjects');
        if (subjectsContainer) {
            Sortable.create(subjectsContainer, {
                    onSort: function () {
                        let ids = $('#subjects .subject').map(function (index) {
                            return $(this).attr('id');
                        }).toArray();

                        let orders = ids.map(function (id) {
                            return ids.indexOf(id);
                        });

                        let csrfToken = $('meta[name="csrf-token"]').attr('content');
                        let form = new FormData;
                        let endpoint = "/subjects/order";
                        ids.forEach(function (id) {
                            form.append("ids[]", id);
                        });
                        orders.forEach(function (order) {
                            form.append("orders[]", order);
                        });
                        let xhr = new XMLHttpRequest;
                        xhr.open("PUT", endpoint, true);
                        xhr.setRequestHeader("X-CSRF-Token", csrfToken);
                        return xhr.send(form);
                    }
                }
            );
        }
    }
});