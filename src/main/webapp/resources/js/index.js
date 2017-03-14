$('.modal').on('hidden.bs.modal', function () {
    $(this).removeData();
});

function toggleAddUserForm() {
    $('#addForm').toggleClass('invisible');
    $('#addUserButton').toggleClass('invisible');
}


function toggleAdmin() {
    $('#isAdminIcon').toggleClass('glyphicon-ok').toggleClass('glyphicon-remove');
    $('#isAdminLink').toggleClass('btn-success').toggleClass('btn-danger');
    var cp = $('#adminCheckbox');
    cp.prop("checked", !cp.prop("checked"));
}


