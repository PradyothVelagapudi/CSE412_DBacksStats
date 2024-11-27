from django.shortcuts import render
from django.http import HttpResponse
from testdb.models import Players
import datetime

def playerinfo(request):
    # now = datetime.datetime.now()
    # html = '<html lang="en"><body>It is now %s.</body></html>' % now

    p_objs = Players.objects.all()

    context = {
        "players": p_objs
    }
    
    return render(request, "players_info.html", context)