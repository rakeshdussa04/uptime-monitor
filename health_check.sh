# ... existing disk check ...

# NEW: Check if RAM is dangerously low (less than 500MB)
if [ $FREE_RAM -lt 500 ]; then
    echo "⚠️ WARNING: Low Memory! Only ${FREE_RAM}MB free."
else
    echo "✅ Memory is healthy."
fi
