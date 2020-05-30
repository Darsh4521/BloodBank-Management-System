from django.shortcuts import render,render_to_response
from dbconnection.models import *
from django.http import HttpResponseRedirect 
from django.template.context_processors import *
from django.contrib.auth import authenticate, login
from django.core.mail import send_mail
from django.conf import settings
# Create your views here.

from django.views import generic
import smtplib
import math, random 

def Index(request):
	# request_list=RequestDetails.objects.all()
	# last_obj=RequestDetails.objects.latest('request_id')
	# last_obj_id=last_obj.request_id
	last_five=RequestDetails.objects.all().order_by('-request_id')[:5]
	return render(request,'index.html',{'last_five' : last_five })

def Forgot_Password(request):
	return render(request,'forgot_password.html')

def New_Password(request):
	return render(request,'new_password.html')

def Enter_Otp(request):
	return render(request,'enter_otp.html')

def Registration_User(request):
	return render(request,'registration.html',context=None)

def Login_User(request):
	return render(request,'login.html',context=None)

def Search_Page(request):
	return render(request,'search.html',context=None)

def Post_Request(request):
	if request.session.has_key('user_id'):
		return render(request,'post-request.html')
	else:
		return render(request,'login.html')

def Bank_List(request):
	return render(request,'bank_list.html')

def BloodBank_Registration(request):
	return render(request,'bloodbank_registration.html')

def AboutUS(request):
	return render(request,'aboutus.html')

def User_Home(request):
	if request.session['user_id']:
		user_id=request.session['user_id']
		user_list=UserDetails.objects.all()

		for user in user_list :
			if user_id == user.userid :
				user_name=user.fname 
	else:
		user_name=None

	return render(request,'user_home.html',{ 'user_name' : user_name })

def BloodBank_Home(request):
	return render(request,'bloodbank_home.html')

def BloodBank_Home(request):
	return render(request,'bloodbank_home.html')

def Change_Pass(request):
	return render(request,'change_password.html')
def BloodBank_Details(request):
	blood_list=AvailableBloodGroup.objects.all()
	bank_list=BloodBankDetails.objects.all()
	blood_bank_id=request.session['bloodbank_id']
	output_list=[]

	for bank in bank_list :
		if bank.bloodbank_id ==blood_bank_id :
			bank_object=bank
	
	for found_blood in blood_list :
		if found_blood.bloodbank_id == bank_object :
			output_list.append(found_blood)

	return render(request,'bloodbank_details.html',{ 'output_list': output_list })

def Auth_User(request):
	email=request.POST.get('email')
	password=request.POST.get('password')
	user_type=request.POST.get('type')
	error_msg=None

	if user_type=="donor":
		user_list=UserDetails.objects.all()

		for user in user_list :
			if user.email==email and user.password==password :
				request.session['user_id']=user.userid
				request.session['fname']=user.fname
				return HttpResponseRedirect('/HelpAFriend/index')
			else:
				error_msg="E-mail or Password is Incorrect"

	elif user_type=="bloodbank":
		bank_list=BloodBankDetails.objects.all()
		for bank in bank_list :
			if bank.email==email and bank.password==password :
				request.session['bloodbank_id']=bank.bloodbank_id
				request.session['name']=bank.name
				return HttpResponseRedirect('/HelpAFriend/index') #Redirect To Blood Bank Profile
			else:
				error_msg="E-mail or Password is Incorrect"
	
	if error_msg:
		print(error_msg)
		return render(request,'login.html')
	else:
		print(error_msg)	
		return render(request,'login.html')

