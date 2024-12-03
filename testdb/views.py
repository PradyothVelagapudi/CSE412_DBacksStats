from django.shortcuts import render
from testdb.models import Players

def playerinfo(request):
    sort_order = request.GET.get('sort_order', 'asc')
    position_filter = request.GET.get('position', '')

    players = Players.objects.all()

    if position_filter:
        players = players.filter(player_position=position_filter)

    if sort_order == 'asc':
        players = players.order_by('player_name')
    elif sort_order == 'desc':
        players = players.order_by('-player_name')

    context = {
        "players": players,
        "current_sort_order": sort_order,
        "current_position": position_filter,
        "all_positions": Players.objects.values_list('player_position', flat=True).distinct(),
    }
    
    return render(request, "players_info.html", context)
