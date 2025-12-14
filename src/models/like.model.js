import { DataTypes, Sequelize } from "sequelize";
import sequelize from "../common/sequelize/connect.sequelize.js";

const Likes = sequelize.define(
  "like_res",
  {
    user_id: {
      type: DataTypes.INTEGER,
      allowNull: false,
      primaryKey: true,
      references: {
        model: "users",
        key: "user_id",
      },
    },
    res_id: {
      type: DataTypes.INTEGER,
      allowNull: false,
      primaryKey: true,
      references: {
        model: "restaurants",
        key: "res_id",
      },
    },
    type_name: {
      type: DataTypes.STRING,
      allowNull: false,
    },
    date_like: {
      type: DataTypes.DATE,
      allowNull: false,
      defaultValue: DataTypes.NOW,
    },
    isDeleted: {
      type: DataTypes.BOOLEAN,
      defaultValue: false,
    },
    createdAt: {
      type: DataTypes.DATE,
      defaultValue: DataTypes.NOW,
    },
    updateAt: {
      type: DataTypes.DATE,
      defaultValue: DataTypes.NOW,
    },
  },
  {
    tableName: "like_res",
    timestamps: false,
  }
);


await Likes.sync();

export default Likes;
