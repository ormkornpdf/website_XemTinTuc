/**
 * 
 */

function openAlertDelete(url){
    swal({
        title: "Bạn có chắc muốn xóa không?",
        text: "Bạn có chắc muốn xóa không?",
        type: "warning",
        buttons: {
            confirm: {
                text: "Đồng ý",
                className: "btn btn-success",
            },
            cancel: {
				text: "Hủy",
                visible: true,
                className: "btn btn-danger",
            },
        },
    }).then((Delete) => {
        if (Delete) {
          window.location.href = url
        } else {
            swal.close();
        }
    });
}
