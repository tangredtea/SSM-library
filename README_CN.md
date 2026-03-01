[![license](https://badgen.net/github/license/laowenruo/SSM-library?color=green)](https://github.com/laowenruo/SSM-library/blob/main/LICENSE)
[![stars](https://badgen.net/github/stars/laowenruo/SSM-library)](https://github.com/laowenruo/SSM-library/stargazers)
[![contributors](https://badgen.net/github/contributors/laowenruo/SSM-library)](https://github.com/laowenruo/SSM-library/graphs/contributors)
[![help-wanted](https://badgen.net/github/label-issues/laowenruo/SSM-library/help%20wanted/open)](https://github.com/laowenruo/SSM-library/labels/help%20wanted)
[![issues](https://badgen.net/github/open-issues/laowenruo/SSM-library)](https://github.com/laowenruo/SSM-library/issues)
[![PRs Welcome](https://badgen.net/badge/PRs/welcome/green)](http://makeapullrequest.com)

[English](README.md) | [简体中文](README_CN.md)

# 📚 SSM-Library

> 🚀 从零开始掌握 SSM 框架整合的实战之旅！

一个基于 **SSM 框架**（Spring + SpringMVC + MyBatis）构建的图书管理 Web 应用，适合初学者练手。本项目专为刚学完这些框架基础知识、想要实践整合的开发者设计，同时演示了 **PageHelper** 插件实现分页功能。

## ✨ 为什么选择这个项目？

非常适合想要：
- 从零实践 Spring、SpringMVC 和 MyBatis 的整合
- 理解 SSM 各组件如何在真实应用中协同工作
- 学习使用 PageHelper 实现分页功能
- 了解异常处理和 XSS 防护的最佳实践

## 功能特性

- 图书的增删改查（CRUD）操作
- 按书名模糊搜索
- 使用 PageHelper 实现分页
- 全局异常处理
- 使用 JSTL `<c:out>` 防止 XSS 攻击
- Bootstrap 3 响应式界面

## 技术栈

| 层次 | 技术 |
|------|------|
| 表现层 | JSP + Bootstrap 3 + JSTL |
| 控制层 | Spring MVC 5.1.9 |
| 业务层 | Spring IoC + AOP 事务管理 |
| 持久层 | MyBatis 3.5.2 + PageHelper 5.0 |
| 数据库 | MySQL 5.7+ |
| 连接池 | C3P0 |
| 构建工具 | Maven |
| 日志 | SLF4J + Log4j |

## 项目结构

```
SSM-library/
├── pom.xml
├── src/main/
│   ├── java/com/
│   │   ├── controller/          # Spring MVC 控制器
│   │   │   ├── BookController.java
│   │   │   └── GlobalExceptionHandler.java
│   │   ├── dao/                 # MyBatis Mapper 接口和 XML
│   │   │   ├── BookMapper.java
│   │   │   └── BookMapper.xml
│   │   ├── pojo/                # 实体类
│   │   │   └── Books.java
│   │   ├── service/             # 业务层
│   │   │   ├── BookService.java
│   │   │   └── BookServiceImpl.java
│   │   └── util/                # 工具类
│   │       └── DateUtils.java
│   ├── resources/
│   │   ├── applicationContext.xml
│   │   ├── spring-dao.xml
│   │   ├── spring-service.xml
│   │   ├── spring-mvc.xml
│   │   ├── mybatis-config.xml
│   │   ├── database.properties
│   │   └── log4j.properties
│   └── webapp/
│       ├── index.jsp
│       └── WEB-INF/
│           ├── web.xml
│           └── jsp/
│               ├── allBook.jsp
│               ├── addBook.jsp
│               ├── updateBook.jsp
│               └── error.jsp
└── schema.sql                    # 数据库结构和示例数据
```

## 环境要求

- JDK 1.8+
- Maven 3.x
- MySQL 5.7+
- Servlet 容器（如 Tomcat 8+）

## 快速开始

### 1. 创建数据库

导入 SQL 文件创建数据库和示例数据：

```sql
mysql -u root -p < schema.sql
```

这将创建 `ssmbuild` 数据库，包含 `books` 表和示例记录。

### 2. 配置数据库连接

编辑 `src/main/resources/database.properties`，填入你的 MySQL 账号密码：

```properties
jdbc.driver=com.mysql.jdbc.Driver
jdbc.url=jdbc:mysql://localhost:3306/ssmbuild?useSSL=false&useUnicode=true&characterEncoding=utf8&serverTimezone=Asia/Shanghai
jdbc.username=root
jdbc.password=你的密码
```

### 3. 构建和部署

```bash
mvn clean package
```

将生成的 `.war` 文件部署到 Tomcat 服务器，或直接在 IDE 中运行。

### 4. 访问应用

在浏览器中打开：

```
http://localhost:8080/mavenSSM/
```

## 配置说明

### MyBatis 层

- **数据库配置**：`database.properties` — JDBC 连接参数
- **MyBatis 配置**：`mybatis-config.xml` — 类型别名、PageHelper 插件、Mapper 注册
- **Mapper XML**：`BookMapper.xml` — 所有 CRUD 操作的 SQL 语句

### Spring 层

- **DAO 配置**：`spring-dao.xml` — 数据源（C3P0）、SqlSessionFactory、MapperScanner
- **Service 配置**：`spring-service.xml` — 组件扫描、Bean 注册、AOP 事务管理
- **MVC 配置**：`spring-mvc.xml` — 注解驱动的 MVC、视图解析器（JSP）、控制器扫描
- **根配置**：`applicationContext.xml` — 导入以上三个 Spring 配置文件

### Web 层

- **web.xml** — DispatcherServlet、字符编码过滤器（UTF-8）、会话超时（15 分钟）

## API 接口

| 方法 | URL | 说明 |
|------|-----|------|
| GET | `/book/allBook` | 列出所有图书（分页） |
| GET | `/book/toAddBook` | 显示添加图书表单 |
| POST | `/book/addBook` | 添加新图书 |
| GET | `/book/toUpdateBook?id={id}` | 显示编辑图书表单 |
| POST | `/book/updateBook` | 更新图书信息 |
| POST | `/book/del/{bookId}` | 删除图书 |
| POST | `/book/queryBook` | 按书名搜索（模糊匹配） |

## 许可证

本项目采用 [MIT 许可证](LICENSE) 开源。
