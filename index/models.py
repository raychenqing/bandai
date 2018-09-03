from django.db import models
import django.utils.timezone as timezone

# Create your models here.

# 用户实体
class Users(models.Model):
    # 电话号码 - CharField()
    uphone = models.CharField(max_length=11)
    # 密码 - CharField()
    upwd = models.CharField(max_length=30)
    # 电子邮件 - EmailField()
    uemail = models.EmailField()
    # 用户名 - CharField()
    uname = models.CharField(max_length=20)
    # 地址 - CharField()
    address = models.CharField(max_length=100)
    # 启用/禁用 - BooleanField(),默认值为True
    isActive = models.BooleanField(default=True)

    def __str__(self):
        return self.uphone

# 商品类型 Models

class GoodsType(models.Model):
    title = models.CharField(max_length=40)
    picture = models.ImageField(upload_to='static/upload/goodstype')
    desc = models.TextField()

    def to_dict(self):
        dic = {
            "title":self.title,
            "picture":self.picture.__str__(),
            "desc":self.desc,
        }
        return dic

    def __str__(self):
        return self.title

    class Meta:
        verbose_name='商品类型'
        verbose_name_plural = verbose_name

# 商品 Models
class Goods(models.Model):
    title = models.CharField(max_length=40,verbose_name='商品名称')
    price = models.DecimalField(max_digits=7,decimal_places=2,verbose_name='商品价格')
    #库存数量amount_of_inventory
    aoi = models.PositiveIntegerField(default=1,verbose_name='库存数量')
    picture = models.ImageField(upload_to='static/upload/goods',verbose_name='图片')
    isActive = models.BooleanField(default=True,verbose_name='是否上架')
    #增加对商品类型的引用(1(GoodsType):M(Goods))
    goodsType = models.ForeignKey(GoodsType,null=True,verbose_name='类型')
    version = models.IntegerField(default=1,verbose_name='版本号')

    def update_aoi(self,id,amount):
        if self.aoi < amount:
            raise errors.InsufficentFunds()
        updated = Goods.objects.filter(
            id = self.id,
            version = self.version,
        ).update(
            aoi = self.aoi - amount,
            version = self.version + 1,
        )
        return updated

    def __str__(self):
        return self.title

    class Meta:
        verbose_name='商品'
        verbose_name_plural = verbose_name

class CartInfo(models.Model):
    user = models.ForeignKey(Users)
    good = models.ForeignKey(Goods)
    ccount = models.PositiveIntegerField(verbose_name='数量')

    class Meta:
        verbose_name='购物车'
        verbose_name_plural = verbose_name

class Orders(models.Model):
    user = models.ForeignKey(Users)
    good = models.ForeignKey(Goods)
    ccount = models.PositiveIntegerField(verbose_name='数量')
    create_date = models.DateTimeField('交易下单时间',null=True,default = timezone.now)
    done_date = models.DateTimeField('交易完成时间',null=True)
    comment = models.CharField(max_length=200,verbose_name='评论')
    isDone = models.BooleanField(default=False,verbose_name='付款完成')
    confirm_reciept = models.BooleanField(default=False,verbose_name='确认收货')

    def __str__(self):
        return self.user.uphone +"的订单:"+ self.good.title

    class Meta:
        verbose_name='订单'
        verbose_name_plural = verbose_name