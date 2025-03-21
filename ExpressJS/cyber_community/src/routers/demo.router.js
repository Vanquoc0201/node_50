import express from 'express'
const demoRouter = express.Router();
// http://localhost:3069/demo/check-server
demoRouter.get('/check-server',(req,res,next)=>{
    res.json('Hello World');
})
export default demoRouter;