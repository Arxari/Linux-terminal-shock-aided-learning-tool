command_not_found_handler() {
    local api_key="placeholder"  # Replace with your API key
    local shock_id="placeholder"  # Replace with your shocker ID
    local intensity=50  # Set the intensity (0-100)
    local duration=1000  # Set the duration in milliseconds
    local shock_type="Shock" # Can also vibrate or beep

    echo "Command '$1' not found. Sending shock..."

    response=$(curl -s -w "%{http_code}" -o /dev/null -X POST \
        "https://api.shocklink.net/2/shockers/control" \
        -H "accept: application/json" \
        -H "OpenShockToken: $api_key" \
        -H "Content-Type: application/json" \
        -d '{
            "shocks": [{
                "id": "'"$shock_id"'",
                "type": "'"$shock_type"'",
                "intensity": '"$intensity"',
                "duration": '"$duration"',
                "exclusive": true
            }],
            "customName": "Linux terminal shock aided learning tool"
        }')

    if [ "$response" -eq 200 ]; then
        echo "$shock_type sent successfully." # You can change this to something funny or cool if you wanna
    else
        echo "Failed to send $shock_type. Response code: $response"
    fi
}
