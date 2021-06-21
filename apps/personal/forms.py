# @Time   : 2018/5/6 17:22
# @Author : RobbieHan
# @File   : forms.py


from django import forms
from django.contrib.auth import get_user_model

from .models import ExplorationApplication, ExplorationApplicationRecord

User = get_user_model()


class ImageUploadForm(forms.ModelForm):
    class Meta:
        model = User
        fields = ['image']


class UserUpdateForm(forms.ModelForm):
    class Meta:
        model = User
        fields = ['name', 'gender', 'birthday', 'email']


class WorkOrderCreateForm(forms.ModelForm):
    # approver = forms.(required=True, error_messages={"required": "请选择审批人"})
    class Meta:
        model = ExplorationApplication
        fields = '__all__'
        error_messages = {
            "title": {"required": "请输入工单标题"},
            "type": {"required": "请选择工单类型"},
            "status": {"required": "请选择工单状态"},
            "do_time": {"required": "请输入工单安排时间"},
            "content": {"required": "请输入工单内容"},
            "customer": {"required": "Please choose Traditional Owner"},
            "land": {"required": "Please choose land"},
        }

    def clean(self):
        cleaned_data = super(WorkOrderCreateForm, self).clean()
        approver = cleaned_data.get("approver", "")
        number = cleaned_data.get("number")
        if not approver:
            raise forms.ValidationError("请选择工单审批人")
        if ExplorationApplication.objects.filter(number=number).count():
            raise forms.ValidationError("工单编号已存在")


class WorkOrderUpdateForm(forms.ModelForm):
    class Meta:
        model = ExplorationApplication
        fields = '__all__'
        error_messages = {
            "title": {"required": "Please input exploration application title"},
            "type": {"required": "Please choose exploration application type"},
            "status": {"required": "Please choose exploration application status"},
            "do_time": {"required": "Please input exploration application schedule time"},
            "content": {"required": "Please input exploration application content"},
            "customer": {"required": "Please choose Traditional Owner"},
            "land": {"required": "Please choose land"},
        }

    def clean(self):
        cleaned_data = super(WorkOrderUpdateForm, self).clean()
        approver = cleaned_data.get("approver", "")
        if not approver:
            raise forms.ValidationError("请选择工单审批人")


class WorkOrderRecordForm(forms.ModelForm):
    class Meta:
        model = ExplorationApplicationRecord
        exclude = ['file_content', ]


class WorkOrderRecordUploadForm(forms.ModelForm):
    class Meta:
        model = ExplorationApplicationRecord
        fields = ['file_content']


class WorkOrderProjectUploadForm(forms.ModelForm):
    class Meta:
        model = ExplorationApplication
        fields = ['file_content']
