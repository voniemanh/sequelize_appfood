import express from 'express';
import { orderController } from '../controllers/order.controller.js';

const orderRouter = express.Router();

// Tạo route CRUD
orderRouter.post('/add-order', orderController.create);

export default orderRouter;