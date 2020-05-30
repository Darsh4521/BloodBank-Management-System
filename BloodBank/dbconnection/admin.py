from django.contrib import admin

# Register your models here.
from .models import *

admin.site.register(UserDetails)
admin.site.register(RequestDetails)
admin.site.register(BloodBankDetails)
admin.site.register(AvailableBloodGroup)