def Submit(request):
	if request.method=='POST':
		if request.POST.get('fname') and request.POST.get('blood') and request.POST.get('dob') and request.POST.get('mobileno') and request.POST.get('country') and request.POST.get('state') and request.POST.get('city') and request.POST.get('pincode') and request.POST.get('email') and request.POST.get('password') and request.POST.get('rpassword') and request.POST.get('availability'):
			c={}
			c.update(csrf(request))
			ud=UserDetails()
			ud.fname=request.POST.get('fname')
			ud.blood_group=request.POST.get('blood')
			ud.dob=request.POST.get('dob')
			ud.mobile_no=request.POST.get('mobileno')
			ud.country=request.POST.get('country')
			ud.state=request.POST.get('state')
			ud.city=request.POST.get('city')
			ud.pincode=request.POST.get('pincode')
			ud.email=request.POST.get('email')
			ud.password=request.POST.get('password')
			ud.availability=request.POST.get('availability')
			ud.save()

			return HttpResponseRedirect('/HelpAFriend/login/')

		else:

			return render(request,'registration.html')

def Submit_BloodBank(request):
	if request.method=='POST':
		if request.POST.get('bank_name') and request.POST.get('country') and request.POST.get('state') and request.POST.get('city') and request.POST.get('pincode') and request.POST.get('contact_no')and request.POST.get('email') and request.POST.get('password') and request.POST.get('rpassword') and request.POST.get('iso'):
			c={}
			c.update(csrf(request))
			bd=BloodBankDetails()

			bd.name=request.POST.get('bank_name')
			bd.country=request.POST.get('country')
			bd.state=request.POST.get('state')
			bd.city=request.POST.get('city')
			bd.pincode=request.POST.get('pincode')
			bd.contact_no=request.POST.get('contact_no')
			bd.email=request.POST.get('email')
			bd.password=request.POST.get('password')
			bd.iso_certified=request.POST.get('iso')
			bd.save()

			return HttpResponseRedirect('/HelpAFriend/login/')

		else:

			return render(request,'bloodbank_registration.html')

def Search_Donor(request):
	if request.method=='POST':
		if request.POST.get('search_by') and request.POST.get('blood') and request.POST.get('country') and request.POST.get('state') and request.POST.get('city'):
			c={}
			c.update(csrf(request))

			output_list=[]
			output_blood_list=[]
			output_bank_list=[]
			search_by=request.POST.get('search_by')
			blood=request.POST.get('blood')
			country=request.POST.get('country')
			state=request.POST.get('state')
			city=request.POST.get('city')
			
			if search_by=='donor':
				search_list=UserDetails.objects.all()

				for user in search_list:
					if user.blood_group==blood and user.country==country and user.state==state and user.city==city:
						output_list.append(user)

				return render_to_response('list.html', { 'output_list' : output_list })

			elif search_by=='bloodbank':
				search_bank_list=BloodBankDetails.objects.all()
				search_blood_list=AvailableBloodGroup.objects.all()

				for bank in search_bank_list :
					if bank.country==country and bank.state==state and bank.city==city :

						for search_blood in search_blood_list:

							if search_blood.blood_group == blood and  search_blood.bloodbank_id == bank :

								output_blood_list.append(search_blood)

								output_bank_list.append(bank)

				return render_to_response('bank_list.html',{ 'output_bank_list' : output_bank_list , 'output_blood_list' : output_blood_list })					
			return render(request,'search.html')							

