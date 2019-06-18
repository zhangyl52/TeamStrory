# C#编程规范
## 引言
像大多数规范手册一样，本手册旨在为开发人员提供一套统一的编程规范。

编码规范主要用于以下目的：
* 为代码创建一致的外观，以便开发人员可以专注于内容，而不是布局。
* 使开发人员能够根据以往经验做出假设，从而更快理解代码。
* 有助于更改和维护代码。

请记住，本手册中的所有内容都是指南，部分规范因公司需要而强制执行。如果发现本手册未说明或者有争议的规范，请联系我们以便完成更高质量的代码。  
"Break any of these rules sooner than say anything outright barbarous."
—George Orwell
## 命名规范
按照惯例，C#程序类型名称、名称空间、和所有公共成员都使用PascalCase 命名规则。此外，以下约定很常见：
* 接口名称以大写字母I开头，I之后使用PascalCase。
* 属性类型以单词Attribure结尾。
* 枚举类型对非标志使用单数名词，对标志使用复数名词。
* 标识符不应该包含两个连续_符号，这些名称保留用于编译器生成的标识符  

1. 一般命名约定  
要区分标识符中的单词，请将标识符中每个单词的首字母大写。不要使用下划线来区分单词或标识符中的任何位置。根据标识符的使用，有两种适当的方法来标识标识符：PascalCase、CamelCase
2. 单词选择
    * _【推荐】_ 请选择易读的、可读性强的单词 `正例：HorizontalAlignment 反例：AlignmentHorizontal`
    * __【强制】__ 不要使用下划线，连字符或任何其他非字符数字字符
    * __【强制】__ 避免使用与编程语言的关键字冲突的标识符
    * __【强制】__ 不要使用缩写和缩写作为标识符名称的一部分 `正例：GetWindow 反例：GetWin`
3. 程序集和DLL
    * _【推荐】_ 为大量功能的程序集DLL选择名称 `System.Data`
    * _【推荐】_ 考虑以下模式命名DLL：\<Company\>.\<Component\>.dll
4. 名称空间
    * _【推荐】_ 命名名称空间一般规则：\<Company\>.(\<Product\>|\<Technology\>)[\.\<Feature\>][\.\<Subnamespace\>]
    * _【推荐】_ 使用公司名称为名称空间的前缀
    * __【强制】__ 使用PascalCase，并考虑适当的名称空间的名称
5. 类、结构和接口
    * __【强制】__ 类、结构和接口使用PascalCase，用名词或名称短语命名类和结构
    * __【强制】__ 类、结构和接口名称尽量少用或不用缩写，若使用了缩写一定要在注释中详细注明类的用途
    * __【强制】__ 类、结构不要使用类型前缀，例如，类名称前加上C以表示这是一个类 `反例：CButton`
    * __【强制】__ 类、结构和接口命名中不要使用下划线及数字
    * __【强制】__ 使用字符I前缀接口名称，以指示该类型是接口 `正例：IComponent、ICustomAttributeProvider`
    * _【注意】_ 有时候虽然该类不是接口，但需要提供以字母 I 开始的类名称，此时只要 I 是作为类名称组成部分的整个单词的第一个字母，这依然是可行的
    * __【强制】__ 类型名称和源文件名称一致
    * _【推荐】_ 避免使用大文件，如果一个文件里的代码超过300-400行，必须考虑将代码分开到不同的类中
    * _【推荐】_ 类成员的排列顺序，类型成员的排列顺序自上而下依次为
        * 字段：私有字段、受保护字段
        * 属性：私有属性、受保护属性、公有属性
        * 事件：私有事件、受保护事件、公有事件
        * 构造函数：参数数量最多的构造函数，参数数量中等的构造函数，参数数量最少的构造函数
        * 方法：重载方法的排列顺序与构造函数相同，从参数数量最多往下至参数最少
6. 泛型通用参数类型
    * _【推荐】_ 考虑使用T具有一个单字母类型参数的类型参数名称
    * _【推荐】_ 单个字母的名称无法言明，请使用描述性名称命名泛型参类型参数
    * _【推荐】_ 使用前缀T描述类型参数名称（描述性名称）
    ```csharp
    // 正例
    public interface ISessionChannel<TSession> where TSession: ISession
    {
        // Field, Property, Mothed and so on.
    }
    ```
