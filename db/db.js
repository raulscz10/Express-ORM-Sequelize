const { Sequelize } = require("sequelize");
const env = process.env.NODE_ENV || "development";
const config = require(__dirname + "/../config/config.json")[env];

// const sequelize = new Sequelize(
//    process.env.MYSQL_DATABASE || config.development.database,
//    process.env.MYSQL_USER || config.development.username,
//    process.env.MYSQL_PASSWORD || config.development.password,
//    {
//       host: process.env.MYSQL_HOST || config.development.host,
//       port: process.env.MYSQL_PORT || config.development.port || 3306,
//       dialect: "mysql",
//       pool: {
//          max: 5,
//          min: 0,
//          acquire: 30000,
//          idle: 10000,
//       },
//    }
// );

if (config.use_env_variable) {
   console.log("Producción");
  sequelize = new Sequelize(process.env[config.use_env_variable], config);
} else {
   console.log("Desarrollo");
  sequelize = new Sequelize(
    config.database,
    config.username,
    config.password,
    config
  );
}

module.exports = async () => {
  const dbConnection = await sequelize.authenticate();
  //const database = process.env.MYSQL_DATABASE || config.development.database;
  //console.log(`Successfully connected to '${database}' database`);
  return dbConnection;
};
