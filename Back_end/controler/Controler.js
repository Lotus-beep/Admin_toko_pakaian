import { where } from "sequelize";
import { Product, Pembelian, Stock_product } from "../Model/Model.js";
import { makeKode } from "./Tool.js";

export const getData = async (req, res) => {
  const result = await Pembelian.findAll({
    include: [
      {
        model: Product,
        attributes: ["nama_barang", "harga_barang"],
        required: true,
      },
    ],
  });

  return res.send(result);
};

export const getProduct = async (req, res) => {
  const result = await Product.findAll({});

  return res.send(result);
};

export const getStockProduct = async (req, res) => {
  const result = await Stock_product.findAll({
    include: [
      {
        model: Product,
        attributes: ["nama_barang", "TIPE_barang", "category_barang"],
        required: true,
      },
    ],
  });

  return res.send(result);
};

export const getDataProduct = async (req, res) => {
  const result = await Product.findAll();
  return res.send(result);
};

export const addPesanan = async (req, res) => {
  try {
    const { id_product, total_product, total_harga, status_pembayaran } =
      req.body;

    console.log(id_product)
    const result = await Pembelian.findAll();
    const Stock_item = await Stock_product.findOne({ where: { id_product } });
    if (!Stock_item) {
      return res.status(505).json({
        message: "id product tidak ditemukan pada bagian stock barang",
      });
    } else if (total_product > Stock_item.jumlah_product) {
      return res.status(507).json({ message: "Stock barang tidak mencukupi" });
    }

    while (true) {
      const kode_product = makeKode(12);
      const isDuplicate = result.filter((value) => {
        return value.kode_product == kode_product;
      });
      if (isDuplicate.length === 0) {
        await Pembelian.create({
          id_product,
          kode_product,
          total_product,
          total_harga,
          status_pembayaran,
        });
        await Stock_product.update(
          { jumlah_product: Stock_item.jumlah_product - total_product },
          { where: { id_product } }
        );
        return res
          .status(201)
          .json({ message: "Pesanan berhasil ditambahkan" });
      }
    }
  } catch (error) {
    console.log(error);
    return res.status(503).json({ message: "Eror dalam system" });
  }
};

export const updatePesanan = async (req, res) => {
  try {
    const { status, id } = req.body;
    if (!status) {
      return res.status(500).json({ message: "status undefined" });
    } else if (status === "Confirm") {
      await Pembelian.update({ status_pembayaran: "lunas" }, { where: { id } });
      return res
        .status(200)
        .json({ message: "pembayaran berhasil di konfirmasi" });
    } else {
      await Pembelian.destroy({ where: { id } });
      return res.status(200).json({ message: "pemesanan berhasil di cancel" });
    }
  } catch (error) {
    console.log(error);
    return res.status(500).json({ message: "status undefined" });
  }
};

