const express = require("express");
const {
  registerUser,
  login,
  verifyOTP,
} = require("../controllers/user");
const router = express.Router();

router.route("/register").post(registerUser);
router.route("/login").post(login);
router.route("/verifyOtp").post(verifyOTP);
module.exports = router;
