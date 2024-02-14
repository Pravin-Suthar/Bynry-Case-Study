module.exports = (sequelize, DataTypes) => {
  const TempOtp = sequelize.define(
    "tempOtp",
    {
      id: {
        allowNull: false,
        autoIncrement: true,
        primaryKey: true,
        type: DataTypes.INTEGER,
      },
      userId: {
        type: DataTypes.INTEGER,
        allowNull: false,
      },
      otp: {
        type: DataTypes.INTEGER, 
        allowNull: false,
      },
    },
    {
      timestamps: true,
      paranoid: true,
      updatedAt: "updatedAt",
      createdAt: "createdAt",
    }
  );
  return TempOtp;
};
