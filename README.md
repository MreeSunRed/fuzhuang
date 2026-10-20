# 服装商城（Java Web）

基于 **Servlet + JSP + JDBC + MySQL** 的服装商城练习项目，包含前台商品浏览和后台管理（商品、分类、订单、用户）。

## 技术栈

- Java Servlet / JSP / JSTL
- JDBC + MySQL
- Eclipse / MyEclipse 工程结构（`.project`、`.classpath`、`.settings`）
- 前端：JSP + CSS + JavaScript，集成 FCKeditor 富文本编辑器与 DWR

## 目录结构

```
fuzhuang/
├── src/com/action/      # Servlet：前台首页、商品、分类、订单、用户、购买
├── src/com/dao/         # DB 连接与数据访问
├── src/com/orm/         # 实体类：TAdmin、Tgoods、Tcatelog、Torder、TorderItem、Tyonghu
├── src/com/service/     # 业务逻辑：购物车、登录、商品
├── src/com/util/        # Cart 购物车、EncodingFilter 编码过滤器
├── WebRoot/WEB-INF/     # 编译后的 class 与依赖 jar
└── classes/artifacts/   # 导出的 war 展开目录（JSP 页面在这里）
```

模块划分（按 `web.xml`）：

| 路径 | Servlet |
|------|---------|
| `/catelog` | 分类管理 |
| `/goods` | 商品管理 |
| `/order` | 订单管理 |
| `/buy` | 购买/购物车 |
| `/yonghu` | 用户管理 |
| `/index` | 前台首页 |

## 配置数据库

数据库连接信息不再写死在代码里，`src/com/dao/DB.java` 会按以下优先级读取：

1. 环境变量 `DB_URL` / `DB_USER` / `DB_PASSWORD`
2. JVM 参数 `-Ddb.url=...` 等
3. classpath 下的 `db.properties`
4. 内置默认值（仅 URL 和用户名）

本地开发推荐用配置文件：

```bash
cp src/db.properties.example src/db.properties
```

然后编辑 `src/db.properties`：

```properties
db.driver=com.mysql.cj.jdbc.Driver
db.url=jdbc:mysql://localhost:3306/fuzhuang?useUnicode=true&characterEncoding=utf8
db.user=root
db.password=你的密码
```

`src/db.properties` 已加入 `.gitignore`，不会被提交。如果不想建文件，也可以在 Tomcat 启动脚本或 IDE 运行配置里设置环境变量：

```bash
DB_URL="jdbc:mysql://localhost:3306/fuzhuang?useUnicode=true&characterEncoding=utf8"
DB_USER=root
DB_PASSWORD=你的密码
```

## 运行

1. 在 MySQL 中创建数据库 `fuzhuang`，并导入商品、分类、订单、用户等表（仓库未附建表 SQL）。
2. 按上一节配置数据库连接。
3. 用 IntelliJ IDEA 或 Eclipse 导入工程，配置 Tomcat（`web.xml` 为 Servlet 2.5）。
4. 重新编译项目后部署（仓库中原有的 `DB.class` 已删除，避免旧配置残留）。
5. 访问应用根路径，默认欢迎页为 `/qiantai/default.jsp`。

## 已知问题

1. **JSP 页面不完整**：`WebRoot/` 下只有 `WEB-INF/classes`，实际页面位于 `classes/artifacts/fuzhuang_war_exploded/`，源码目录缺少 `qiantai/` 等前台页面。
2. `web.xml` 中注册的 `admin_servlet`、`gonggao_servlet` 在 `src` 中不存在，与现有代码不一致。
3. 提交了 `.idea/`、`.metadata/`、`.classpath`、编译后的 `.class` 和 jar 等 IDE/构建产物。
4. 缺少建表 SQL 与依赖说明，无法做到开箱即用。

## 安全提示

本项目的早期版本曾把数据库口令明文写在 `src/com/dao/DB.java` 中。该口令已从当前代码和 Git 历史中移除（历史于 2026-10-20 重写）。如果这个口令仍在使用，请立即修改数据库密码，并检查是否在其他服务中复用。

本地开发请使用 `src/db.properties` 保存连接信息，该文件已被 `.gitignore` 忽略。

## 后续改进建议

- 补齐 `qiantai/` 前台 JSP 与建表 SQL
- 用 Maven 管理依赖，迁移到 `src/main/webapp` 标准目录结构
- 把编译产物和 IDE 配置从版本库中清理掉，只提交源码与配置模板