7. 枚举
    * _【推荐】_ 使用单数类型名称进行枚举
    * __【强制】__ 使用PascalCase
    * __【强制】__ 不要在枚举类型名称中使用Enum后缀
    * __【强制】__ 不要在枚举类型名称中使用Flag或Flags后缀
    * __【强制】__ 不要在枚举类型名称中使用前缀 `反例：枚举ButtonType的类型名称中使用BTRed、BTBlack`
    * __【强制】__ 一定不能使用汉字作为枚举值
8. 方法
    * _【推荐】_ 使用名词或名词短语 `正例：CompareTo、Split、Trim、ToString`
    * __【强制】__ 使用PascalCase(所有方法都使用此规则，包括但不限于Public)
9. 属性
    * _【推荐】_ 使用名词短语或形容词
    * __【强制】__ 使用PascalCase
    * _【推荐】_ 使用复数名词来命名集合属性，而不是使用单个短语后面跟List或Collection
    * __【强制】__ 使用肯定短语命名boolean属性，如添加前缀Is、Can、Has `正例：CanSeek、IsOk、HasValue`
10. 字段和常量
    * _【推荐】_ 使用名词短语或形容词
    * __【强制】__ Public字段使用PascalCase，Private字段使用CamelCase
    * _【推荐】_ 不建议定义Public字段，如有必要用Public属性代替
    * __【强制】__ 不要使用前缀 `反例：g_type
    * __【强制】__ 所有单词大写，多个单词之间用 下划线（”_”）隔开
11. 特性
    * __【强制】__ 使用PascalCase
    * __【强制】__ 特性名称以Attribute结尾
12. 事件
    * _【推荐】_ 使用动词或动词短语 `正例：Clicked、Painting、DroppedDown`
    * _【推荐】_ 使用现在和过去的时态，给予事件名词前后概念 `正例：Closing、Closed`
    * _【推荐】_ 使用EventHandler后缀命名事件处理程序（委托）
    ```csharp
    public delegate void ClickEventHandler(object sender, EventArgs args);
    public event ClickEventHandler OnClick;
    
    private static void Button_OnClick(object sender, EventArgs args)
    {
    	throw new NotImplementedException();
    }
    ```
13. 参数
    * _【推荐】_ 使用描述性参数名称
    * __【强制】__ 使用CamelCase，尽量少用或不用缩写，若使用了缩写一定要在注释中详细注明参数的用途。 
    * __【强制】__ 考虑根据参数的含义而不是参数的类型使用名称
14. 资源
    * _【推荐】_ 使用描述性而非短期标识符
    * __【强制】__ 使用PascalCase
15. 局部变量
    * __【强制】__ 使用CamelCase，尽量少用或不用缩写，若使用了缩写一定要在注释中详细注明参数的用途。 

## 格式规范
良好的布局使用格式来强调代码的结构并使代码更易于阅读
1. 单行代码说明
    * __【强制】__ 每行只有一个语句
    * __【强制】__ 每行只写一个声明
    * _【推荐】_ 单行字符限制不超过120个，超出需要换行，并遵循一下规则：
        * 第二行开始，相对第一行缩进4个空格(参照(3))
        * 运算符与上下文一起换行
        * 方法调用的点符号与上下文一起换行
        * 多个参数超长的，逗号后进行换行
        * 括号前不要换行
        ```csharp
        public string StringAppend(string content, string appendA, string appendB, string appendC, string appendD, string appendE,
        	string appendF, string appendG)
        {
        	StringBuilder stringBuilder = new StringBuilder(content);
        	stringBuilder.Append(appendA)
        		.Append(appendB)
        		.Append(appendC)
        		.Append(appendD)
        		.Append(appendE)
        		.Append(appendF)
        		.Append(appendG);
        	return stringBuilder.ToString();
        }
        ```
2. 大括号的使用
    * _【推荐】_ 如果大括号内为空，简写为{}即可，不需要换行
    * __【强制】__ 名称空间、类、方法、if/for/foreach/while/switch/do/try-catch中，左大括号和右大括号都必须单独另起一行
    * __【强制】__ 默认属性中，左大括号和右大括号保持在同一行 `正例：public string Name { get; set; }`
3. 缩进和空格
    * __【强制】__ 缩进统一采用4个空格，禁止使用制表符
    * __【强制】__ 任何运算符左右必须添加一个空格
    * __【强制】__ 方法参数在定义和传入时，多个参数逗号后面必须加空格
    * __【强制】__ if/for/foreach/while/switch/do/try-catch 等保留字与括号之间必须加空格
4. 空行
    * __【强制】__ 在方法定义和属性定义之间添加一个空行
    * _【推荐】_ 同一代码块中，执行语句组、定义语句组、不同业务逻辑之间建议插入一个空行

## 控制语句
1. if/else/for/while/do/switch
    * __【强制】__ 必须使用大括号，即使只有一行代码，禁止省略大括号
    * __【强制】__ switch中别忘记break，且必须在最后包含一个default语句
    * _【推荐】_ 推荐尽量少用else，逻辑上超过3层推荐使用卫语句或状态模式实现
2. _【推荐】_ 不要在条件判断中执行复杂的语句，将复杂语句逻辑判断赋值给一个布尔类型或者提取成返回布尔类型的方法，以便提高可读性
```csharp
public void Simple()
{
	User user = new User();

	if (IsYoungPeople(user))
	{
		//He/She may be like game
	}
	else
	{
		// so on
	}
}

