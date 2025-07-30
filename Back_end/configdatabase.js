import  { Sequelize }  from "sequelize";

const db = new Sequelize('toko pakaian','root','',{
    host: 'localhost',
    dialect: 'mysql',
})

export default db;