def Post_Req(request):

	if request.session.has_key('user_id'):

		userid=request.session['user_id']
		user_list=UserDetails.objects.all()
		mail_list=[]

		if request.method=='POST':
			if request.POST.get('pname') and request.POST.get('blood') and request.POST.get('age') and request.POST.get('bdate') and request.POST.get('unit') and request.POST.get('mobileno') and request.POST.get('hospital') and request.POST.get('location') and request.POST.get('paddress') and request.POST.get('purpose') :
				c={}
				c.update(csrf(request))
				rd=RequestDetails()
				for user in user_list :
					if user.userid==userid:
						rd.userid=user
				rd.pname=request.POST.get('pname')
				rd.blood_group=request.POST.get('blood')
				rd.age=request.POST.get('age')
				rd.required_date=request.POST.get('bdate')
				rd.blood_unit=request.POST.get('unit')
				rd.mobile_no=request.POST.get('mobileno')
				rd.hospital_name=request.POST.get('hospital')
				rd.location=request.POST.get('location')
				rd.patient_address=request.POST.get('paddress')
				rd.purpose=request.POST.get('purpose')
				rd.save()

				for user in user_list:
					if user.blood_group == request.POST.get('blood') and user.city == request.POST.get('paddress'):
						mail_list.append(user)
				print(mail_list)
				content = "Blood Request sent by " + request.POST.get('pname') + " Blood Group: " + request.POST.get('blood') + " Hospital: " + request.POST.get('hospital') + " Address: " + request.POST.get('location')		
				print(content)
				recipient_list=[]
				for user in mail_list:
					recipient_list.append(user.email)
				print(recipient_list)			
				subject='HelpAFriend'
				email_from=settings.EMAIL_HOST_USER				
				send_mail(subject,content,email_from,recipient_list)
		

				return HttpResponseRedirect('/HelpAFriend/index/')

			else:

				return render(request,'post-request.html')
	else:

		return render(request,'login.html',{error_msg : 'Invalid Access Please Login !!! ' })

def Update_Units(request):
	
	c={}
	c.update(csrf(request))

	bloodbank_id=request.session['bloodbank_id']
	blood_list=AvailableBloodGroup.objects.all()
	bank_list=BloodBankDetails.objects.all()
	output_list=[]
	for bank in bank_list :
		if bank.bloodbank_id == bloodbank_id :
	 		bank_object=bank
	
	for found_blood in blood_list :
		if found_blood.bloodbank_id == bank_object :
			output_list.append(found_blood)
			
	for blood in output_list:
		
		bb=AvailableBloodGroup.objects.get(blood_id = blood.blood_id)
		i=blood.blood_id
		if request.POST.get(''+str(i)) :
			bb.available_units=request.POST.get(''+str(i))
			bb.save()

	blood_list=AvailableBloodGroup.objects.all()
	bank_list=BloodBankDetails.objects.all()
	output_list=[]
	for bank in bank_list :
		if bank.bloodbank_id == bloodbank_id :
	 		bank_object=bank
	
	for found_blood in blood_list :
		if found_blood.bloodbank_id == bank_object :
			output_list.append(found_blood)
			
	return render(request,'bloodbank_details.html',{ 'output_list' : output_list})

def Edit_Profile(request):

	uid=request.session['user_id']
	ud=UserDetails.objects.get(userid = uid)

	return render(request,'edit_profile.html',{ 'ud' : ud })

def Edit_BB_Profile(request):

	bid=request.session['bloodbank_id']
	bd=BloodBankDetails.objects.get(bloodbank_id = bid)

	return render(request,'edit_bb_profile.html',{ 'bd' : bd })

def Update_Details(request):
	uid=request.session['user_id']
	ud=UserDetails.objects.get(userid = uid)
	ud.fname=request.POST.get('fname')
	ud.mobile_no=request.POST.get('mobileno')
	ud.country=request.POST.get('country')
	ud.state=request.POST.get('state')
	ud.city=request.POST.get('city')
	ud.pincode=request.POST.get('pincode')
	ud.email=request.POST.get('email')
	ud.availability=request.POST.get('availability')
	ud.save()
	msg="Details Successfully Updated"
	ud=UserDetails.objects.get(userid = uid)

	return render(request,'edit_profile.html',{ 'ud' : ud , 'msg' : msg })

def Update_BB_Details(request):
	bid=request.session['bloodbank_id']
	bd=BloodBankDetails.objects.get(bloodbank_id = bid)
	bd.country=request.POST.get('country')
	bd.state=request.POST.get('state')
	bd.city=request.POST.get('city')
	bd.pincode=request.POST.get('pincode')
	bd.mobile_no=request.POST.get('mobileno')
	bd.email=request.POST.get('email')
	bd.iso_certified=request.POST.get('iso')
	bd.save()
	msg="Details Successfully Updated"

	bd=BloodBankDetails.objects.get(bloodbank_id = bid)

	return render(request,'edit_bb_profile.html',{'bd' : bd , 'msg' : msg })	

