import { orderService } from "../services/order.service.js";
import { responseSuccess } from "../common/helpers/function.helper.js";
export const orderController = {
   async create(req, res, next) {
      try {
         const result = await orderService.create(req);
         const response = responseSuccess(result, `Create order successfully`);
         res.status(response.statusCode).json(response);
      } catch (err) {
         next(err);
      }
   }
};