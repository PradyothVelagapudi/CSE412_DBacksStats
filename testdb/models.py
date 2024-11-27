# This is an auto-generated Django model module.
# You'll have to do the following manually to clean this up:
#   * Rearrange models' order
#   * Make sure each model has one field with primary_key=True
#   * Make sure each ForeignKey and OneToOneField has `on_delete` set to the desired behavior
#   * Remove `managed = False` lines if you wish to allow Django to create, modify, and delete the table
# Feel free to rename the models, but don't rename db_table values or field names.
from django.db import models


class Hitter(models.Model):
    h_id = models.IntegerField(primary_key=True)
    player_pid = models.ForeignKey('Players', models.DO_NOTHING, db_column='player_pid', blank=True, null=True)
    h_position = models.CharField(max_length=10, blank=True, null=True)
    h_g = models.IntegerField(blank=True, null=True)
    h_ab = models.IntegerField(blank=True, null=True)
    h_r = models.IntegerField(blank=True, null=True)
    h_2b = models.IntegerField(blank=True, null=True)
    h_3b = models.IntegerField(blank=True, null=True)
    h_hr = models.IntegerField(blank=True, null=True)
    h_rbi = models.IntegerField(blank=True, null=True)
    h_bb = models.IntegerField(blank=True, null=True)
    h_so = models.IntegerField(blank=True, null=True)
    h_sb = models.IntegerField(blank=True, null=True)
    h_cs = models.IntegerField(blank=True, null=True)
    h_avg = models.DecimalField(max_digits=4, decimal_places=3, blank=True, null=True)
    h_obp = models.DecimalField(max_digits=4, decimal_places=3, blank=True, null=True)
    h_slg = models.DecimalField(max_digits=4, decimal_places=3, blank=True, null=True)
    h_ops = models.DecimalField(max_digits=4, decimal_places=3, blank=True, null=True)
    h_h = models.IntegerField(blank=True, null=True, db_comment='hits')

    class Meta:
        managed = False
        db_table = 'Hitter'


class Pitcher(models.Model):
    p_id = models.AutoField(primary_key=True)
    player_pid = models.ForeignKey('Players', models.DO_NOTHING, db_column='player_pid', blank=True, null=True)
    p_w = models.IntegerField(blank=True, null=True)
    p_l = models.IntegerField(blank=True, null=True)
    p_era = models.DecimalField(max_digits=5, decimal_places=2, blank=True, null=True)
    p_g = models.IntegerField(blank=True, null=True)
    p_gs = models.IntegerField(blank=True, null=True)
    p_ip = models.DecimalField(max_digits=5, decimal_places=1, blank=True, null=True)
    p_h = models.IntegerField(blank=True, null=True)
    p_r = models.IntegerField(blank=True, null=True)
    p_er = models.IntegerField(blank=True, null=True)
    p_hr = models.IntegerField(blank=True, null=True)
    p_bb = models.IntegerField(blank=True, null=True)
    p_so = models.IntegerField(blank=True, null=True)
    p_whip = models.DecimalField(max_digits=4, decimal_places=2, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'Pitcher'


class Players(models.Model):
    player_pid = models.AutoField(primary_key=True)
    player_name = models.CharField(max_length=100)
    player_position = models.CharField(max_length=20, blank=True, null=True)
    player_bat_thr = models.CharField(max_length=5, blank=True, null=True)
    player_age = models.IntegerField(blank=True, null=True)
    player_number = models.IntegerField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'Players'
