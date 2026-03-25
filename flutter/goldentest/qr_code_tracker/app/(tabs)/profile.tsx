import { useEffect } from "react";
import { View, Text, TouchableOpacity, ScrollView } from "react-native";
import { useRouter } from "expo-router";
import { ScreenContainer } from "@/components/screen-container";
import { useApp } from "@/lib/app-context";

export default function ProfileScreen() {
  const router = useRouter();
  const { user, logout } = useApp();

  // Redirect to login if no user
  useEffect(() => {
    if (!user) {
      router.replace("/login");
    }
  }, [user, router]);

  const handleLogout = () => {
    logout();
    router.replace("/login");
  };

  if (!user) {
    return (
      <ScreenContainer className="justify-center items-center">
        <Text className="text-foreground">Loading...</Text>
      </ScreenContainer>
    );
  }

  return (
    <ScreenContainer className="bg-background">
      <ScrollView contentContainerStyle={{ flexGrow: 1 }}>
        <View className="flex-1 px-6 py-8 gap-8">
          {/* Header */}
          <View className="items-center gap-2">
            <Text className="text-sm text-muted">Profile</Text>
            <Text className="text-3xl font-bold text-foreground">Your Account</Text>
          </View>

          {/* User Info Card */}
          <View className="bg-surface rounded-lg p-6 border border-border gap-4">
            <View>
              <Text className="text-xs text-muted mb-1">Name</Text>
              <Text className="text-xl font-semibold text-foreground">{user.name}</Text>
            </View>

            <View>
              <Text className="text-xs text-muted mb-1">Member Since</Text>
              <Text className="text-lg text-foreground">
                {user.createdAt.toLocaleDateString("en-US", {
                  year: "numeric",
                  month: "long",
                  day: "numeric",
                })}
              </Text>
            </View>
          </View>

          {/* Info Section */}
          <View className="bg-surface rounded-lg p-4 border border-border gap-2">
            <Text className="text-sm font-semibold text-foreground">About This App</Text>
            <Text className="text-sm text-muted leading-relaxed">
              QR Code Expiration Tracker helps you generate and manage personalized QR codes with expiration dates.
            </Text>
          </View>

          {/* Logout Button */}
          <View className="mt-auto">
            <TouchableOpacity
              onPress={handleLogout}
              style={(({ pressed }: { pressed: boolean }) => ({
                opacity: pressed ? 0.8 : 1,
              })) as any}
              className="bg-error rounded-lg py-3 items-center"
            >
              <Text className="text-background font-semibold text-base">Logout</Text>
            </TouchableOpacity>
          </View>
        </View>
      </ScrollView>
    </ScreenContainer>
  );
}
