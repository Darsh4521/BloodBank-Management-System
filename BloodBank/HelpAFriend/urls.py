from django.conf.urls import url

from HelpAFriend import views 

urlpatterns = [
		url(r'^registration/$',views.Registration_User),
		url(r'^login/$',views.Login_User),
		url(r'^submit/$',views.Submit),
		url(r'^index/$',views.Index),
		url(r'auth/$',views.Auth_User),
		url(r'search/$',views.Search_Page),
		url(r'search_donor/$',views.Search_Donor),
		url(r'post_request/$',views.Post_Request),
		url(r'post_req/$',views.Post_Req),
		url(r'search_bank/$',views.Bank_List),
		url(r'bloodbank_registration/$',views.BloodBank_Registration),
		url(r'submit_bloodbank/$',views.Submit_BloodBank),
		url(r'bloodbank_details/$',views.BloodBank_Details),
		url(r'update_units/$',views.Update_Units),
		url(r'edit_profile/$',views.Edit_Profile),
		url(r'update_details/$',views.Update_Details),
		url(r'user_home/$',views.User_Home),
		url(r'change_password/$',views.Change_Password),
		url(r'change_pass/$',views.Change_Pass),
		url(r'logout/$',views.Logout),
		url(r'edit_bb_profile/$',views.Edit_BB_Profile),
		url(r'update_bb_details/$',views.Update_BB_Details),
		url(r'bloodbank_home/$',views.BloodBank_Home),
		url(r'forgot_password/$',views.Forgot_Password),
		url(r'new_password/$',views.New_Password),
		url(r'enter_otp/$',views.Enter_Otp),
		url(r'generate_otp/$',views.Generate_Otp),
		url(r'verify_otp/$',views.Verify_Otp),
		url(r'update_password/$',views.Update_Password),
		url(r'aboutus/$',views.AboutUS),
	]

