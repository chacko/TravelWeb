
	/**Code by: Mark Neil Del Rosario
	Date: April 03, 2014
	Project: Instructor: Harvey Peters
	Group Member: 6
	Deadline: April 17, 2014
	Programming Language: Java,HTML  */


/**
 * 
 */
	function validateForm()
		{
			var x= document.forms["myForm"]["CustFirstName"].value.trim();
			document.forms["myForm"]["CustFirstName"].value = x;
			if(x == null || x == "")
			{
					alert ("First name field is required");
					document.forms["myForm"]["CustFirstName"].focus();
					return false;
			}
			
			var x= document.forms["myForm"]["CustLastName"].value.trim();
			document.forms["myForm"]["CustLastName"].value = x;
			if(x == null || x == "")
			{
					alert ("Last name field is required");
					document.forms["myForm"]["CustLastName"].focus();
					return false;
			}
			
			var x= document.forms["myForm"]["CustAddress"].value.trim();
			document.forms["myForm"]["CustAddress"].value = x;
			if(x == null || x == "")
			{
					alert ("Address field is required");
					document.forms["myForm"]["CustAddress"].focus();
					return false;
			}
			
			var x= document.forms["myForm"]["CustCity"].value.trim();
			document.forms["myForm"]["CustCity"].value = x;
			if(x == null || x == "")
			{
					alert ("City field is required");
					document.forms["myForm"]["CustCity"].focus();
					return false;
			}
			
			var x= document.forms["myForm"]["CustProv"].value.trim();
			document.forms["myForm"]["CustProv"].value = x;
			if(x == null || x == "")
			{
					alert ("Province field is required");
					document.forms["myForm"]["CustProv"].focus();
					return false;
			}
			
			var x= document.forms["myForm"]["CustPostal"].value.trim();
			document.forms["myForm"]["CustPostal"].value = x;
			if(x == null || x == "")
			{
					alert ("Postal code field is required");
					document.forms["myForm"]["CustPostal"].focus();
					return false;
			}
				
			var regex = /[a-zA-Z][0-9][a-zA-Z](-| |)[0-9][a-zA-Z][0-9]/;
			if(regex.test(document.getElementById("CustPostal").value))
				{
					alert ("Postal Code is invalid");
				}
			
			
			var x= document.forms["myForm"]["CustBusPhone"].value.trim();
			document.forms["myForm"]["CustBusPhone"].value = x;
			if(x == null || x == "")
			{
					alert ("Business Phone field is required");
					//document.forms["myForm"]["CustBusPhone"].focus();
					return false;
			}
			
			
			var x= document.forms["myForm"]["CustEmail"].value.trim();
			document.forms["myForm"]["CustEmail"].value = x;
			if(x == null || x == "")
			{
					alert ("Email field is required");
					document.forms["myForm"]["CustEmail"].focus();
					return false;
			}
			
			
			var x= document.forms["myForm"]["uname"].value.trim();
			document.forms["myForm"]["uname"].value = x;
			if(x == null || x == "")
			{
					alert ("username field is required");
					document.forms["myForm"]["uname"].focus();
					return false;
			}
			
				
			if(document.forms["myForm"]["passwd"].value == null || document.forms["myForm"]["passwd"].value == ""  )
			{
				alert ("Password is required!!!");
				document.forms["myForm"]["passwd"].focus();
				return false;
			}
			
			if(document.forms["myForm"]["cpasswd"].value == null || document.forms["myForm"]["cpasswd"].value == ""  )
			{
				alert ("Confirm Password is required!!!");
				document.forms["myForm"]["cpasswd"].focus();
				return false;
			}
			
			if(document.forms["myForm"]["passwd"].value !== document.forms["myForm"]["cpasswd"].value  )
			{
				alert ("Both Password and Confirm Password should be same!!!");
				document.forms["myForm"]["passwd"].focus();
				return false;
			}
			//else
				//{
					return true;
				//}
		}	