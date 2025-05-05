const express = require("express");
const authRouter = express.Router();
const bcrypt = require("bcryptjs");
const User = require("../models/user");
const jwt = require("jsonwebtoken");

//sign up
authRouter.post("/api/signup", async (req: any, res: any) => {
  try {
    const { name, email, password, confirmPassword } = req.body;

    // Check existing user
    const existingUser = await User.findOne({ email });

    if (existingUser) {
      return res.status(400).json({ message: "User already exists" });
    }

    if (password !== confirmPassword) {
      return res.status(400).json({ message: "Passwords do not match" });
    }

    const salt = await bcrypt.genSalt(10);
    const hashedPassword = await bcrypt.hash(confirmPassword, salt);

    let user = new User({
      name,
      email,
      password: hashedPassword,
    });

    user = await user.save();

    res.status(200).json(user);
  } catch (err: any) {
    console.log(err);
    res.status(500).json({ error: err.message });
  }
});

//sign in

authRouter.post("/api/signin", async (req: any, res: any) => {
  try {
    const { email, password } = req.body;

    const user = await User.findOne({ email });

    if (!user) {
      return res
        .status(400)
        .json({ message: `User with this ${email} does not exist` });
    }

    if (!email || !password) {
      return res
        .status(400)
        .json({ error: "Email and password are required." });
    }

    // Corrected here
    const isMatch = await bcrypt.compare(password, user.password);

    if (!isMatch) {
      return res.status(400).json({ message: "Invalid credentials" });
    }

    const token = jwt.sign({ id: user._id }, "passwordKey");
    res.json({ token, ...user._doc });
  } catch (err: any) {
    res.status(500).json({ error: err.message });
  }
});

module.exports = authRouter;
