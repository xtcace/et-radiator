ID="YOUR-REAL-ID"
FILES="index.html booking.html admin/index.html admin/dashboard.html"
for f in $FILES; do
  sed -i "s|</head>|<script async src=\"https://www.googletagmanager.com/gtag/js?id=$ID\"></script><script>window.dataLayer=window.dataLayer||[];function gtag(){dataLayer.push(arguments)}gtag('js',new Date());gtag('config','$ID');</script></head>|g" $f
done
echo "Done"
