const express = require("express");
const {
  registerUser,
  login,
  verifyOTP,
  getUserDetailsById,
} = require("../controllers/user");
const router = express.Router();

router.route("/register").post(registerUser);
router.route("/login").post(login);
router.route("/verifyOtp").post(verifyOTP);
router.route("/userDetails").post(getUserDetailsById);
module.exports = router;
