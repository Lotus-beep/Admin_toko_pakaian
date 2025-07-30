import { Sequelize } from "sequelize";
import db from "../configdatabase.js";

const { DataTypes } = Sequelize;

export const Product = db.define('product', {
  id_product: {
    type: DataTypes.INTEGER(5),
    primaryKey: true,
    autoIncrement: true,
    allowNull: false
  },
  nama_barang: {
    type: DataTypes.STRING(30),
    allowNull: false
  },
  merek:{
    type: DataTypes.STRING(30),
    allowNull: false
  },
  harga_barang: {
    type: DataTypes.INTEGER(),
    allowNull: false
  },
  TIPE_barang: {
    type: DataTypes.ENUM('Pria', 'Wanita'),
    allowNull: false
  },
  category_barang: {
    type: DataTypes.STRING(6)
  }
}, {
  timestamps: false,
  freezeTableName: true
});

export const Stock_product = db.define('stock_product', {
  id: {
    type: DataTypes.INTEGER(5),
    primaryKey: true,
    autoIncrement: true,
    allowNull: false
  },
  id_product: {
    type: DataTypes.INTEGER(5),
    allowNull: false
  },
  jumlah_product: {
    type: DataTypes.INTEGER(),
    allowNull: false
  }
}, {
  timestamps: false,
  freezeTableName: true
});

export const Pembelian = db.define('pembelian', {
  id: {
    type: DataTypes.INTEGER(5),
    primaryKey: true,
    autoIncrement: true,
    allowNull: false
  },
  id_product: {
    type: DataTypes.INTEGER(5),
    allowNull: false
  },
  kode_product: {
    type: DataTypes.CHAR(12),
    allowNull: false
  },
  total_product:{
    type: DataTypes.INTEGER,
    allowNull: false
  },
  total_harga:{
    type: DataTypes.INTEGER,
    allowNull:false
  },
  status_pembayaran: {
    type: DataTypes.ENUM('lunas', 'belum'),
    allowNull: false
  }
}, {
  timestamps: true,
  freezeTableName: true
});

// Relasi dengan ON DELETE CASCADE
Product.hasMany(Stock_product, {
  foreignKey: 'id_product',
  onDelete: 'CASCADE'
});
Stock_product.belongsTo(Product, {
  foreignKey: 'id_product',
});

Product.hasMany(Pembelian, {
  foreignKey: 'id_product',
  onDelete: 'CASCADE'
});
Pembelian.belongsTo(Product, {
  foreignKey: 'id_product',
});
