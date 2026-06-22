def call(csvFile,id,name,dept){

    def exists = sh(
        script: "grep '^${id},' ${csvFile}",
        returnStatus: true
    )

    if(exists == 0){
        error("Employee ID already exists")
    }

    sh """
       echo '${id},${name},${dept}' >> ${csvFile}
    """
}
