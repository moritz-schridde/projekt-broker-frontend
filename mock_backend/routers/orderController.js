const { checkIfAuthenticated } = require('../auth')
const { Router } = require('express')

const { findOrdersByUserId, createOrder } = require('../database/orderRepo')

const router = Router()


// a getter endpoint returning a list of all orders
router.get('/', checkIfAuthenticated, (req, res) => {
    orders = findOrdersByUserId(req.authId);
    res.status(200).send(orders);
});

router.post('/', checkIfAuthenticated, (req, res) => {
    order = req.body;
    createOrder(req.authId, order);
    res.status(200).send(order);
}
);

module.exports = router