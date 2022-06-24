const { checkIfAuthenticated } = require('.auth')
const { Router } = require('express')

const router = Router()


// a getter endpoint returning a list of all orders
router.get('/order', (req, res) => {
    res.send(
        [
            {
                orderId: 1,
                offerType: "BUY",
                offerState: "CLOSED",
                timestamp: "2020-01-01T00:00:00.000Z",
                info: {
                    share: {
                        shareId: 2,
                        longName: "Apple",
                        shortName: "APL",
                        iconId: "2",
                        price: 750,
                    },
                    value: 3750,
                    count: 5,
                }
            },
            {
                orderId: 2,
                offerType: "SELL",
                offerState: "CLOSED",
                timestamp: "2020-01-01T14:00:00.000Z",
                info: {
                    share: {
                        shareId: 1,
                        longName: "Tesla",
                        shortName: "TSL",
                        iconId: "1",
                        price: 530,
                    },
                    value: 5300,
                    count: 10,
                }
            },
            {
                orderId: 3,
                offerType: "BUY",
                offerState: "PENDING",
                timestamp: "2020-01-01T00:00:00.000Z",
                info: {
                    share: {
                        shareId: 1,
                        longName: "Tesla",
                        shortName: "TSL",
                        iconId: "1",
                        price: 600,
                    },
                    value: 6000,
                    count: 10,
                }
            }
        ]
    );
});

module.exports = Router