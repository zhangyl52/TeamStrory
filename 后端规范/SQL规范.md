# SQL规范
## 1 BEGIN…END不能省
若BEGIN…END 之间只包含单独一命令行，BEGIN和END边界也不能省略。
## 2 CASE
格式1
```
CASE <运算式>
    WHEN <运算式> THEN <运算式>
    …
    WHEN <运算式> THEN <运算式>
    [ELSE <运算式>]
END
格式2
CASE
    WHEN <条件表达式> THEN <运算式>
    …
    WHEN <条件表达式> THEN <运算式>
    [ELSE <运算式>]
END
```

A 尽量避免在WHERE 语句或者ORDER BY中使用CASE
B 所有的CAE要有ELSE分支，即默认值

## 3 关键字一定要大写
UniqueIdnetifier可以只大写U和I
## 4 四个空格统一缩进格式，字符直接的空格只能是一个，不能多域
比如 
```
正确
CREATE PROCEDURE
错误
CREATE  PROCREFDURE
```
不要多一个空格。也不要少一个空格。

## 5 分页用fetch，pageIndex=1开始
SELECT [column1],[column2]... ,[columnN]
FROM [tableName]
ORDER BY [columnM]
OFFSET pageIndex*pageSize ROWS
FETCH NEXT pageSize ROWS ONLY

## 6 字段要有默认值，有默认值的约束名遵循DF_表名_列名”

约束名示例：

DF_HouseDealNew_HouseDealNewID
GO
ALTER TABLE WeizhanVisitSta ADD HouseRentCountTotal INT NOT NULL CONSTRAINT [DF_WeizhanVisitSta_HouseRentCountTotal] DEFAULT(0)
GO
## 7 字段要有注释即脚本要规范
注释示例：
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'小程序介绍' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Weizhans', @level2type=N'COLUMN',@level2name=N'MiniprogramSignatureInfo'
GO

##  8 Sql Server 问题之between and 使用注意事项
MS SQL Server 系统中使用Bewteen ... And 其作用域是闭区间,即包含左右边界值在内的。

## 9 存储过程要有作者，每一次修改要增加作者
示例
···
Author:		<Author,zhangyanli,Name>
Alter date: <Create Date,,2019-04-30>
Description:	<Description,,新增了一个查询字段>

Author:		<Author,xuduo,Name>
Create date: <Create Date,,2019-04-25>
Description:	<Description,,查询房源单信息>
···

##  10 使用表的别名(Alias)及规范
SELECT 表大于1就要取别名，以大写A，B....顺序取别名；禁止用SELECT * ,只取需要的列; 
当在SQL语句中连接多个表时，请使用表的别名并把别名前缀于每个Column上，这样可以减少解析的时间并减少那些由Column歧义引起的语法错误。　


##  11WITH（NOLOCK）不能少
SELECT 语句一定要加WITH（NOLOCK）
非高并发场景，非金融类业务场景

##  12 INSERT 要写具体列
使用Insert时，必须指定插入的字段名，严禁不指定字段名直接插入values
INSERT INTO <要插入的表名>
(<列1>, <列2>, .., <列n-1>, <列n>)VALUES 
(<列1值>, <列2值>, .., <列n-1值>, <列n值>)


## 13 SELECT子句中避免使用'*'。

当你想在SELECT子句中列出所有的COLUMN时，使用动态SQL列引用
`'*'`是一个方便的方法，不幸的是，这是一个非常低效的方法。实际上，SQLSERVER在解析的过程中
，会将`'*'`依次转换成所有的列名，这个工作是通过查询数据字典完成的，这意味着将耗费更多的时间

## 14 减少访问数据库的次数
## 15 存过程的所有参数都顶边
## 16 临时表
用完要DELETE
能用表变量代替就不要用临时表



