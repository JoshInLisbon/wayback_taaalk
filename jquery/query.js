$(document).ready(function() {
	$("#interviewee-more").click(function(){
		$("#deep-interviewee").css('max-height','none');
		$("#interviewee-more").css('display','none');
	});

	$("#interviewer-more").click(function(){
		$("#deep-interviewer").css('max-height','none');
		$("#interviewer-more").css('display','none');
	});

  $(".deep-person-details").each(function(){
    var el = $(this);
    var moreButton = el.find(".person-more");
    moreButton.click(function(){
      el.find(".deep-interviewee, .deep-interviewer").css("max-height", "none");
      moreButton.hide();
    });
  });

  $("#start-conversation-id").click(function(){
  	$(".signupspace").css('background-color','blue');
  });



});
