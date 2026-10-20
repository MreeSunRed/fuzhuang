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

## 运行

1. 在 MySQL 中创建数据库 `fuzhuang`，并导入商品、分类、订单、用户等表（仓库未附建表 SQL）。
2. 修改 `src/com/dao/DB.java` 中的数据库地址、账号和密码。
3. 用 IntelliJ IDEA 或 Eclipse 导入工程，配置 Tomcat（`web.xml` 为 Servlet 2.5）。
4. 部署后访问应用根路径，默认欢迎页为 `/qiantai/default.jsp`。

## 已知问题

这个仓库是当年直接提交的课堂工程，保留了较多原始状态，重新运行前需要先处理：

1. **数据库口令硬编码**在 `src/com/dao/DB.java` 中，且已进入公开仓库。建议改用环境变量或外部配置文件，并**更换该数据库密码**。
2. **JSP 页面不完整**：`WebRoot/` 下只有 `WEB-INF/classes`，实际页面位于 `classes/artifacts/fuzhuang_war_exploded/`，源码目录缺少 `qiantai/` 等前台页面。
3. `web.xml` 中注册的 `admin_servlet`、`gonggao_servlet` 在 `src` 中不存在，与现有代码不一致。
4. 提交了 `.idea/`、`.metadata/`、`.classpath`、编译后的 `.class` 和 jar 等 IDE/构建产物。
5. 缺少建表 SQL 与依赖说明，无法做到开箱即用。

## 后续改进建议

- 把数据库配置抽到 `db.properties`，并加入 `.gitignore` 管理本地配置
- 补齐 `qiantai/` 前台 JSP 与建表 SQL
- 用 Maven 管理依赖，`src/main/webapp` 标准目录结构
- 补一个 `.gitignore`，只提交源码与配置模板
