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
    this.fileSelectedHandler = this.fileSelectedHandler.bind(this)
  }

  fileSelectedHandler(event) {
    this.props.handleCsv(event)
  }

  render () {
    const {csvRequired} = this.props
    return (
      <div>
        <label htmlFor="csvFile">Select File</label>
        <input id="csvFile" ref={(fileInput) => this.csv = fileInput} type="file" multiple={false} onChange={this.fileSelectedHandler} required={csvRequired} />
      </div>
    )
  }
}

FileUpload.propTypes = {
  csv: PropTypes.object,
  csvRequired: PropTypes.bool,
  handleCsv: PropTypes.func.isRequired,
}

