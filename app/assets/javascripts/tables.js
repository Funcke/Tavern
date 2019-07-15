var partialSum = 0;
var checked = 0;
$(document).ready(function() {
    $('input:checkbox').change(function() {
        console.log(partialSum);
        if(this.checked) {
            partialSum += $(this).data("price");
            checked++;
        } else {
            partialSum -= $(this).data("price");
            checked--;
        }
        if(checked == 0) {
            $('.pay').attr('hidden', false);
            $('.order').attr('hidden', false);
            $('#pay-group').attr('hidden', true);
        } else {
            $('.pay').attr('hidden', true);
            $('.order').attr('hidden', true);
            $('#pay-group').attr('hidden', false);
        }
        if(partialSum === 0) {
            $('#sum').html($('#sum').data('sum'));
        } else {
            $('#sum').html(partialSum);
        }
    });

    $('#pay-group').click(() => {
        var payload = {orders: []};
        $('input:checkbox').each(function (index, item) {
            console.log('hi');
            console.log($(item).prop('checked'));
            if($(item).prop('checked'))
                payload.orders.push($(this).data('id'));
        });
        $.ajax({type: 'POST', url: '/orders', headers: {
                'X-CSRF-Token': $('meta[name="csrf-token"]').attr('content'),
                'content-type': 'application/json'
            }, data: JSON.stringify(payload),
            dataType: 'json',
            success: () => {
                location.reload();
            }
        });
    });
});