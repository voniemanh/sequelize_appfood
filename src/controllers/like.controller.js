import { likeService } from "../services/like.service.js";
import { responseSuccess } from "../common/helpers/function.helper.js";
export const likeController = {
   async like(req, res, next) {
      try {
         const result = await likeService.like(req);
         const response = responseSuccess(result, `Create like successfully`);
         res.status(response.statusCode).json(response);
      } catch (err) {
         next(err);
      }
   },

   async unlike(req, res, next) {
      try {
         const result = await likeService.unlike(req);
         const response = responseSuccess(result, `Unlike successfully`);
         res.status(response.statusCode).json(response);
      } catch (err) {
         next(err);
      }
   },

   async getByUser(req, res, next) {
      try {
         const result = await likeService.getByUser(req);
         const response = responseSuccess(result, `Get likes by user #${req.params.user_id} successfully`);
         res.status(response.statusCode).json(response);
      } catch (err) {
         next(err);
      }
   },

   async getByRestaurant(req, res, next) {
      try {
         const result = await likeService.getByRestaurant(req);
         const response = responseSuccess(result, `Get likes by restaurant #${req.params.res_id} successfully`);
         res.status(response.statusCode).json(response);
      } catch (err) {
         next(err);
      }
   }
};