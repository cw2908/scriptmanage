import React, { Component } from "react"
import PropTypes from "prop-types"
import {Toast, ToastContainer} from "@salesforce/design-system-react" 

const codeMapper = {
  200: "success",
  400: "warning",
  500: "error"
}


class Notification extends Component {
  render() {
    const {status_code, message, closeFunction} = this.props
    return (
      <div id='service-notification'>
        <ToastContainer className='service-notification'>
          <Toast
            labels={{
              heading: message,
            }}
            onRequestClose={closeFunction}
            variant={codeMapper[status_code] || "warning"}
          />
        </ToastContainer>
        
      </div>
    )
  }
}


Notification.propTypes = {
  message: PropTypes.string.isRequired,
  status_code: PropTypes.number.isRequired,
  closeFunction: ptfr
}
export default Notification