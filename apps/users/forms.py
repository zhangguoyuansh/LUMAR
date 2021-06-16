# -*- coding: UTF-8 -*-
# __author__ : RobbieHan
# __data__  : 2017/10/12

import re

from django import forms
from django.contrib.auth import get_user_model

User = get_user_model()

from apps.users.models import Structure


class LoginForm(forms.Form):
    username = forms.CharField(required=True, error_messages={"required": "请填写用户名"})
    password = forms.CharField(required=True, error_messages={"required": "请填写密码"})


class UserUpdataForm(forms.ModelForm):
    class Meta:
        model = User
        fields = ['name', 'gender', 'birthday', 'username', 'mobile', 'email', 'joined_date', 'department', 'post',
                  'superior', 'is_active', 'roles']


class UserCreateForm(forms.ModelForm):
    """
    创建用户表单，进行字段验证
    """

    password = forms.CharField(
        required=True,
        min_length=6,
        max_length=20,
        error_messages={
            "required": u"Password cannot be empty",
            "min_length": "Password length is at least 6 digits",
        })

    confirm_password = forms.CharField(
        required=True,
        min_length=6,
        max_length=20,
        error_messages={
            "required": u"Confirm password cannot be empty",
            "min_length": "Password length is at least 6 digits",
        })

    class Meta:
        model = User
        fields = ['name', 'gender', 'birthday', 'username', 'mobile',
                  'email', 'joined_date', 'department', 'post',
                  'superior', 'is_active', 'roles', 'password']

        error_messages = {
            "name": {"required": "Name cannot be empty"},
            "username": {"required": "Username cannot be empty"},
            "email": {"required": "Email cannot be empty"},
            "mobile": {
                    "required": "Mobile cannot be empty",
                    "max_length": "Enter a valid mobile phone number",
                    "min_length": "Enter a valid mobile phone number"
            }

        }

    def clean(self):
        cleaned_data = super(UserCreateForm, self).clean()
        username = cleaned_data.get("username")
        mobile = cleaned_data.get("mobile", "")
        email = cleaned_data.get("email")
        password = cleaned_data.get("password")
        confirm_password = cleaned_data.get("confirm_password")

        if User.objects.filter(username=username).count():
            raise forms.ValidationError('Username：{} already exists'.format(username))

        if password != confirm_password:
            raise forms.ValidationError("Password is inconsistent")

        if User.objects.filter(mobile=mobile).count():
            raise forms.ValidationError('mobile：{} already exists'.format(mobile))

        # 手机号码合法性验证
        REGEX_MOBILE = "^(?:\+?61|\(?0)[2378]\)?(?:[ -]?[0-9]){8}$"
        if not re.match(REGEX_MOBILE, mobile):
            raise forms.ValidationError("Illegal mobile phone number")

        if User.objects.filter(email=email).count():
            raise forms.ValidationError('Email：{} alread exists'.format(email))


class AdminPasswdChangeForm(forms.Form):
    """
    管理员用户修改用户列表中的用户密码
    """
    # def __init__(self, *args, **kwargs):
    #     super(AdminPasswdChangeForm, self).__init__(*args, **kwargs)

    password = forms.CharField(
        required=True,
        min_length=6,
        max_length=20,
        error_messages={
            "required": u"Password cannot be empty"
        })

    confirm_password = forms.CharField(
        required=True,
        min_length=6,
        max_length=20,
        error_messages={
            "required": u"Confirm password cannot be empty"
        })

    def clean(self):
        cleaned_data = super(AdminPasswdChangeForm, self).clean()
        password = cleaned_data.get("password")
        confirm_password = cleaned_data.get("confirm_password")
        if password != confirm_password:
            raise forms.ValidationError("Password is inconsistent")


class StructureUpdateForm(forms.ModelForm):
    class Meta:
        model = Structure
        fields = ['type', 'title', 'parent']
