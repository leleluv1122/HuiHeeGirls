$(function() {

    $("[data-url]").click(function() {
        var url = $(this).attr("data-url");
        location.href = url;
    })

    $("[data-confirm-delete]").click(function() {
        return confirm("삭제하시겠습니까?");
    })
    
    $("[btn-register]").click(function() {
        return confirm("회원가입 하시겠습니까?");
    })
})
