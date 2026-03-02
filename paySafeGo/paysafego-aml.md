graph TD;
    A[Start] --> B{Is it a valid transaction?};
    B -- Yes --> C[Process transaction];
    B -- No --> D[Reject transaction];
    C --> E{Is there a need for alerts?};
    E -- Yes --> F[Send alerts];
    E -- No --> G[End];
    D --> G;
    F --> G;