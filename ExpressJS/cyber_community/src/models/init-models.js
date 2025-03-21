import _sequelize from "sequelize";
const DataTypes = _sequelize.DataTypes;
import _Permissions from  "./Permissions.js";
import _Roles from  "./Roles.js";
import _Users from  "./Users.js";

export default function initModels(sequelize) {
  const Permissions = _Permissions.init(sequelize, DataTypes);
  const Roles = _Roles.init(sequelize, DataTypes);
  const Users = _Users.init(sequelize, DataTypes);


  return {
    Permissions,
    Roles,
    Users,
  };
}
