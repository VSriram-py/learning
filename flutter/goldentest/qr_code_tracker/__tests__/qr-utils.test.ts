import { describe, it, expect, beforeEach, vi } from "vitest";
import {
  calculateExpirationDate,
  generateQRCodeContent,
  createQRCodeData,
  formatDate,
  isQRCodeExpired,
  getDaysRemaining,
} from "@/lib/qr-utils";

describe("QR Code Utilities", () => {
  describe("calculateExpirationDate", () => {
    it("should calculate expiration date correctly", () => {
      const now = new Date("2026-03-25");
      vi.useFakeTimers();
      vi.setSystemTime(now);

      const expirationDate = calculateExpirationDate(30);
      const expectedDate = new Date("2026-04-24");

      expect(expirationDate.toDateString()).toBe(expectedDate.toDateString());

      vi.useRealTimers();
    });

    it("should handle 0 days expiration", () => {
      const now = new Date("2026-03-25");
      vi.useFakeTimers();
      vi.setSystemTime(now);

      const expirationDate = calculateExpirationDate(0);
      expect(expirationDate.toDateString()).toBe(now.toDateString());

      vi.useRealTimers();
    });

    it("should handle negative days", () => {
      const now = new Date("2026-03-25");
      vi.useFakeTimers();
      vi.setSystemTime(now);

      const expirationDate = calculateExpirationDate(-5);
      const expectedDate = new Date("2026-03-20");

      expect(expirationDate.toDateString()).toBe(expectedDate.toDateString());

      vi.useRealTimers();
    });
  });

  describe("generateQRCodeContent", () => {
    it("should generate valid QR code content", () => {
      const content = generateQRCodeContent("John Doe");
      const parsed = JSON.parse(content);

      expect(parsed.name).toBe("John Doe");
      expect(parsed.contact).toBe("John Doe@qrtracker.app");
      expect(parsed.timestamp).toBeDefined();
    });

    it("should handle special characters in name", () => {
      const content = generateQRCodeContent("Jane O'Brien");
      const parsed = JSON.parse(content);

      expect(parsed.name).toBe("Jane O'Brien");
      expect(parsed.contact).toBe("Jane O'Brien@qrtracker.app");
    });
  });

  describe("createQRCodeData", () => {
    it("should create QR code data object", () => {
      const now = new Date("2026-03-25");
      vi.useFakeTimers();
      vi.setSystemTime(now);

      const qrData = createQRCodeData("Alice", 30);

      expect(qrData.userName).toBe("Alice");
      expect(qrData.contactInfo).toBe("Alice@qrtracker.app");
      expect(qrData.generatedAt).toEqual(now);
      expect(qrData.expiresAt.toDateString()).toBe(new Date("2026-04-24").toDateString());

      vi.useRealTimers();
    });
  });

  describe("formatDate", () => {
    it("should format date correctly", () => {
      const date = new Date("2026-03-25T00:00:00Z");
      const formatted = formatDate(date);

      expect(formatted).toContain("2026");
      expect(formatted).toContain("Mar");
    });

    it("should handle different months", () => {
      const date = new Date("2026-12-31T00:00:00Z");
      const formatted = formatDate(date);

      expect(formatted).toContain("2026");
      expect(formatted).toContain("Dec");
    });
  });

  describe("isQRCodeExpired", () => {
    it("should return false for future date", () => {
      const futureDate = new Date();
      futureDate.setDate(futureDate.getDate() + 10);

      expect(isQRCodeExpired(futureDate)).toBe(false);
    });

    it("should return true for past date", () => {
      const pastDate = new Date();
      pastDate.setDate(pastDate.getDate() - 10);

      expect(isQRCodeExpired(pastDate)).toBe(true);
    });

    it("should return false for future time on same day", () => {
      const futureTime = new Date();
      futureTime.setHours(futureTime.getHours() + 1);
      expect(isQRCodeExpired(futureTime)).toBe(false);
    });
  });

  describe("getDaysRemaining", () => {
    it("should calculate days remaining correctly", () => {
      const futureDate = new Date();
      futureDate.setDate(futureDate.getDate() + 5);

      const daysRemaining = getDaysRemaining(futureDate);
      expect(daysRemaining).toBe(5);
    });

    it("should return 0 for expired date", () => {
      const pastDate = new Date();
      pastDate.setDate(pastDate.getDate() - 5);

      const daysRemaining = getDaysRemaining(pastDate);
      expect(daysRemaining).toBe(0);
    });

    it("should handle exact day boundary", () => {
      const tomorrow = new Date();
      tomorrow.setDate(tomorrow.getDate() + 1);
      tomorrow.setHours(0, 0, 0, 0);

      const daysRemaining = getDaysRemaining(tomorrow);
      expect(daysRemaining).toBeGreaterThanOrEqual(0);
    });
  });
});
