package com.dao;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

public class DB
{
	private Connection con;

	private PreparedStatement pstm;

	/*
	 * Connection settings are read from db.properties on the classpath.
	 * Environment variables DB_URL / DB_USER / DB_PASSWORD take precedence.
	 * Never hard-code real credentials in this file.
	 */
	private static final String DEFAULT_URL =
			"jdbc:mysql://localhost:3306/fuzhuang?useUnicode=true&characterEncoding=utf8";

	private String user;

	private String password;

	private String className;

	private String url;

	public DB()
	{
		Properties config = loadConfig();

		this.className = getSetting(config, "db.driver", "DB_DRIVER", "com.mysql.cj.jdbc.Driver");
		this.url = getSetting(config, "db.url", "DB_URL", DEFAULT_URL);
		this.user = getSetting(config, "db.user", "DB_USER", "root");
		this.password = getSetting(config, "db.password", "DB_PASSWORD", "");

		try
		{
			Class.forName(className);
		}
		catch (ClassNotFoundException e)
		{
			// Fall back to the legacy driver name used by old Connector/J versions.
			try
			{
				Class.forName("com.mysql.jdbc.Driver");
			}
			catch (ClassNotFoundException ignored)
			{
				System.out.println("Database driver not found: " + className);
			}
		}
	}

	private static Properties loadConfig()
	{
		Properties props = new Properties();
		InputStream in = null;
		try
		{
			in = DB.class.getClassLoader().getResourceAsStream("db.properties");
			if (in != null)
			{
				props.load(in);
			}
		}
		catch (IOException e)
		{
			System.out.println("Could not read db.properties: " + e.getMessage());
		}
		finally
		{
			if (in != null)
			{
				try
				{
					in.close();
				}
				catch (IOException ignored)
				{
				}
			}
		}
		return props;
	}

	private static String getSetting(Properties props, String key, String envName, String defaultValue)
	{
		String env = System.getenv(envName);
		if (env != null && !env.trim().isEmpty())
			return env.trim();

		String property = System.getProperty(key);
		if (property != null && !property.trim().isEmpty())
			return property.trim();

		String value = props.getProperty(key);
		if (value != null && !value.trim().isEmpty())
			return value.trim();

		return defaultValue;
	}

	public Connection getCon()
	{
		try
		{
			con = DriverManager.getConnection(url, user, password);
		}
		catch (SQLException e)
		{
			System.out.println("Database connection failed: " + e.getMessage());
			con = null;
			e.printStackTrace();
		}
		return con;
	}

	public void doPstm(String sql, Object[] params)
	{
		if (sql != null && !sql.equals(""))
		{
			if (params == null)
				params = new Object[0];

			getCon();
			if (con != null)
			{
				try
				{
					System.out.println(sql);
					pstm = con.prepareStatement(sql,
							ResultSet.TYPE_SCROLL_INSENSITIVE,
							ResultSet.CONCUR_READ_ONLY);
					for (int i = 0; i < params.length; i++)
					{
						pstm.setObject(i + 1, params[i]);
					}
					pstm.execute();
				}
				catch (SQLException e)
				{
					System.out.println("Database query failed: " + e.getMessage());
					e.printStackTrace();
				}
			}
		}
	}

	public ResultSet getRs() throws SQLException
	{
		return pstm.getResultSet();
	}

	public int getCount() throws SQLException
	{
		return pstm.getUpdateCount();
	}

	public void closed()
	{
		try
		{
			if (pstm != null)
				pstm.close();
		}
		catch (SQLException e)
		{
			System.out.println("Failed to close statement: " + e.getMessage());
			e.printStackTrace();
		}
		try
		{
			if (con != null)
			{
				con.close();
			}
		}
		catch (SQLException e)
		{
			System.out.println("Failed to close connection: " + e.getMessage());
			e.printStackTrace();
		}
	}
}
