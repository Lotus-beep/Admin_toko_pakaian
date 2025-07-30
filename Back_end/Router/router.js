import express from 'express'
import { getData,getStockProduct,addPesanan,updatePesanan,getProduct } from '../controler/Controler.js'

const router = express.Router()

router.get('/data',getData);
router.get('/stock-product',getStockProduct)
router.post('/add-pesanan',addPesanan)
router.post('/updatePesanan',updatePesanan)
router.get('/Product',getProduct)

export default router