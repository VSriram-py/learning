import React, { createContext, useContext, useState, useCallback } from "react";
import type { UserSession, QRCodeData } from "./types";
import { createQRCodeData } from "./qr-utils";

interface AppContextType {
  user: UserSession | null;
  qrCode: QRCodeData | null;
  login: (name: string) => void;
  logout: () => void;
  generateQRCode: (expirationDays: number) => void;
}

const AppContext = createContext<AppContextType | undefined>(undefined);

export function AppProvider({ children }: { children: React.ReactNode }) {
  const [user, setUser] = useState<UserSession | null>(null);
  const [qrCode, setQRCode] = useState<QRCodeData | null>(null);

  const login = useCallback((name: string) => {
    setUser({
      name,
      createdAt: new Date(),
    });
  }, []);

  const logout = useCallback(() => {
    setUser(null);
    setQRCode(null);
  }, []);

  const generateQRCode = useCallback(
    (expirationDays: number) => {
      if (user) {
        const qrData = createQRCodeData(user.name, expirationDays);
        setQRCode(qrData);
      }
    },
    [user]
  );

  return (
    <AppContext.Provider
      value={{
        user,
        qrCode,
        login,
        logout,
        generateQRCode,
      }}
    >
      {children}
    </AppContext.Provider>
  );
}

export function useApp() {
  const context = useContext(AppContext);
  if (!context) {
    throw new Error("useApp must be used within AppProvider");
  }
  return context;
}
