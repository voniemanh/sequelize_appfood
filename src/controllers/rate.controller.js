import { rateService } from "../services/rate.service.js";
import { responseSuccess } from "../common/helpers/function.helper.js"; 
export const rateController = {
   async findByRestaurantId(req, res, next) {
      try {
         const result = await rateService.findByRestaurantId(req);
         const response = responseSuccess(result, `Get all rates for restaurant #${req.params.id} successfully`);
         res.status(response.statusCode).json(response);
      } catch (err) {
         next(err);
      }
   },

   async findByUserId(req, res, next) {
      try {
         const result = await rateService.findByUserId(req);
         const response = responseSuccess(result, `Get all rates for user #${req.params.id} successfully`);
         res.status(response.statusCode).json(response);
      } catch (err) {
         next(err);
      }
   }
};