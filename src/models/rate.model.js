import { DataTypes } from "sequelize";
import sequelize from "../common/sequelize/connect.sequelize.js";

const Rates = sequelize.define(
  "rate_res",
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
    amount: {
      type: DataTypes.INTEGER,
      allowNull: false,
    },
    date_rate: {
      type: DataTypes.DATE,
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
    tableName: "rate_res",
    timestamps: false,
  }
);

await Rates.sync();

export default Rates;
