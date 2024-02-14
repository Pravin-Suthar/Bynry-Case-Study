const { Sequelize } = require("sequelize");
const db = require("../models/index");

const {
  sendOtpEmail,
  newAccountCreatedMail,
} = require("../middleware/sendEmail"); // Import your email service module

const OTP = db.tempOtp;
const User = db.user;

const nodemailer = require("nodemailer");

// API to register the user.
exports.registerUser = async (req, res) => {
  try {
    const {
      firstName,
      lastName,
      email,
      phoneNumber,
    } = req.body; // Include all fields from the request body

    const existingUser = await User.findOne({ where: { email } });
    if (existingUser) {
      return res
        .status(400)
        .json({ success: false, message: "Email already exists" });
    }

    // Create a new User record in the database with all provided data
    await User.create({
      firstName,
      lastName,
      email,
      phoneNumber,
    });
    await newAccountCreatedMail(email);

    return res
      .status(201)
      .json({ success: true, message: "User registered successfully" });
  } catch (error) {
    console.error(error);
    return res.status(500).json({
      success: false,
      message: "Registration failed",
      error: error.message,
    });
  }
};


exports.login = async (req, res) => {
  try {
    const { email } = req.body; 

    async function generateOTP(length) {
      const chars = "0123456789";
      let otp = "";
      for (let i = 0; i < length; i++) {
        const randomIndex = Math.floor(Math.random() * chars.length);
        otp += chars[randomIndex];
      }
      return otp;
    }
    
    const otp = await generateOTP(6);

    const existingUser = await User.findOne({ where: { email: email } });
    if (existingUser) {
      // Check if there's an existing OTP record for the same user
      let otpRecord = await OTP.findOne({ where: { userId: existingUser.id } });

      if (otpRecord) {
        // If an OTP record exists, update it with the new OTP and reset the expiration time.
        otpRecord.otp = otp;
        otpRecord.createdAt = new Date(); 
        await otpRecord.save();
      } else {
        // If no OTP record exists, create a new one.
        otpRecord = await OTP.create({
          userId: existingUser.id,
          otp: otp,
        });
      }
      await sendOtpEmail(email, otp);
      
      res.status(200).json({
        success: true,
        message: "OTP sent to your email",
        otpRecord,
      });
    } else {
      res.status(400).json({
        success: false,
        message: "Kindly Register First",
      });
    }
  } catch (error) {
    return res.status(400).json({ success: false, message: error.message });
  }
};




exports.verifyOTP = async (req, res) => {
  const { email, otp } = req.body;

  try {
    // Check if a user with the provided email exists
    const existingUser = await User.findOne({ where: { email: email } });

    if (existingUser) {
      // Check if there's an OTP record for the user
      const otpRecord = await OTP.findOne({
        where: { userId: existingUser.id },
      });

      if (otpRecord) {
        // Check if the provided OTP matches the one stored in the database
        if (otp === otpRecord.otp) {
          res.status(200).json({
            success: true,
            message: "OTP verified successfully",
            usersid: existingUser.id,
          });
        } else {
          res.status(400).json({
            success: false,
            message: "Invalid OTP",
          });
        }
      } else {
        res.status(400).json({
          success: false,
          message: "No OTP record found for this user",
        });
      }
    } else {
      res.status(400).json({
        success: false,
        message: "User not found. Kindly Register First",
      });
    }
  } catch (error) {
    return res.status(400).json({ success: false, message: error.message });
  }
};
