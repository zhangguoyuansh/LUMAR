from django.db import models

# Create your models here.


class SystemSetup(models.Model):
    loginTitle = models.CharField(max_length=20, null=True, blank=True, verbose_name='loginTitle')
    mainTitle = models.CharField(max_length=20, null=True, blank=True, verbose_name='MainTitle')
    headTitle = models.CharField(max_length=20, null=True, blank=True, verbose_name='HeadTitle')
    copyright = models.CharField(max_length=100, null=True, blank=True, verbose_name='CopyRight')
    url = models.CharField(max_length=50, null=True, blank=True, verbose_name='SystemURL地址')


    def __str__(self):
        return self.loginTitle

    class Meta:
        verbose_name = "System setting"
        verbose_name_plural = verbose_name

    @classmethod
    def getSystemSetupLastData(self):
        return dict(system_setup=SystemSetup.objects.last())


class EmailSetup(models.Model):
    emailHost = models.CharField(max_length=30, verbose_name='SMTP Server')
    emailPort = models.IntegerField(verbose_name='SMTP Port')
    emailUser = models.EmailField(max_length=100, verbose_name='Email Account')
    emailPassword = models.CharField(max_length=30, verbose_name='Email Password')

    def __str__(self):
        return self.emailHost

    class Meta:
        verbose_name = '发件邮箱设置'
        verbose_name_plural = verbose_name

    @classmethod
    def getEmailSetupLastData(self):
        return EmailSetup.objects.last()
