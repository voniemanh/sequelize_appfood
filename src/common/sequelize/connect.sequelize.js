import "dotenv/config";
import { Sequelize } from "sequelize";

const sequelize = new Sequelize(process.env.DATABASE_URL, { logging: false });

try {
    await sequelize.authenticate();
    console.log("[SEQUELIZE] Connection has been established successfully.");
} catch (error) {
    console.error("[SEQUELIZE] Unable to connect to the database:", error);
}

export default sequelize;
