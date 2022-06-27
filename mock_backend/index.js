// init a express web sever with cors allowed from everywhere
const express = require('express');
const app = express();
const cors = require('cors');

app.use(express.json());

app.use(cors({ credentials: true, origin: true }))



const userRouter = require("./routers/userController")
app.use('/user', userRouter)

const depotRouter = require("./routers/depotController")
app.use('/depot', depotRouter)

const orderRouter = require("./routers/orderController")
app.use('/order', orderRouter)

const shareRouter = require("./routers/shareController")
app.use('/share', shareRouter)



// start server on port 8080
app.listen(8080, () => {
    console.log('Server started on port 8080');
}
);