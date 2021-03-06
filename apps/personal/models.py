from django.db import models

from django.contrib.auth import get_user_model

from adm.models import Customer,Equipment

User = get_user_model()


class ExplorationApplication(models.Model):
    type_choices = (('0', 'Agent'), ('1', 'Applicant'))
    status_choices = (('0', 'Application returned'), ('1', 'Create-save'), ('2', 'Submitted-waiting for assess'), ('3', 'Assessed-waiting for receipt'), ('4', 'Receipted-waiting for comfirm'), ('5', 'Application finished'))
    number = models.CharField(max_length=10, verbose_name='工单号')
    title = models.CharField(max_length=50, verbose_name='标题')
    type = models.CharField(max_length=10, choices=type_choices, default='0', verbose_name='工单类型')
    status = models.CharField(max_length=10, choices=status_choices, default='0', verbose_name='工单状态')
    do_time = models.DateTimeField(default='', verbose_name='安排时间')
    add_time = models.DateTimeField(auto_now_add=True, verbose_name='创建时间')
    content = models.CharField(max_length=300, verbose_name='工单内容')
    file_content = models.FileField(upload_to='file/%Y/%m', blank=True, null=True, verbose_name='项目资料')
    customer = models.ForeignKey(Customer, verbose_name='Traditional Owner',on_delete=models.CASCADE)
    land = models.ForeignKey(Equipment, verbose_name='land',on_delete=models.CASCADE)

    venue = models.CharField(max_length=50,blank=True, null=True, verbose_name='venue')
    catering = models.CharField(max_length=50,blank=True, null=True, verbose_name='catering')
    accommodation = models.CharField(max_length=50,blank=True, null=True, verbose_name='accommodation')
    travel = models.CharField(max_length=50,blank=True, null=True, verbose_name='travel')



    proposer = models.ForeignKey(User, related_name='proposer', blank=True, null=True, on_delete=models.SET_NULL, verbose_name='申请人')
    approver = models.ForeignKey(User, related_name='approver', blank=True, null=True, on_delete=models.SET_NULL, verbose_name='审批人')
    receiver = models.ForeignKey(User, related_name='receiver', blank=True, null=True, on_delete=models.SET_NULL, verbose_name='接单人')

    class Meta:
        verbose_name = '工单信息'
        verbose_name_plural = verbose_name

    def __str__(self):
        return self.title


class ExplorationApplicationRecord(models.Model):
    type_choices = (('0', 'Returned'), ('1', "Assessed"), ('2', "Receipted"), ('3', "Confirmed"))
    name = models.ForeignKey(User, verbose_name=u"记录人",on_delete=models.CASCADE)
    work_order = models.ForeignKey(ExplorationApplication, verbose_name=u"工单信息",on_delete=models.CASCADE)
    record_type = models.CharField(max_length=10, choices=type_choices, verbose_name=u"记录类型")
    content = models.CharField(max_length=500, verbose_name=u"记录内容", default="")

    file_content = models.FileField(upload_to='file/%Y/%m', blank=True, null=True, verbose_name='实施文档')

    invoice = models.FileField(upload_to='file/%Y/%m', blank=True, null=True, verbose_name='实施文档')


    add_time = models.DateTimeField(auto_now_add=True, verbose_name=u"记录时间")

    class Meta:
        verbose_name = u"执行记录"
        verbose_name_plural = verbose_name

    def __str__(self):
        return self.record_type



