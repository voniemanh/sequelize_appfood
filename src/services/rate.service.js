import Rates from "../models/rate.model.js";
import { BadRequestException } from "../common/helpers/exception.helper.js";
export const rateService = {
   async findByRestaurantId(req) {
      const resId = req.params.id;
      if (!resId) {
         throw new BadRequestException("Restaurant ID is required");
      }
      const listRatesbyRestaurant = await Rates.findAll({
         where: {
            res_id: resId
         }
      });
      return listRatesbyRestaurant;
   },

   async findByUserId(req) {
      const userId = req.params.id;
      if (!userId) {
         throw new BadRequestException("User ID is required");
      }
      const listRatesbyUser = await Rates.findAll({
         where: {
            user_id: userId
         }
      });
      return listRatesbyUser;
   }
};
