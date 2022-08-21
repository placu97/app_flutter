## First Commit

This code includes:
flutter init

(
	COnnect external services:
pull the app. It now needs to be initialized: create Firebase proj ont the website (activate various services) and use
#flutterfire config
in order to connect the app to FIrebase
# Ok good to go
)

#Next commit will be about full login impl


# In this commit:
- google apple signin/login

fatto. : passaggi:
1)
<!-- Put me in the [my_project]/ios/Runner/Info.plist file -->
<!-- Google Sign-in Section -->
<key>CFBundleURLTypes</key>
<array>
	<dict>
		<key>CFBundleTypeRole</key>
		<string>Editor</string>
		<key>CFBundleURLSchemes</key>
		<array>
			<!-- TODO Replace this value: -->
			<!-- Copied from GoogleService-Info.plist key REVERSED_CLIENT_ID -->
			<string>com.googleusercontent.apps.861823949799-vc35cprkp249096uujjn0vvnmcvjppkn</string>
		</array>
	</dict>
</array>
<!-- End of the Google Sign-in Section -->

2)penso rifare flutterfire config dopo aver di fatto inserito i sha-1 e 256 
https://console.firebase.google.com/u/0/project/yoo-yoo-bfe2e/settings/general/android:com.example.yoo
clicca su App ANdroid e inserisci le due chiavi OTTENUTE
tramite comandi keytool, seguire istruzioni presenti sull apagina

QUESTO COMMIT E' OK testato sia ios che android

# nel prossimo commit: apple auth

# nel prossimo commit: attuale implementazione UI - Login
- 