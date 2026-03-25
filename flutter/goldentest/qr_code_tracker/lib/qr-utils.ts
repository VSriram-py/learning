import type { QRCodeData } from "./types";

/**
 * Calculate expiration date by adding days to current date
 */
export function calculateExpirationDate(days: number): Date {
  const expirationDate = new Date();
  expirationDate.setDate(expirationDate.getDate() + days);
  return expirationDate;
}

/**
 * Generate QR code content string
 */
export function generateQRCodeContent(userName: string): string {
  const contactInfo = `${userName}@qrtracker.app`;
  return JSON.stringify({
    name: userName,
    contact: contactInfo,
    timestamp: new Date().toISOString(),
  });
}

/**
 * Create QR code data object
 */
export function createQRCodeData(userName: string, expirationDays: number): QRCodeData {
  const now = new Date();
  const expiresAt = calculateExpirationDate(expirationDays);

  return {
    userName,
    contactInfo: `${userName}@qrtracker.app`,
    generatedAt: now,
    expiresAt,
  };
}

/**
 * Format date to readable string (e.g., "Mar 25, 2026")
 */
export function formatDate(date: Date): string {
  return date.toLocaleDateString("en-US", {
    year: "numeric",
    month: "short",
    day: "numeric",
  });
}

/**
 * Check if QR code is expired
 */
export function isQRCodeExpired(expiresAt: Date): boolean {
  return new Date() > expiresAt;
}

/**
 * Get days remaining until expiration
 */
export function getDaysRemaining(expiresAt: Date): number {
  const now = new Date();
  const diffTime = expiresAt.getTime() - now.getTime();
  const diffDays = Math.ceil(diffTime / (1000 * 60 * 60 * 24));
  return Math.max(0, diffDays);
}
