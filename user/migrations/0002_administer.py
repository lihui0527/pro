# Generated by Django 2.1.2 on 2020-07-27 02:46

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('user', '0001_initial'),
    ]

    operations = [
        migrations.CreateModel(
            name='Administer',
            fields=[
                ('aid', models.AutoField(primary_key=True, serialize=False)),
                ('username', models.CharField(max_length=255)),
                ('password', models.CharField(max_length=255)),
            ],
            options={
                'db_table': 'administer',
                'managed': False,
            },
        ),
    ]