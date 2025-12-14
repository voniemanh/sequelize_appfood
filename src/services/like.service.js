import Likes from "../models/like.model.js";
import { BadRequestException } from "../common/helpers/exception.helper.js";

export const likeService = {
   async like(req) {
      const userId = req.body.user_id;
      const restaurantId = req.body.res_id;
      if (!userId || !restaurantId) {
         throw new BadRequestException("User ID and Restaurant ID are required");
      }
      const existingLike = await Likes.findOne({
         where: {
            user_id: userId,
            res_id: restaurantId,
            isDeleted: false
         }
      });
      if (existingLike) {
         throw new BadRequestException("Like already exists");
      }
      const createdLike = await Likes.create({
         user_id: userId,
         res_id: restaurantId,
         type_name: "love"
      });
      return createdLike;
   },

   async unlike(req) {
      const userId = req.body.user_id;
      const restaurantId = req.body.res_id;
      if (!userId || !restaurantId) {
         throw new BadRequestException("User ID and Restaurant ID are required");
      }
      const unliked = await Likes.update({
         isDeleted: true
      }, {
         where: {
            user_id: userId,
            res_id: restaurantId
         }
      });
      return unliked;
   },

   async getByUser(req) {
      const userId = req.params.user_id;
      if (!userId) {
         throw new BadRequestException("User ID is required");
      }
      const list_likes = await Likes.findAll({
         where: {
            user_id: userId,
            isDeleted: false
         }
      });
      return list_likes;
   },

   async getByRestaurant(req) {
      const restaurantId = req.params.res_id;
      if (!restaurantId) {
         throw new BadRequestException("Restaurant ID is required");
      }
      const list_likes = await Likes.findAll({
         where: {
            res_id: restaurantId,
            isDeleted: false
         }
      });
      return list_likes;
   }
};