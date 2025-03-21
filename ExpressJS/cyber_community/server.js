
import express from 'express'
import pool from './src/common/mysql2/pool.mysql2';
import sequelize, { models } from './src/common/sequelize/connect.sequelize';
import { DataTypes } from 'sequelize';
import rootRouter from './src/routers/root.routers';
const app = express()
app.use(express.json());
app.use(rootRouter)
// JSON.parse : Chuyển từ string sang json
// JSON.stringify : Chuyển từ json sang string
app.get('/',(req,res,next)=>{
    res.json('Hello World');
})
// Nhận dữ liệu từ Query: thường sử dụng cho phân trang,lọc, search
app.get('/query', (req,res,next) =>{
    const {page,pagesize,timkiem} = req.query
    console.log({page,pagesize,timkiem});
    res.json("Đây là api demo nhận dữ liệu từ query")
})
// Nhận dữ liệu từ Params: thường dùng khi muốn thao tác sửa xóa vào một dữ liệu cụ thể (record,hàng)
app.put('/params/:id', (request,response,next)=>{
    console.log({params: request.params.id});
    const {id} = request.params;
    response.json("Đây là api demo nhận dữ liệu từ params")
})
// Nhận dữ liệu từ headers: thường dùng với token, key, api-key
app.delete('/headers', (req,res,next) =>{
    console.log(req.headers.token)
    res.json("Đây là api demo nhận dữ liệu từ headers")
})
// Nhận dữ liệu ở body: thường dùng khi tạo hoặc dữ liệu lớn
app.post('/body',(req,res,next)=>{
    console.log(req.body);
    res.json("Đây là api demo nhận dữ liệu từ body")
})

// MYSQL2
app.get('/mysql2',async (req,res,next)=>{
    const [rows, fields] = await pool.query('SELECT * FROM `Users`');
    console.log({rows,fields});
    res.json(rows)
});
// SEQUELIZE (ORM)
const Permissions = sequelize.define(
    'Permissions',
    {
      id: {
        type: DataTypes.INTEGER,
        primaryKey: true,
        autoIncrement: true,
      },
      name: {
        type: DataTypes.STRING,
        allowNull: false,
      },
      endpoint: {
        type: DataTypes.STRING,
        allowNull: false,
      },
      method: {
        type: DataTypes.STRING,
        allowNull: false,
      },
      module: {
        type: DataTypes.STRING,
        allowNull: false,
      },
      deletedBy: {
        type: DataTypes.INTEGER,
        allowNull: false,
        defaultValue: 0,
      },
      isDeleted: {
        type: DataTypes.INTEGER,
        allowNull: false,
        defaultValue: false,
      },
      deletedAt: {
        type: "TIMESTAMP",
        allowNull: true,
        defaultValue: null,
      },
      createdAt: {
        type: "TIMESTAMP",
        allowNull: false,
        defaultValue: sequelize.literal("CURRENT_TIMESTAMP"),
      },
      updatedAt : {
        type : "TIMESTAMP",
        defaultValue: sequelize.literal("CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP"),
        allowNull: false
      }

    },
    {
        tableName: "Permissions",
        timestamp: false,
    },
  );
  // CODE FIRST 
  Permissions.sync({alter: true})
  // DATABASE FIRST: đồng bộ từ db vào code
//  npx sequelize-auto -h localhost -d db_cyber_community -u root -x 1234 -p 3307  --dialect mysql -o src/models -a src/models/additional.json -l esm 
app.get(`/sequelize`, async (req,res,next)=>{
    // Sử dụng Permission do mình tự tạo (CODE FIRST)
    const permissions = await Permissions.findAll({raw:true});
    console.log({permissions});
    // Sử dụng model do sequelize-auto tạo ra (DATABASE FIRST)
   const users = await models.Users.findAll({raw:true})
    res.json({permissions,users})
})
app.listen(3069, () => {
  console.log(`Server online at http://localhost:3069`);
})