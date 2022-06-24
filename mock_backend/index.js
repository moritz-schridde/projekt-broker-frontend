// init a express web sever with cors allowd from everywhere
const express = require('express');
const app = express();
const cors = require('cors');

app.use(express.json());

app.use(cors({ credentials: true, origin: true }))



const userRouter = require("./routers/user")
app.use('/user', userRouter)


// start server on port 8080
app.listen(8080, () => {
    console.log('Server started on port 8080');
}
);