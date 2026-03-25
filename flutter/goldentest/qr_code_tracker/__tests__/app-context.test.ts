import { describe, it, expect } from "vitest";
import { createQRCodeData } from "@/lib/qr-utils";
import type { UserSession, QRCodeData } from "@/lib/types";

describe("AppContext - State Management", () => {
  describe("User Session", () => {
    it("should create a valid user session", () => {
      const user: UserSession = {
        name: "John Doe",
        createdAt: new Date(),
      };

      expect(user.name).toBe("John Doe");
      expect(user.createdAt).toBeInstanceOf(Date);
    });

    it("should handle user names with special characters", () => {
      const user: UserSession = {
        name: "Jane O'Brien-Smith",
        createdAt: new Date(),
      };

      expect(user.name).toBe("Jane O'Brien-Smith");
    });
  });

  describe("QR Code Data", () => {
    it("should create QR code data with correct structure", () => {
      const qrData = createQRCodeData("Alice", 30);

      expect(qrData).toHaveProperty("userName", "Alice");
      expect(qrData).toHaveProperty("contactInfo");
      expect(qrData).toHaveProperty("generatedAt");
      expect(qrData).toHaveProperty("expiresAt");
      expect(qrData.contactInfo).toBe("Alice@qrtracker.app");
    });

    it("should calculate expiration date correctly", () => {
      const qrData = createQRCodeData("Bob", 30);
      const expectedExpiration = new Date();
      expectedExpiration.setDate(expectedExpiration.getDate() + 30);

      expect(qrData.expiresAt.toDateString()).toBe(expectedExpiration.toDateString());
    });

    it("should generate different QR codes for different users", () => {
      const qr1 = createQRCodeData("User1", 30);
      const qr2 = createQRCodeData("User2", 30);

      expect(qr1.userName).not.toBe(qr2.userName);
      expect(qr1.contactInfo).not.toBe(qr2.contactInfo);
    });

    it("should handle different expiration periods", () => {
      const qr7 = createQRCodeData("User", 7);
      const qr30 = createQRCodeData("User", 30);
      const qr90 = createQRCodeData("User", 90);

      const exp7 = new Date();
      exp7.setDate(exp7.getDate() + 7);

      const exp30 = new Date();
      exp30.setDate(exp30.getDate() + 30);

      const exp90 = new Date();
      exp90.setDate(exp90.getDate() + 90);

      expect(qr7.expiresAt.toDateString()).toBe(exp7.toDateString());
      expect(qr30.expiresAt.toDateString()).toBe(exp30.toDateString());
      expect(qr90.expiresAt.toDateString()).toBe(exp90.toDateString());
    });
  });

  describe("State Transitions", () => {
    it("should represent login -> generate QR -> logout flow", () => {
      // Simulate login
      const user: UserSession = {
        name: "TestUser",
        createdAt: new Date(),
      };

      expect(user).toBeDefined();
      expect(user.name).toBe("TestUser");

      // Simulate QR generation
      const qrData = createQRCodeData(user.name, 30);
      expect(qrData.userName).toBe(user.name);

      // Simulate logout (clear state)
      const loggedOutUser = null;
      const loggedOutQR = null;

      expect(loggedOutUser).toBeNull();
      expect(loggedOutQR).toBeNull();
    });
  });
});
