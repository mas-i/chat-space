$(function(){
  function buildHTML(message){
    if ( message.image ) {
      let html =
        `<div class="message-box" data-message-id=${message.id}>
          <div class="name-box">
            <div class="name-box__message-name">
              ${message.user_name}
            </div>
            <div class="name-box__date">
              ${message.created_at}
            </div>
          </div>
          <div class="message">
            <p class="Message__content">
              ${message.content}
            </p>
            <img class="Message__image" src="${message.image}">
          </div>
        </div>`
      return html;
    } else {
      let html =
        `<div class="message-box" data-message-id=${message.id}>
          <div class="name-box">
            <div class="name-box__message-name">
              ${message.user_name}
            </div>
            <div class="name-box__date">
              ${message.created_at}
            </div>
          </div>
          <div class="message">
            <p class="Message__content">
              ${message.content}
            </p>
          </div>
        </div>`
      return html;
    };
  }

  $('.Form').on('submit', function(e){
    e.preventDefault()
    let formData = new FormData(this);
    let url = $(this).attr('action');
    $.ajax({
      url: url,  //同期通信でいう『パス』
      type: 'POST',  //同期通信でいう『HTTPメソッド』
      data: formData,  
      dataType: 'json',
      processData: false,
      contentType: false
    })

    .done(function(data){
      let html = buildHTML(data);
      $('.message-list').append(html);
      $('.message-list').animate({ scrollTop: $('.message-list')[0].scrollHeight});
      $('form')[0].reset();
      $('.submit').prop('disabled', false);
    })

    .fail(function(){
      alert("メッセージ送信に失敗しました");
      $('.submit').prop('disabled', false);
    });
  });
})