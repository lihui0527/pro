from django.db import models


class Administer(models.Model):
    aid = models.AutoField(primary_key=True)
    username = models.CharField(max_length=255)        
    password = models.CharField(max_length=255)        

    class Meta:
        managed = False
        db_table = 'administer'


class AuthGroup(models.Model):
    name = models.CharField(unique=True, max_length=80)

    class Meta:
        managed = False
        db_table = 'auth_group'


class AuthGroupPermissions(models.Model):
    group_id = models.IntegerField()
    permission_id = models.IntegerField()

    class Meta:
        managed = False
        db_table = 'auth_group_permissions'
        unique_together = (('group_id', 'permission_id'),)


class AuthPermission(models.Model):
    name = models.CharField(max_length=255)
    content_type_id = models.IntegerField()
    codename = models.CharField(max_length=100)

    class Meta:
        managed = False
        db_table = 'auth_permission'
        unique_together = (('content_type_id', 'codename'),)


class AuthUser(models.Model):
    password = models.CharField(max_length=128)
    last_login = models.DateTimeField(blank=True, null=True)
    is_superuser = models.IntegerField()
    username = models.CharField(unique=True, max_length=150)
    first_name = models.CharField(max_length=30)
    last_name = models.CharField(max_length=150)
    email = models.CharField(max_length=254)
    is_staff = models.IntegerField()
    is_active = models.IntegerField()
    date_joined = models.DateTimeField()

    class Meta:
        managed = False
        db_table = 'auth_user'


class AuthUserGroups(models.Model):
    user_id = models.IntegerField()
    group_id = models.IntegerField()

    class Meta:
        managed = False
        db_table = 'auth_user_groups'
        unique_together = (('user_id', 'group_id'),)


class AuthUserUserPermissions(models.Model):
    user_id = models.IntegerField()
    permission_id = models.IntegerField()

    class Meta:
        managed = False
        db_table = 'auth_user_user_permissions'
        unique_together = (('user_id', 'permission_id'),)


class DjangoAdminLog(models.Model):
    action_time = models.DateTimeField()
    object_id = models.TextField(blank=True, null=True)
    object_repr = models.CharField(max_length=200)
    action_flag = models.PositiveSmallIntegerField()
    change_message = models.TextField()
    content_type_id = models.IntegerField(blank=True, null=True)
    user_id = models.IntegerField()

    class Meta:
        managed = False
        db_table = 'django_admin_log'


class DjangoContentType(models.Model):
    app_label = models.CharField(max_length=100)
    model = models.CharField(max_length=100)

    class Meta:
        managed = False
        db_table = 'django_content_type'
        unique_together = (('app_label', 'model'),)


class DjangoMigrations(models.Model):
    app = models.CharField(max_length=255)
    name = models.CharField(max_length=255)
    applied = models.DateTimeField()

    class Meta:
        managed = False
        db_table = 'django_migrations'


class DjangoSession(models.Model):
    session_key = models.CharField(primary_key=True, max_length=40)
    session_data = models.TextField()
    expire_date = models.DateTimeField()

    class Meta:
        managed = False
        db_table = 'django_session'


class PredictResult(models.Model):
    uid = models.IntegerField()
    duration = models.IntegerField()
    protocol_type = models.CharField(max_length=255)
    flag = models.CharField(max_length=255)
    wrong_fragment = models.IntegerField()
    urgent = models.IntegerField()
    hot = models.IntegerField()
    num_failed_logins = models.IntegerField()
    logged_in = models.IntegerField()
    num_root = models.IntegerField()
    root_shell = models.IntegerField()
    is_guest_login = models.IntegerField()
    count = models.IntegerField()
    srv_count = models.IntegerField()
    diff_srv_rate = models.CharField(max_length=255)
    srv_diff_host_rate = models.CharField(max_length=255)
    dst_host_count = models.IntegerField()
    dst_host_srv_count = models.IntegerField()
    dst_host_same_srv_rate = models.CharField(max_length=255)
    dst_host_diff_srv_rate = models.CharField(max_length=255)
    date_time = models.DateTimeField()
    result = models.CharField(max_length=255, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'predict_result'


class TraceResult(models.Model):
    uid = models.IntegerField()
    duration = models.IntegerField()
    protocol_type_result = models.CharField(max_length=255, blank=True, null=True)
    flag = models.CharField(max_length=255)
    wrong_fragment = models.IntegerField()
    urgent = models.IntegerField()
    hot = models.IntegerField()
    num_failed_logins = models.IntegerField()
    logged_in_result = models.IntegerField(blank=True, null=True)
    num_root = models.IntegerField()
    root_shell_result = models.IntegerField(blank=True, null=True)
    is_guest_login = models.IntegerField()
    count = models.IntegerField()
    srv_count = models.IntegerField()
    diff_srv_rate = models.CharField(max_length=255)
    srv_diff_host_rate = models.CharField(max_length=255)
    dst_host_count = models.IntegerField()
    dst_host_srv_count = models.IntegerField()
    dst_host_same_srv_rate = models.CharField(max_length=255)
    dst_host_diff_srv_rate = models.CharField(max_length=255)
    date_time = models.DateTimeField()

    class Meta:
        managed = False
        db_table = 'trace_result'


class Users(models.Model):
    uid = models.AutoField(primary_key=True)
    username = models.CharField(max_length=255)
    password = models.CharField(max_length=255)
    email = models.CharField(max_length=255)
    number = models.IntegerField()
    head_img = models.CharField(max_length=255)
    register_time = models.DateTimeField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'users'