import React, { Component } from "react"
import PropTypes from "prop-types"
// import { Input, Label } from "react-lightning-design-system"


export default class FileUpload extends Component {
  constructor(props) {
    super()
    this.state = {
      selectedFile: null,
      ...props
    }
  }

  render () {
    const {csvRequired, csvFieldName, handleCsv} = this.props
    return (
      <div>
        <label htmlFor="csvFile">Select File</label>
        <input id="csvFile" ref={(fileInput) => this.csv = fileInput} type="file" multiple={false} onChange={(e) => handleCsv(e, csvFieldName)} required={csvRequired} />
      </div>
    )
  }
}

FileUpload.propTypes = {
  csvFieldName: PropTypes.string.isRequired,
  csv: PropTypes.object,
  csvRequired: PropTypes.bool,
  handleCsv: PropTypes.func.isRequired,
}

