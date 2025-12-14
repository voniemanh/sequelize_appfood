import { responseError } from "./function.helper.js";

export const appErorr = (err, req, res, next) => {
    console.log(`Middleware đặc biệt, bắt lỗi`, err);

    console.log("code", err.code);

    // undefine: không tồn tại
    // null: có tồn tại nhưng bị rỗng
    const response = responseError(err?.message, err.code, err?.stack);

    res.status(response.statusCode).json(response);
}; 