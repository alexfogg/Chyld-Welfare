// function view_applicants_function()
// {
//   var token = $('input[name=authenticity_token]').val();
//   var applicants = [];
//   });
//   applicants = applicants.join(", ");

//     $.ajax({
//     dataType: 'json',
//     type: "post",
//     url: "/users",
//     data: {
//       authenticity_token: token,
//       applicant: {user_ids: users}
//     }
//   }).done(function(returnedValue){
//     console.log(returnedValue);
//     alert('Applied!')
//   });
//     return false;
// }


function cancel_user_form()
{
  $('#create_user_form').empty();
}
function cancel_app_form()
{
  $('#application_form').empty();
}