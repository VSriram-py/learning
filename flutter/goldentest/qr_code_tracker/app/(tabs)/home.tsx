import { useEffect, useState } from "react";
import { View, Text, ScrollView, TouchableOpacity, Alert } from "react-native";
import { useRouter } from "expo-router";
import QRCode from "qrcode";
import { Image } from "react-native";
import { ScreenContainer } from "@/components/screen-container";
import { useApp } from "@/lib/app-context";
import { formatDate, getDaysRemaining, generateQRCodeContent } from "@/lib/qr-utils";

export default function HomeScreen() {
  const router = useRouter();
  const { user, qrCode, generateQRCode } = useApp();
  const [qrCodeImage, setQRCodeImage] = useState<string | null>(null);

  // Redirect to login if no user
  useEffect(() => {
    if (!user) {
      router.replace("/login");
      return;
    }

    // Generate QR code on mount
    const expirationDays = parseInt(process.env.QR_CODE_EXPIRATION_DAYS || "30", 10);
    generateQRCode(expirationDays);
  }, [user, router, generateQRCode]);

  // Generate QR code image
  useEffect(() => {
    if (qrCode) {
      const generateQRImage = async () => {
        try {
          const content = generateQRCodeContent(qrCode.userName);
          const dataUrl = await QRCode.toDataURL(content, {
            errorCorrectionLevel: (process.env.QR_CODE_ERROR_CORRECTION_LEVEL as any) || "M",
            type: "image/png",
            width: 300,
            margin: 2,
            color: {
              dark: "#000000",
              light: "#FFFFFF",
            },
          });
          setQRCodeImage(dataUrl);
        } catch (error) {
          console.error("Error generating QR code:", error);
          Alert.alert("Error", "Failed to generate QR code");
        }
      };

      generateQRImage();
    }
  }, [qrCode]);

  if (!user || !qrCode) {
    return (
      <ScreenContainer className="justify-center items-center">
        <Text className="text-foreground">Loading...</Text>
      </ScreenContainer>
    );
  }

  const daysRemaining = getDaysRemaining(qrCode.expiresAt);
  const isExpired = daysRemaining <= 0;

  return (
    <ScreenContainer className="bg-background">
      <ScrollView contentContainerStyle={{ flexGrow: 1 }}>
        <View className="flex-1 px-6 py-8 gap-8">
          {/* User Info */}
          <View className="items-center gap-2">
            <Text className="text-sm text-muted">Welcome,</Text>
            <Text className="text-3xl font-bold text-foreground">{user.name}</Text>
          </View>

          {/* Current Date */}
          <View className="items-center bg-surface rounded-lg p-4 border border-border">
            <Text className="text-xs text-muted mb-1">Today's Date</Text>
            <Text className="text-2xl font-semibold text-foreground">
              {formatDate(new Date())}
            </Text>
          </View>

          {/* QR Code */}
          <View className="items-center bg-surface rounded-lg p-8 border border-border">
            <Text className="text-sm text-muted mb-4">Your QR Code</Text>
            {qrCodeImage ? (
              <Image
                source={{ uri: qrCodeImage }}
                style={{ width: 250, height: 250 }}
                testID="qr-code-image"
              />
            ) : (
              <View className="w-64 h-64 bg-border rounded-lg items-center justify-center">
                <Text className="text-muted">Generating QR Code...</Text>
              </View>
            )}
          </View>

          {/* Expiration Date */}
          <View className="items-center gap-2">
            <Text className="text-sm text-muted">Expiration Date</Text>
            <Text
              className={`text-4xl font-bold ${isExpired ? "text-error" : "text-foreground"}`}
              testID="expiration-date"
            >
              {formatDate(qrCode.expiresAt)}
            </Text>
            <Text className={`text-sm ${isExpired ? "text-error" : "text-muted"}`}>
              {isExpired ? "EXPIRED" : `${daysRemaining} days remaining`}
            </Text>
          </View>

          {/* Profile Button */}
          <View className="mt-auto">
            <TouchableOpacity
              onPress={() => router.push("/(tabs)/profile")}
              style={(({ pressed }: { pressed: boolean }) => ({
                opacity: pressed ? 0.8 : 1,
              })) as any}
              className="bg-primary rounded-lg py-3 items-center"
            >
              <Text className="text-background font-semibold text-base">View Profile</Text>
            </TouchableOpacity>
          </View>
        </View>
      </ScrollView>
    </ScreenContainer>
  );
}
