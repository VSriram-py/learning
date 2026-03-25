/**
 * User session data
 */
export interface UserSession {
  name: string;
  createdAt: Date;
}

/**
 * QR Code data structure
 */
export interface QRCodeData {
  userName: string;
  contactInfo: string;
  generatedAt: Date;
  expiresAt: Date;
}

/**
 * App state
 */
export interface AppState {
  user: UserSession | null;
  qrCode: QRCodeData | null;
}
