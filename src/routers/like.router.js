import express from "express";
import {likeController} from "../controllers/like.controller.js";

const likeRouter = express.Router();

// like nhà hàng
likeRouter.post("/like", likeController.like);

// unlike nhà hàng
likeRouter.patch("/unlike", likeController.unlike);

// danh sách nhà hàng user đã like
likeRouter.get("/user/:user_id", likeController.getByUser);

// danh sách user đã like nhà hàng
likeRouter.get("/restaurant/:res_id", likeController.getByRestaurant);

export default likeRouter;
