import { useState } from "react";
import { View, Text, TextInput, TouchableOpacity, ScrollView, Alert, StyleSheet, type ViewStyle } from "react-native";
import { useRouter } from "expo-router";
import { ScreenContainer } from "@/components/screen-container";
import { useApp } from "@/lib/app-context";

export default function LoginScreen() {
  const router = useRouter();
  const { login } = useApp();
  const [name, setName] = useState("");
  const [isLoading, setIsLoading] = useState(false);

  const handleSubmit = () => {
    if (!name.trim()) {
      Alert.alert("Error", "Please enter your name");
      return;
    }

    setIsLoading(true);
    // Simulate a small delay for better UX
    setTimeout(() => {
      login(name.trim());
      setIsLoading(false);
      router.replace("/(tabs)");
    }, 300);
  };

  return (
    <ScreenContainer className="bg-background">
      <ScrollView contentContainerStyle={{ flexGrow: 1 }}>
        <View className="flex-1 items-center justify-center px-6 gap-8">
          {/* Header */}
          <View className="items-center gap-2">
            <Text className="text-4xl font-bold text-foreground">QR Tracker</Text>
            <Text className="text-base text-muted text-center">
              Generate and track your QR codes with expiration dates
            </Text>
          </View>

          {/* Input Section */}
          <View className="w-full max-w-sm gap-4">
            <View className="gap-2">
              <Text className="text-sm font-semibold text-foreground">Your Name</Text>
              <TextInput
                placeholder="Enter your name"
                placeholderTextColor="#999"
                value={name}
                onChangeText={setName}
                editable={!isLoading}
                className="w-full bg-surface border border-border rounded-lg px-4 py-3 text-foreground"
                returnKeyType="done"
                onSubmitEditing={handleSubmit}
              />
            </View>

            <TouchableOpacity
              onPress={handleSubmit}
              disabled={isLoading}
              style={(({ pressed }: { pressed: boolean }): ViewStyle => ({
                opacity: pressed && !isLoading ? 0.8 : 1,
              })) as any}
              className="bg-primary rounded-lg py-3 items-center"
            >
              <Text className="text-background font-semibold text-base">
                {isLoading ? "Loading..." : "Continue"}
              </Text>
            </TouchableOpacity>
          </View>

          {/* Footer */}
          <View className="items-center gap-1">
            <Text className="text-xs text-muted">
              Your name is used only to generate your QR code
            </Text>
            <Text className="text-xs text-muted">
              No data is stored or shared
            </Text>
          </View>
        </View>
      </ScrollView>
    </ScreenContainer>
  );
}
