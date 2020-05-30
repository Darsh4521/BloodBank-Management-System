from django.db import models

# Create your models here.

class UserDetails(models.Model):
	userid=models.AutoField(primary_key=True)
	fname=models.CharField(max_length=50)
	blood_group=models.CharField(max_length=4)
	dob=models.DateField()
	mobile_no=models.CharField(max_length=10)
	country=models.CharField(max_length=30)
	state=models.CharField(max_length=30)
	city=models.CharField(max_length=30)
	pincode=models.CharField(max_length=6)
	email=models.CharField(max_length=80)
	password=models.CharField(max_length=15)
	availability=models.CharField(max_length=12)

	class Meta:
		db_table='UserDetails'

class RequestDetails(models.Model):
	request_id=models.AutoField(primary_key=True)
	userid=models.ForeignKey(UserDetails, on_delete=models.CASCADE)
	pname=models.CharField(max_length=50)
	blood_group=models.CharField(max_length=4)
	age=models.CharField(max_length=3)
	required_date=models.DateField()
	blood_unit=models.CharField(max_length=4)
	mobile_no=models.CharField(max_length=10)
	hospital_name=models.CharField(max_length=40)
	location=models.CharField(max_length=40)
	patient_address=models.CharField(max_length=100)
	purpose=models.CharField(max_length=150)

	class Meta:
		db_table='RequestDetails'

class BloodBankDetails(models.Model):
	bloodbank_id=models.AutoField(primary_key=True)
	name=models.CharField(max_length=100)
	city=models.CharField(max_length=100)
	state=models.CharField(max_length=100)
	country=models.CharField(max_length=100)
	contact_no=models.CharField(max_length=10)
	pincode=models.CharField(max_length=10,default='')
	email=models.CharField(max_length=100)
	password=models.CharField(max_length=15)	
	iso_certified=models.CharField(max_length=5)

	class Meta:
		db_table='BloodBankDetails'

class AvailableBloodGroup(models.Model):
	blood_id=models.AutoField(primary_key=True)
	bloodbank_id=models.ForeignKey(BloodBankDetails,on_delete=models.CASCADE)
	blood_group=models.CharField(max_length=4)
	available_units=models.CharField(max_length=50)

	class Meta:
		db_table='AvailableBloodGroup'