def Change_Password(request):
	if request.session.has_key('user_id'):
		uid=request.session['user_id']
		if request.POST.get('new_password') and request.POST.get('rnew_password'):
			if request.POST.get('new_password') == request.POST.get('rnew_password'):
				c={}
				c.update(csrf(request))

				ud=UserDetails.objects.get(userid = uid)
				ud.password=request.POST.get('new_password')
				ud.save()
				msg="Password Successfully Changed"

			return render(request,'change_password.html',{'msg':msg})

	if request.session.has_key('bloodbank_id'):
		bid=request.session['bloodbank_id']

		if request.POST.get('new_password') == request.POST.get('rnew_password'):
			c={}
			c.update(csrf(request))

			bd=BloodBankDetails.objects.get(bloodbank_id = bid)
			bd.password=request.POST.get('new_password')
			bd.save()
			msg="Password Successfully Changed"

		return render(request,'change_password.html',{'msg':msg})			

def Logout(request):
	if request.session.has_key('user_id'):
		del request.session['user_id']
		del request.session['fname']
		request.session.modified = True
		return render(request,'login.html')

	elif request.session.has_key('bloodbank_id'):
		del request.session['bloodbank_id']
		del request.session['name']	
		request.session.modified = True
		return render(request,'login.html')

def Generate_Otp(request):

	digits = "0123456789"
	OTP = ""
	ans = "no"
	for i in range(6):
		OTP += digits[math.floor(random.random() * 10)]

	if request.POST.get('email'):	
		email=request.POST.get('email')
		user_type=request.POST.get('type')
		ud=UserDetails.objects.all()
		bd=BloodBankDetails.objects.all()
		if user_type == "donor":
			for user in ud :
				if user.email == email :
					ans = "yes"
		elif user_type == "bloodbank":
			for bank in bd:
				if bank.email == email :			
					ans ="yes"
		if ans == "yes":			
			request.session['type']=user_type
			request.session['email']=email
			request.session['otp']=OTP

			recipient_list=[]
			recipient_list.append(email)
			subject='Your Otp'
			content="Your Otp is " + OTP + "\n Please do not share otp with anyone."
			email_from=settings.EMAIL_HOST_USER
			send_mail(subject,content,email_from,recipient_list)

			return render(request,'enter_otp.html')
		else:
			msg = "Enter Correct Email !!!"
			return render(request,'forgot_password.html',{ 'msg' : msg })

def Verify_Otp(request):

	if request.POST.get('otp'):
		otp=request.session['otp']
		if request.POST.get('otp')==otp:
			return render(request,'new_password.html')
		else:
			msg="Otp Incorrect,Enter Correct Otp !!"
			return render(request,'enter_otp.html',{ 'msg' : msg })

def Update_Password(request):
	
	if request.POST.get('new_password')==request.POST.get('re_password'):
		c={}
		c.update(csrf(request))

		email=request.session['email']
		user_type=request.session['type']
		if user_type == "donor":
			ud=UserDetails.objects.get(email = email)
			ud.password=request.POST.get('new_password')
			ud.save()

		elif user_type == "bloodbank":
			ud=BloodBankDetails.objects.get(email = email)
			ud.password=request.POST.get('new_password')
			ud.save()
		request.session['email']=None
		request.session['type']=None
		request.session['otp']=None

		error_msg="Your Password Is Successfully Changed"

		return render(request,'login.html',{ 'error_msg' : error_msg })

	else:
		msg="Both Passwords Do Not Match !!!"
		return render(request,'new_password.html',{ 'msg' : msg })			



 

