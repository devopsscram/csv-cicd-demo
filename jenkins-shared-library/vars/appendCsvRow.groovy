def call(Map config) {

    def csvFile = config.csvFile
    def rowData = config.rowData

    sh """
        echo '${rowData}' >> ${csvFile}
    """

    echo "Row appended successfully"
}
