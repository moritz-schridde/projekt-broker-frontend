// init a express web sever with cors allowd from everywhere
const express = require('express');
const app = express();
const cors = require('cors');

app.use(cors({ credentials: true, origin: true }))

app.get('/depot', (req, res) => {
    res.send(
        {
            budget: 1002,
            shares: [
                {
                    amount: 10,
                    purchasePrice: 420,
                    share: {
                        shareId: 1,
                        longName: "Tesla",
                        shortName: "TSL",
                        iconId: "1",
                        price: 530,
                    }
                },
                {
                    amount: 5,
                    purchasePrice: 550,
                    share: {
                        shareId: 2,
                        longName: "Apple",
                        shortName: "APL",
                        iconId: "2",
                        price: 750,
                    }
                },
            ],
        }
    )
}
);

// a getter endpoint returning a list of all orders
app.get('/order', (req, res) => {
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

// i want a get endpoint which returns all stocks
app.get('/share', (req, res) => {
    res.send(
        [
            {
                shareId: 1,
                longName: "Tesla",
                shortName: "TSL",
                iconId: "1",
                price: 530,
            },
            {
                shareId: 2,
                longName: "Apple",
                shortName: "APL",
                iconId: "2",
                price: 750,
            },
            {
                shareId: 3,
                longName: "Google",
                shortName: "GOG",
                iconId: "3",
                price: 5000,
            },
        ]
    );
});


// start server on port 8080
app.listen(8080, () => {
    console.log('Server started on port 8080');
}
);