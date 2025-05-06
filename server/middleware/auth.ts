const jwt = require("jsonwebtoken");

const auth = async (req: any, res: any, next: any) => {
  try {
    const token = req.header("x-auth-token");

    if (!token) {
      return res.status(401).json({ message: "Access Denied" });
    }
    const verified = jwt.verify(token, "passwordKey");

    //401 error for authorization

    if (!verified) {
      return res
        .status(401)
        .json({ message: "Token Verification Failed. Access Denied" });
    }
    req.user = verified.id;
    req.token = token;
    next();
  } catch (err: any) {
    res.status(500).json({ error: err.message });
  }
};

module.exports = auth;
