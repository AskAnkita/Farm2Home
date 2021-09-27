 var current_state = [];
	function allLetter()
  {
   var inputtxt = document.getElementById("state_name");
   var letters = "^[A-Za-z][A-Za-z ]+$";
   var len = current_state.length;
   for(var i=0; i<len; i++)
   {
	if(inputtxt.value==current_state[i])
	{
		alert("This state already exist");
		inputtxt.value = "";
		return false;
	}
   }
   if(inputtxt.value.match(letters))
     {
      return true;
     }
   else
     {
     alert("please enter a valid state name");
	 inputtxt.value = "";
     return false;
     }
  }
	function duplicateState()
	{
		current_state = [];
		{% for state in states %}
			current_state.push("{{ state[1] }}");
		{% endfor %}
	}