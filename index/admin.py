from django.contrib import admin

# Register your models here.

from index.models import Users, GoodsType, Goods, CartInfo, Orders

class GoodsAdmin(admin.ModelAdmin):
    #指定在列表页中显示的字段们
    list_display = ('title', 'price','isActive')
    #指定在列表页中也能够连接到详情页中的字段们
    list_display_links = ('title',)
    #指定在列表页中就允许修改的字段们
    list_editable=('price',)
    #指定在列表页中允许被搜索的字段们
    search_fields=('title','price')
    #在列表页的右侧增加一个过滤器,实现快速筛选
    list_filter = ('goodsType','isActive')
    #在详情页中,对字段们进行分组显示
    fieldsets = (
        ('基本选项',{
            'fields':('title','price'),
            }),
        ('高级选项',{
            'fields':('isActive','goodsType','aoi','picture'),
            'classes':('collapse',)
            })
        )

admin.site.register(Users)
admin.site.register(Goods,GoodsAdmin)
admin.site.register(GoodsType)
admin.site.register(CartInfo)
admin.site.register(Orders)