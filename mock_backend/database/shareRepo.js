const seedrandom = require('seedrandom')

const shares = [
    {
        shareId: 1,
        longName: "Tesla",
        shortName: "TSL",
        iconId: "1",
        price: 737,
    },
    {
        shareId: 2,
        longName: "Apple",
        shortName: "APL",
        iconId: "2",
        price: 531,
    },
    {
        shareId: 3,
        longName: "Google",
        shortName: "GOG",
        iconId: "3",
        price: 984,
    },
    {
        shareId: 4,
        longName: "Amazon",
        shortName: "AMZ",
        iconId: "4",
        price: 116,
    },
    {
        shareId: 5,
        longName: "BASF",
        shortName: "BSF",
        iconId: "5",
        price: 43,
    },
    {
        shareId: 6,
        longName: "BioNTech",
        shortName: "BNT",
        iconId: "6",
        price: 134,
    },
    {
        shareId: 7,
        longName: "Allianz",
        shortName: "ALZ",
        iconId: "7",
        price: 180,
    },
    {
        shareId: 8,
        longName: "Bayer",
        shortName: "BYR",
        iconId: "8",
        price: 58,
    },
    {
        shareId: 9,
        longName: "Microsoft",
        shortName: "MCS",
        iconId: "9",
        price: 267,
    },
    {
        shareId: 10,
        longName: "Rheinmetall",
        shortName: "RHM",
        iconId: "10",
        price: 243,
    },
]

const getAllShares = () => {
    return shares;
}

const findShareById = (shareId) => {
    return shares.find((share) => share.shareId == shareId);
}

const getSharePerformance = (shareId) => {
    let share = findShareById(shareId);
    let myrng = seedrandom(shareId);

    let value = share.price;
    let flux = share.price * 0.02;
    let fluxflux = share.price * 0.1;

    let result = [{ x: 100, y: share.price }];
    for (let i = 1; i < 100; i++) {
        value = value - ((myrng() - 0.4) * (myrng() - 0.5) * fluxflux);
        result.push({ x: 100 - i, y: value })
    }
    return result.reverse();
}


exports.getAllShares = getAllShares
exports.getSharePerformance = getSharePerformance