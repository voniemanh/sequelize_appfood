import express from 'express';
import { rateController } from '../controllers/rate.controller.js';

const rateRouter = express.Router();

// Tạo route CRUD
rateRouter.get('/restaurant/:id', rateController.findByRestaurantId);
rateRouter.get('/user/:id', rateController.findByUserId);

export default rateRouter;