import Orders from "../models/order.model.js";
import { BadRequestException } from "../common/helpers/exception.helper.js";

export const orderService = {
   async create(req) {
      const { user_id, restaurant_id, total_price, amount, food_id, code, arr_sub_id } = req.body;
      if (!user_id || !restaurant_id || !total_price || !amount || !food_id || !code || !arr_sub_id) {
         throw new BadRequestException("Missing required fields");
      }
      const addOrder = await Orders.create({
         user_id,
         restaurant_id,
         total_price,
         amount,
         food_id,
         code,
         arr_sub_id
      });
      return addOrder;
   }
};
