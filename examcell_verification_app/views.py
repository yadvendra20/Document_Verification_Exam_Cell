from django.shortcuts import render,redirect
from examcell_verification_app.models import UserInsert
from django.http import HttpResponse
# from django.db import models
# import uuid
# Create your views here.
import mysql.connector as mcdb



def InsertRecord(request):
    # users_list=acks.objects.all()
    # print(users_list)
    if request.method == 'POST':
        saverecord=UserInsert()
        #print (saverecord)
        saverecord.name=request.POST.get('name')
        saverecord.PRN=request.POST.get('PRN')
        saverecord.email=request.POST.get('email')
      #  saverecord.ACK_NO=models.CharField(max_length=10, unique=True, default=uuid.uuid4)
        #ack=saverecord.ACK_NO
        saverecord.save()
        #print (ack)
        
       # messages.SUCCESS(request,"Record Saved")
        return render(request,'index.html')

    else:
        return render(request, 'index.html')

conn = mcdb.connect(host="localhost", user="root", passwd="", database='exam_cell')

print('Successfully connected to database')
cur = conn.cursor()

def home(request):
    return  render(request,'home.html')


def list_users(request):
    cur.execute("SELECT * FROM users")
    data = cur.fetchall()
    #return list(data)
    print(list(data))
    return render(request, 'view.html', {'categories': data})   






def pendingusers(request):
    cur.execute("Select * from 'users' u inner join  `verification status of users` v on v.user_ID = u.user_ID inner join 'verification status' s on v.user_ID = s.ID Where s.ID=1; ")
    data = cur.fetchall()
    #return list(data)
    print(list(data))
    return render(request, 'users_status.html', {'categories': data})   
