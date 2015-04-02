$("#left-column").html("<%= escape_javascript(render @cart) %>");
$("#petlist").html("<%= escape_javascript(render @pets) %>");