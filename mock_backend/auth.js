var admin = require("firebase-admin");

var serviceAccount = require("./service_account.json");

admin.initializeApp({
    credential: admin.credential.cert(serviceAccount)
});


// Modul "auth.js"
const createUser = async (req, res) => {
    const {
        email,
        phoneNumber,
        password,
        firstName,
        lastName,
        photoUrl
    } = req.body;

    const user = await admin.auth().createUser({
        email,
        phoneNumber,
        password,
        displayName: `${firstName} ${lastName}`,
        photoURL: photoUrl
    });

    return res.send(user);
}

const getAuthToken = (req, res, next) => {
    if (
        req.headers.authorization &&
        req.headers.authorization.split(' ')[0] === 'Bearer'
    ) {
        req.authToken = req.headers.authorization.split(' ')[1];
    } else {
        req.authToken = null;
    }
    next();
};


const checkIfAuthenticated = (req, res, next) => {

    console.log("checking for auth")

    // authHeader = req.rawHeaders[1];
    // // console.log(req)
    // // console.log(authHeader)
    // if(authHeader == "Bearer tohlerToken"){
    //     req.authId = "ichHabeGradKeinenServiceAccountZumTesten";
    //     return next();
    // }else{
    //     return res
    //             .status(401)
    //             .send({ error: 'You are not authorized to make this request. Please use a valid auth token!' });
    // }

    getAuthToken(req, res, async () => {
        try {
            const { authToken } = req;
            const userInfo = await admin
                .auth()
                .verifyIdToken(authToken);
            req.authId = userInfo.uid;
            return next();
        } catch (e) {
            return res
                .status(401)
                .send({ error: 'You are not authorized to make this request. Please use a valid auth token!' });
        }
    });
};

exports.createUser = createUser
exports.checkIfAuthenticated = checkIfAuthenticated