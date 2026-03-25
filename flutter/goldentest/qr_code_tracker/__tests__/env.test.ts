import { describe, it, expect } from "vitest";

describe("Environment Variables", () => {
  it("should load APP_VERSION from environment", () => {
    expect(process.env.APP_VERSION).toBeDefined();
    expect(typeof process.env.APP_VERSION).toBe("string");
  });

  it("should load ENVIRONMENT from environment", () => {
    expect(process.env.ENVIRONMENT).toBe("development");
  });

  it("should load QR_CODE_EXPIRATION_DAYS from environment", () => {
    expect(process.env.QR_CODE_EXPIRATION_DAYS).toBe("30");
  });

  it("should load QR_CODE_ERROR_CORRECTION_LEVEL from environment", () => {
    expect(process.env.QR_CODE_ERROR_CORRECTION_LEVEL).toBe("M");
  });

  it("should load LOG_LEVEL from environment", () => {
    expect(process.env.LOG_LEVEL).toBe("info");
  });

  it("should have valid QR_CODE_EXPIRATION_DAYS as number", () => {
    const days = parseInt(process.env.QR_CODE_EXPIRATION_DAYS || "30", 10);
    expect(days).toBeGreaterThan(0);
    expect(days).toBeLessThanOrEqual(365);
  });

  it("should have valid QR_CODE_ERROR_CORRECTION_LEVEL", () => {
    const validLevels = ["L", "M", "Q", "H"];
    expect(validLevels).toContain(process.env.QR_CODE_ERROR_CORRECTION_LEVEL);
  });
});
