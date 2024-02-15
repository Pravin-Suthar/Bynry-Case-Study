module.exports = {
  HOST: "localhost",
  USER: "root",
  PASSWORD: "root",
  DB: "Bynry", // <--  add the name of the database where you want to sequalize the model
  dialect: "mysql", 
  pool: {
    max: 5,
    min: 0,
    acquire: 30000,
    idle: 10000
  }
};
