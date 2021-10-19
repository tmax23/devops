def buildApp() {
    echo "Building app ..."
}

def testApp() {
    echo "Testing app ..."
}

def deployApp() {
  echo "Deploying the application..."
  echo "Deploying, print from parameters ${params.VERSION}"
}

return this
