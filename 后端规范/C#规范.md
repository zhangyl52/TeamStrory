# C#规范 #
## 概念定义 ##

Pascal-Case 

Pascal命名法：每个单词首字母均大写。如：ArrayList. 

Camel-Case 

Camel命名法：第一个单词首字母小写，其余单词首字母大写。如：hotelViewModel. 
## C# 编码规范  ## 
### 类  ###
1. 使用 Pascal 大小写。 
2. 用名词或名词短语命名类，保证类名清晰，尽量达到见名知义的境界。 
3. 类名称尽量少用或不用缩写，若使用了缩写一定要在注释中详细注明类的用途。 
4. 不要使用类型前缀，例如，类名称前加上C以表示这是一个类，如：CButton。 
5. 类命名中不要使用下划线及数字。 
6. 有时候虽然该类不是接口，但需要提供以字母 I 开始的类名称，此时只要 I 是作为
类名称组成部分的整个单词的第一个字母，这依然是可行的。例如，类名 
IdentityOrder 就是适用的。 
7. 类命名示例： 
```
a) public class FlightBuilder 

b) public class HotelInfo 
```
 
c) public class TicketShopper 
8补充 

类型名称和源文件名称一致
当类型命名为Product时，其源文件命名只能是Product.cs。

避免使用大文件。如果一个文件里的代码超过300-400行，必须考虑将代码分开到不同的类中。同时避免写太长的方法


调用类型成员内部其他成员，需加this,调用父类成员需加base


类型成员的排列顺序
类型成员的排列顺序自上而下依次为：
字段：私有字段、受保护字段
属性：私有属性、受保护属性、公有属性
事件：私有事件、受保护事件、公有事件
构造函数：参数数量最多的构造函数，参数数量中等的构造函数，参数数量最少的构造函数
方法：重载方法的排列顺序与构造函数相同，从参数数量最多往下至参数最少


### 接口 ### 
1. 接口使用大些字母I做前缀，其后跟名词或名词短语，以描述这个接口，名词和短语
使用Pascal方式，如，接口名称 ICache。 
2. 接口名称尽量少用或不用缩写，保证接口名清晰，尽量达到见名知义的境界，若使用
了缩写一定要在注释中详细描述接口的用途。 
3. 接口名称中不要使用下划线及数字。 
4. 接口命名示例： 

a) public interface ICache 

b) public interface IClone 
### 枚举 ###
1. 用短语命名枚举，采用Pascal方式，保证枚举名清晰，尽量达到见名知义的境界。 
2. 枚举名称尽量少用或不用缩写，若使用了缩写一定要在注释中详细注明枚举的用途。 
3. 不要在枚举名称后跟上 Enum 后缀，如：OrderFlagEnum。 
4. 一定不要使用汉字作为枚举值。 
5. 枚举命名示例： 
```
public enum OrderFlag {     
         None,         
         Flag 
      } 
```
 
### 属性 ###
1. 用名词或名词短语命名属性，保证属性名清晰，尽量达到见名知义的境界。 
2. 采用Pascal方式命名，尽量少用或不用缩写，若使用了缩写一定要在注释中详细注明属性的用途。 
3. 属性示例： 

a) public string FlightNo {get; set;} 
### 字段 ###
1. 用名词或名词短语命名字段，保证属性名清晰，尽量达到见名知义的境界。 
2. Public Field采用 Pascal方式命名，Private Field采用Camel方式命名，尽量少用
或不用缩写，若使用了缩写一定要在注释中详细注明字段的用途。 
3. 字段示例： 
a) public string FlightNo; 
b) private string studentName; 
### 常量 ### 
1. 所有单词大写，多个单词之间用 下划线（”_”）隔开，注意不是全角的下划线。如 
a) public const int PAGE_INDEX = 6; 
### 方法 ###
1. 用动词或动词短语命名方法名，保证方法名清晰，尽量达到见名知义的境界。 
2. 采用Pascal方式命名，尽量少用或不用缩写，若使用了缩写一定要在注释中详细注明

 
方法的用途
3. 方法名示例： 
```
a) public void ClearCache() 
b) private char[] GetCharArray() 
```
3 单一指责 一个方法只完成一个任务
4 在一个类中，各个方法需用一空行

### 参数 ### 
1. 使用描述性参数名称，保证参数名称清晰，尽量达到见名知义的境界。 
2. 参数命名使用Camel方式，尽量少用或不用缩写，若使用了缩写一定要在注释中详细
注明参数的用途。 
3. 参数命名示例： 
```
a) object GetCache(string cacheKey) 
b) bool IsInt(string needCheckString) 
```
### 局部变量 ###
1. 用名词或名词短语命名局部变量，保证变量名清晰，尽量达到见名知义的境界。 
2. 采用Camel方式命名，尽量少用或不用缩写，若使用了缩写一定要在注释中详细注明
变量的用途。 
3. 局部变量命名示例： 
```
a) int index = 6; 
b) string airline = string.Empty; 
c) private string flightNo = null; 
```
 
### 特性(Attribute) ###
1. 用名词或名词短语+Attribute方式命名特性，保证特性名清晰，尽量达到见名知义的
境界。 
2. 采用Pascal方式命名，尽量少用或不用缩写，若使用了缩写一定要在注释中详细注明
特性的用途。 
3. 特性命名示例： 
a) 
```
public class ValidAttribute : Attribute{} 
```

### 异常 ### 
1. 用名词或名词短语+Exception方式命名自定义异常，保证特性名清晰，尽量达到见
名知义的境界。 
2. 采用Pascal方式命名，一定不能使用简写。 
3. 异常命名示例： 
a) 
```
public class FlightException : ApplicationException{} 
```
2 内部抛出的异常，外部要有捕获和处理及日志记录

### 委托(delegate) ### 
1. 用动词短语命名委托，保证委托名清晰，尽量达到见名知义的境界。 
2. 采用Pascal方式命名，一定不能使用简写。 
3. 委托命名示例： 
a) 
```
delegate void PageChange( int pageIndex ); 
```

