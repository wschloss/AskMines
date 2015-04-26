$('div#index').html("<% @questions.each do |question| %><%= escape_javascript(render question) %><% end %>");
// Reapply preview on hover
$('[id=question-wrapper]').hover(
	function() {
		$('#question-preview', this).fadeToggle("fast");
	},
	function() {
		$('#question-preview', this).fadeToggle("fast");
	}
);