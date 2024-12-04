from django.shortcuts import render
from django.http import HttpResponse
from testdb.models import Players, Hitter, Pitcher
import datetime

def playerinfo(request):
    sort_stat = request.GET.get('sort_stat', 'player_number')
    sort_order = request.GET.get('sort_order', 'asc')
    position_filter = request.GET.get('position', '')

    players = Players.objects.all()

    if position_filter:
        players = players.filter(player_position=position_filter)

    if sort_order == 'asc':
        players = players.order_by(sort_stat)
    elif sort_order == 'desc':
        players = players.order_by(f'-{sort_stat}')

    fields = {
        "player_number": "Player Number",
        "player_name": "Name",
        "player_position": "Position",
        "player_bat_thr": "Bat/Throw",
        "player_age": "Age",
    }

    context = {
        "players": players,
        "current_sort_order": sort_order,
        "current_sort_stat": sort_stat,
        "current_position": position_filter,
        "all_positions": Players.objects.values_list('player_position', flat=True).distinct(),
        "fields": fields,
    }
    return render(request, "players_info.html", context)



def hitter_stats(request):
    sort_stat = request.GET.get('sort_stat', 'player_pid__player_number')
    sort_order = request.GET.get('sort_order', 'asc')

    hitters = Hitter.objects.all().select_related('player_pid')

    if sort_order == 'asc':
        hitters = hitters.order_by(sort_stat)
    elif sort_order == 'desc':
        hitters = hitters.order_by(f'-{sort_stat}')

    fields = {
        "player_pid__player_number": "Player Number",
        "player_pid__player_name": "Name",
        "h_position": "Position",
        "h_g": "Games Played",
        "h_ab": "At Bats",
        "h_r": "Runs",
        "h_2b": "Doubles",
        "h_3b": "Triples",
        "h_hr": "Home Runs",
        "h_rbi": "RBIs",
        "h_bb": "Walks",
        "h_so": "Strikeouts",
        "h_sb": "Stolen Bases",
        "h_cs": "Caught Stealing",
        "h_avg": "Batting Average",
        "h_obp": "On-base %",
        "h_slg": "Slugging %",
        "h_ops": "OPS",
        "h_h": "Hits",
    }

    context = {
        "hitters": hitters,
        "current_sort_order": sort_order,
        "current_sort_stat": sort_stat,
        "fields": fields,
    }
    return render(request, "hitters_stats.html", context)


def pitcher_stats(request):
    sort_stat = request.GET.get('sort_stat', 'player_pid__player_number')
    sort_order = request.GET.get('sort_order', 'asc')

    pitchers = Pitcher.objects.all().select_related('player_pid')

    if sort_order == 'asc':
        pitchers = pitchers.order_by(sort_stat)
    elif sort_order == 'desc':
        pitchers = pitchers.order_by(f'-{sort_stat}')

    fields = {
        "player_pid__player_number": "Player Number",
        "player_pid__player_name": "Name",
        "p_w": "Wins",
        "p_l": "Losses",
        "p_era": "ERA",
        "p_g": "Games Played",
        "p_gs": "Games Started",
        "p_ip": "Innings Pitched",
        "p_h": "Hits Allowed",
        "p_r": "Runs Allowed",
        "p_er": "Earned Runs",
        "p_hr": "Home Runs Allowed",
        "p_bb": "Walks",
        "p_so": "Strikeouts",
        "p_whip": "WHIP",
    }

    context = {
        "pitchers": pitchers,
        "current_sort_order": sort_order,
        "current_sort_stat": sort_stat,
        "fields": fields,
    }
    return render(request, "pitchers_stats.html", context)
