from datetime import datetime

from django.db import models
from django.contrib.auth.models import AbstractUser

from rbac.models import Role


class UserProfile(AbstractUser):
    """
    用户: makemigration提示错误：sers.UserProfile.user_permissions: (fields.E304)，
    需要在settings中指定自定义认证模型：AUTH_USER_MODEL = 'users.UserProfile'
    """
    name = models.CharField(max_length=20, default="", verbose_name="Name")
    birthday = models.DateField(null=True, blank=True, verbose_name="Data of Birth")
    gender = models.CharField(max_length=10, choices=(("male", "male"), ("famale", "famale")), default="male",
                              verbose_name="Gender")
    mobile = models.CharField(max_length=11, default="", verbose_name="mobile")
    email = models.EmailField(max_length=100, verbose_name="email")
    image = models.ImageField(upload_to="image/%Y/%m", default="image/default.jpg", max_length=100, null=True,
                              blank=True)
    department = models.ForeignKey("Structure", null=True, blank=True, verbose_name="department",on_delete=models.CASCADE)
    post = models.CharField(max_length=50, null=True, blank=True, verbose_name="position")
    superior = models.ForeignKey("self", null=True, blank=True, verbose_name="superior",on_delete=models.CASCADE)
    roles = models.ManyToManyField("rbac.Role", verbose_name="roles", blank=True)
    joined_date = models.DateField(null=True, blank=True, verbose_name="joined date")

    class Meta:
        verbose_name = "usr info"
        verbose_name_plural = verbose_name
        ordering = ['id']

    def __str__(self):
        return self.name


class Structure(models.Model):
    """
    组织架构
    """
    type_choices = (("firm", "firm"), ("department", "department"))
    title = models.CharField(max_length=60, verbose_name="title")
    type = models.CharField(max_length=20, choices=type_choices, default="department", verbose_name="type")
    parent = models.ForeignKey("self", null=True, blank=True, verbose_name="parent",on_delete=models.CASCADE)
    address = models.CharField(max_length=60, verbose_name="address")
    telephone = models.CharField(max_length=60, verbose_name="telephone")
    abn = models.CharField(max_length=60, verbose_name="abn")


    class Meta:
        verbose_name = "organization"
        verbose_name_plural = verbose_name

    def __str__(self):
        return self.title


