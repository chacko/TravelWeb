
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
			//alert(x);
			document.forms["myForm"]["CustFirstName"].value = x;
			if(x == null || x == "")
			{
					alert ("First name is required");
					document.forms["myForm"]["CustFirstName"].focus();
					return false;
			}
			
			var x= document.forms["myForm"]["CustLastName"].value.trim();
			document.forms["myForm"]["CustLastName"].value = x;
			if(x == null || x == "")
			{
					alert ("Last name is required");
					document.forms["myForm"]["CustLastName"].focus();
					return false;
			}
			
			var x= document.forms["myForm"]["CustAddress"].value.trim();
			document.forms["myForm"]["CustAddress"].value = x;
			if(x == null || x == "")
			{
					alert ("Address is required");
					document.forms["myForm"]["CustAddress"].focus();
					return false;
			}
			
			var x= document.forms["myForm"]["CustCity"].value.trim();
			document.forms["myForm"]["CustCity"].value = x;
			if(x == null || x == "")
			{
					alert ("City is required");
					document.forms["myForm"]["CustCity"].focus();
					return false;
			}
			
			var x= document.forms["myForm"]["CustProv"].value.trim();
			document.forms["myForm"]["CustProv"].value = x;
			if(x == null || x == "")
			{
					alert ("Province is required");
					document.forms["myForm"]["CustProv"].focus();
					return false;
			}
			
			var x= document.forms["myForm"]["CustPostal"].value.trim();
			document.forms["myForm"]["CustPostal"].value = x;
			if(x == null || x == "")
			{
					alert ("Postal code is required");
					document.forms["myForm"]["CustPostal"].focus();
					return false;
			}
				
			/*var regex = /^[a-zA-Z][0-9][a-zA-Z](-| |)[0-9][a-zA-Z][0-9]$/;
			if(regex.test(document.getElementById("CustPostal").value))
				{
					alert ("Postal Code is invalid");
					return false;
				}*/
			
			
			var x= document.forms["myForm"]["CustBusPhone"].value.trim();
			document.forms["myForm"]["CustBusPhone"].value = x;
			if(x == null || x == "")
			{
					alert ("Business Phone is required");
					document.forms["myForm"]["CustBusPhone"].focus();
					return false;
			}
			
			
			var x= document.forms["myForm"]["CustEmail"].value.trim();
			document.forms["myForm"]["CustEmail"].value = x;
			if(x == null || x == "")
			{
					alert ("Email is required");
					document.forms["myForm"]["CustEmail"].focus();
					return false;
			}
			
			if(!validateEmail(x))
			{
				alert ("Email is Invalid");
				document.forms["myForm"]["CustEmail"].focus();
				return false;
			}
			
			var x= document.forms["myForm"]["uname"].value.trim();
			document.forms["myForm"]["uname"].value = x;
			if(x == null || x == "")
			{
					alert ("username is required");
					document.forms["myForm"]["uname"].focus();
					return false;
			}
			
			var pwd = document.forms["myForm"]["passwd"].value.trim();
			
			if(pwd == null || pwd == ""  )
			{
				alert ("Password is required!!!");
				document.forms["myForm"]["passwd"].focus();
				return false;
			}
			
			var cpwd = document.forms["myForm"]["cpasswd"].value.trim();
			if(cpwd == null || cpwd == ""  )
			{
				alert ("Confirm Password is required!!!");
				document.forms["myForm"]["cpasswd"].focus();
				return false;
			}
			
			if(pwd !== cpwd )
			{
				alert ("Both Password and Confirm Password should be same!!!");
				document.forms["myForm"]["passwd"].focus();
				return false;
			}
			// If all validations passed form is valid
			// so return true for submission
			return true;
			
		}	
//------------- Email validation
function validateEmail(email) 
{
  var emailReg = /^([\w-\.]+@([\w-]+\.)+[\w-]{2,4})?$/;
  if(!emailReg.test(email)) 
  {
    return false;
  } 
  else 
  {
    return true;
  }
}
//--------------------------------
function validatePostalCode(pcode) 
{
  var postalReg = /^[A-Za-z]\d[A-Za-z] ?\d[A-Za-z]\d$/;
  if(!postalReg.test(pcode)) 
  {
    return false;
  } 
  else 
  {
    return true;
  }
}
//------------------------------