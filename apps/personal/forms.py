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
            "title": {"required": "Please enter the application title"},
            "type": {"required": "Please enter the application type"},
            "status": {"required": "Please enter the application status"},
            "do_time": {"required": "Please enter the desired meeting time"},
            "content": {"required": "Please enter application information"},
            "customer": {"required": "Please choose Traditional Owner"},
            "land": {"required": "Please choose land"},
        }

    def clean(self):
        cleaned_data = super(WorkOrderCreateForm, self).clean()
        approver = cleaned_data.get("approver", "")
        number = cleaned_data.get("number")
        if not approver:
            raise forms.ValidationError("Please select approver")
        if ExplorationApplication.objects.filter(number=number).count():
            raise forms.ValidationError("Application ID already exists")


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
            raise forms.ValidationError("Please select approver")


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