public bool IsYoungPeople(User user)
{
	// Check whether it is a young people
	return true;
}
```
3. 循环语句
    * _【推荐】_ 谨慎考量性能
    * _【推荐】_ 合理使用try-catch，如严格的步骤执行，在catch中使用continue将发生不可预估的错误

## 代码注释
1. 类、方法、属性
    * _【推荐】_ 类、方法、属性使用///注释
    * _【推荐】_ 方法中除了方法用途，必须添加参数说明，Visual Studio输入///会自动添加模板
    ```csharp
    /// <summary>
    /// 执行指定类型的任务
    /// </summary>
    /// <param name="type">0 当线程、1 多线程</param>
    public void RunTask(int type)
    {
    	// to do ...
    }
    ```
2. 代码块注释
    * __【强制】__ 单行注释使用//于需注释语句上方另起一行
    * __【强制】__ 多行注释使用/\*\*/于需注释语句上方另起一行
    * __【强制】__ 注释//后添加一空格接注释描述
    * __【强制】__ 不推荐在代码行末尾添加注释，如必须添加请添加两空格在接//
3. __【强制】__ 所有枚举类型字段必须要有注释，并说明用途
4. _【推荐】_ 与其用半吊子英文来注释，不如用中文说清楚，保留专有名词和关键字即可
5. _【推荐】_ 修改代码时，相应的注释也要进行修改，特别是参数、返回值和核心逻辑
6. 注释掉的代码
    * __【强制】__ 临时注释掉的，请添加注释备注以便他人明白
    * __【强制】__ 已确认用不可用的，请直接从代码中删除，不要担心找不回来，代码仓库中一定会有
7. _【推荐】_ 特殊注释如TODO等、请写明标注人和时间等

## 异常处理
1. __【强制】__ 禁止使用异常来做流程控制、条件控制
2. _【注意】_ 对大段代码进行try-catch，这是不负责的表现，请分清稳定代码和不稳定代码
3. __【强制】__ 禁止捕获异常而不做处理，如果不想处理，请将该异常抛给它的调用者
4. _【注意】_ 不推荐在底层业务代码中处理异常，可以自定义异常抛给外层处理
5. __【强制】__ 最外层逻辑代码必须处理异常，将其转化为用户可以理解的内容，如果是web请添加相应的错误界面
6. _【注意】_ 有try块放到了事务代码中，catch异常后，如果需要回滚事务，一定要注意手动回滚事务
7. __【强制】__ 对于资源的使用，如os、数据库等操作，finally块必须对资源对象、流对象进行关闭
8. __【强制】__ 不能在finally块中使用return
9. _【注意】_ 方法的返回值可以为null，不强制返回空集合、空字符串、或者空对象等，但必须添加注释充分说明什么情况下会返回null值，调用方需要进行null判断防止NPE（Null Pointer Exception）问题
10. _【注意】_ 防止NPE(Null Pointer Exception)，是程序员的基本修养，注意NPE产生的场景
    * 返回类型为实体类，有可能是null
    * 数据库的查询结果可能为null
    * 即使即使Count大于0，取出的数据元素也可能为null
    * 远程调用返回对象，一律要求进行NPE判断
    * 对于Session、cookie中获取的数据，建议NPE检查，避免空指针
    * 级联调用obj.getA().getB().getC()，一连串调用，易产生NPE
11. _【注意】_ 在代码中使用“抛异常”还是“返回错误码”，对于公司外的http/api开放接口必须使用“错误码”；而应用内部推荐异常抛出；跨应用间RPC调用优先考虑使用Result方式，封装isSuccess、“错误码”、“错误简短信息”  
    说明：关于RPC方法返回方式使用Result方式的理由：
    * 使用抛异常返回方式，调用方如果没有捕获到就会产生运行时错误
    * 如果不加栈信息，只是new自定义异常，加入自己的理解的error message，对于调用端解决问题的帮助不会太多。如果加了栈信息，在频繁调用出错的情况下，数据序列化和传输的性能损耗也是问题
12.  _【注意】_ 避免出现重复的代码（Don’t Repeat Yourself），即DRY原则。随意复制和粘贴代码，必然会导致代码的重复，在以后需要修改时，需要修改所有的副本，容易遗漏。必要时抽取共性方法，或者抽象公共类，甚至是共用模块。

## 日志
1. _【推荐】_ 再关键代码和异常处添加日志，以便有问题时能够快速定位错误点
2. __【强制】__ 避免重复打印日志，浪费磁盘空间
3. _【推荐】_ 谨慎地记录日志。生产环境禁止输出debug日志；有选择地输出info日志；如果使用warn来记录刚上线时的业务行为信息，一定要注意日志输出量的问题，避免把服务器磁盘撑爆，并记得及时删除这些观察日志。

## 集合处理
1. __【强制】__ 不要在foreach循环里进行元素的remove/add操作，否则会引发ThrowInvalidOperationException异常
2. _【注意】_ 将数组<Object>转集合如List<Object>，对任意List中的元素的修改都将反映到原数组上。
3. _【推荐】_ 集合初始化时，尽量指定集合初始值大小
4. _【推荐】_ 建议使用KeyValuePair遍历Dictionary，而非使用Keys。因为遍历Keys后再用Dictionary[key]取值，实际会遍历两次集合。
```csharp
Dictionary<string, string> keyValues = new Dictionary<string, string>();
foreach(KeyValuePair<string, string> keyValue in keyValues)
{
	// do 
}
```
5. __【强制】__ Dictionary的Key不能为空，否则会抛出异常
6. _【推荐】_ 利用HashSet元素唯一的特性，可以快速对一个集合进行去重操作，避免使用List的contains方法进行遍历、对比、去重操作

## 并发处理
1. __【强制】__ 获取单例对象需要保证线程安全，其中的方法也要保证线程安全
2. __【强制】__ 高并发时，同步调用应该去考量锁的性能损耗。能用无锁数据结构，就不要用锁；能锁区块，就不要锁整个方法体；能用对象锁，就不要用类锁。
3. _【推荐】_ 多线程任务时，推荐使用ThrealPool、Task、Parallel，避免资源浪费
4. __【强制】__ 并发修改同一记录时，避免更新丢失，要么在应用层加锁，要么在缓存加锁，要么在数据库层使用乐观锁
5. __【强制】__ 通过双重检查锁（double-checked locking）（在并发场景）实现延迟初始化的优化问题隐患(可参考 The "Double-Checked Locking is Broken" Declaration)

## 其他
待完善