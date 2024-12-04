from django.shortcuts import render
from django.http import HttpResponse
from testdb.models import Players, Hitter, Pitcher
import datetime

def playerinfo(request):
    # now = datetime.datetime.now()
    # html = '<html lang="en"><body>It is now %s.</body></html>' % now
    p_objs = Players.objects.all()
    context = {
        "players": p_objs
    }
    return render(request, "players_info.html", context)

def hitter_stats(request):
    h_objs = Hitter.objects.all().select_related('player_pid')
    context = {"hitters": h_objs}
    return render(request, "hitters_stats.html", context)

def pitcher_stats(request):
    p_objs = Pitcher.objects.all().select_related('player_pid')
    context = {"pitchers": p_objs}
    return render(request, "pitchers_stats.html", context)