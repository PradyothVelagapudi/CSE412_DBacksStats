from django.urls import path

from . import views

urlpatterns = [

    path("", views.playerinfo, name="player-info"),
    path("hitters/", views.hitter_stats, name="hitter-stats"),
    path("pitchers/", views.pitcher_stats, name="pitcher-stats"),

]