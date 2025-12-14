import { DataTypes } from "sequelize";
import sequelize from "../common/sequelize/connect.sequelize.js";

const Orders = sequelize.define(
  "orders",
  {
    order_id: {
      type: DataTypes.INTEGER,
      primaryKey: true,
      autoIncrement: true,
      allowNull: false,
    },
    user_id: {
      type: DataTypes.INTEGER,
      allowNull: false,
      references: {
        model: "users",
        key: "user_id",
      },
    },
    food_id: {
      type: DataTypes.INTEGER,
      allowNull: false,
      references: {
        model: "foods",
        key: "food_id",
      },
    },
    amount: {
      type: DataTypes.DOUBLE,
      allowNull: false,
    },
    code: {
      type: DataTypes.STRING,
      allowNull: false,
    },
    arr_sub_id: {
      type: DataTypes.STRING,
      allowNull: false,
    },
    isDeleted: {
      type: DataTypes.BOOLEAN,
      defaultValue: false,
    },
    createdAt: {
      type: DataTypes.DATE,
      defaultValue: DataTypes.NOW,
    },
    updatedAt: {
      type: DataTypes.DATE,
      defaultValue: DataTypes.NOW,
    },
  },
  {
    tableName: "orders",
    timestamps: false,
  }
);

await Orders.sync();

export default Orders;
