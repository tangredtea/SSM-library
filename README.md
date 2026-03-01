[![license](https://badgen.net/github/license/laowenruo/SSM-library?color=green)](https://github.com/laowenruo/SSM-library/blob/main/LICENSE)
[![stars](https://badgen.net/github/stars/laowenruo/SSM-library)](https://github.com/laowenruo/SSM-library/stargazers)
[![contributors](https://badgen.net/github/contributors/laowenruo/SSM-library)](https://github.com/laowenruo/SSM-library/graphs/contributors)
[![help-wanted](https://badgen.net/github/label-issues/laowenruo/SSM-library/help%20wanted/open)](https://github.com/laowenruo/SSM-library/labels/help%20wanted)
[![issues](https://badgen.net/github/open-issues/laowenruo/SSM-library)](https://github.com/laowenruo/SSM-library/issues)
[![PRs Welcome](https://badgen.net/badge/PRs/welcome/green)](http://makeapullrequest.com)

[English](README.md) | [简体中文](README_CN.md)

# 📚 SSM-Library

> 🚀 A hands-on journey to master SSM framework integration!

A beginner-friendly book management web application built with the **SSM framework** (Spring + SpringMVC + MyBatis). This project is designed as a hands-on exercise for developers who have just learned the basics of these frameworks and want to practice integrating them together. It also demonstrates the use of the **PageHelper** plugin for pagination.

## ✨ Why This Project?

Perfect for developers who want to:
- Practice integrating Spring, SpringMVC, and MyBatis from scratch
- Understand how SSM components work together in a real application
- Learn pagination implementation with PageHelper
- See best practices for exception handling and XSS protection

## Features

- CRUD operations for books (Create, Read, Update, Delete)
- Fuzzy search by book name
- Pagination with PageHelper
- Global exception handling
- XSS protection with JSTL `<c:out>` escaping
- Bootstrap 3 responsive UI

## Tech Stack

| Layer | Technology |
|-------|-----------|
| Presentation | JSP + Bootstrap 3 + JSTL |
| Controller | Spring MVC 5.1.9 |
| Service | Spring IoC + AOP Transactions |
| Persistence | MyBatis 3.5.2 + PageHelper 5.0 |
| Database | MySQL 5.7+ |
| Connection Pool | C3P0 |
| Build | Maven |
| Logging | SLF4J + Log4j |

## Project Structure

```
SSM-library/
├── pom.xml
├── src/main/
│   ├── java/com/
│   │   ├── controller/          # Spring MVC controllers
│   │   │   ├── BookController.java
│   │   │   └── GlobalExceptionHandler.java
│   │   ├── dao/                 # MyBatis mapper interfaces & XML
│   │   │   ├── BookMapper.java
│   │   │   └── BookMapper.xml
│   │   ├── pojo/                # Entity classes
│   │   │   └── Books.java
│   │   ├── service/             # Service layer
│   │   │   ├── BookService.java
│   │   │   └── BookServiceImpl.java
│   │   └── util/                # Utility classes
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
└── schema.sql                    # Database schema & sample data
```

## Prerequisites

- JDK 1.8+
- Maven 3.x
- MySQL 5.7+
- A servlet container (e.g. Tomcat 8+)

## Getting Started

### 1. Set Up the Database

Import the SQL file to create the database and sample data:

```sql
mysql -u root -p < schema.sql
```

This will create the `ssmbuild` database with a `books` table containing sample records.

### 2. Configure Database Connection

Edit `src/main/resources/database.properties` with your MySQL credentials:

```properties
jdbc.driver=com.mysql.jdbc.Driver
jdbc.url=jdbc:mysql://localhost:3306/ssmbuild?useSSL=false&useUnicode=true&characterEncoding=utf8&serverTimezone=Asia/Shanghai
jdbc.username=root
jdbc.password=your_password
```

### 3. Build and Deploy

```bash
mvn clean package
```

Deploy the generated `.war` file to your Tomcat server, or run it directly from your IDE.

### 4. Access the Application

Open your browser and navigate to:

```
http://localhost:8080/mavenSSM/
```

## Configuration Details

### MyBatis Layer

- **Database config**: `database.properties` — JDBC connection parameters
- **MyBatis config**: `mybatis-config.xml` — Type aliases, PageHelper plugin, mapper registration
- **Mapper XML**: `BookMapper.xml` — SQL statements for all CRUD operations

### Spring Layer

- **DAO config**: `spring-dao.xml` — DataSource (C3P0), SqlSessionFactory, MapperScanner
- **Service config**: `spring-service.xml` — Component scanning, bean registration, transaction management with AOP
- **MVC config**: `spring-mvc.xml` — Annotation-driven MVC, view resolver (JSP), controller scanning
- **Root config**: `applicationContext.xml` — Imports all three Spring config files

### Web Layer

- **web.xml** — DispatcherServlet, CharacterEncodingFilter (UTF-8), session timeout (15 min)

## API Endpoints

| Method | URL | Description |
|--------|-----|-------------|
| GET | `/book/allBook` | List all books (paginated) |
| GET | `/book/toAddBook` | Show add book form |
| POST | `/book/addBook` | Add a new book |
| GET | `/book/toUpdateBook?id={id}` | Show edit book form |
| POST | `/book/updateBook` | Update a book |
| POST | `/book/del/{bookId}` | Delete a book |
| POST | `/book/queryBook` | Search books by name (fuzzy match) |

## License

This project is open source and available under the [MIT License](LICENSE).
