import React, { Component } from "react"
import PropTypes from "prop-types"
import axios from "axios"
import ReactDOM from "react-dom"
import Notification from "./Notification"
import { Button, Dropdown, DropdownTrigger, PageHeader } from "@salesforce/design-system-react"
import IconSettings from "@salesforce/design-system-react/components/icon-settings"

class Services extends Component {
  constructor(props) {
    super(props)
    this.state = {

    }
    this.updateSelection = this.updateSelection.bind(this)
    this.handleSubmit = this.handleSubmit.bind(this)
  }

  updateSelection(value) {
    console.log({value})
    this.setState({service: value})
  }

  reInit(data) {
    console.log({data})
    console.log(data)
    this.setState({
      message: data.message || data.data.message,
      status_code: data.status || data.response && data.response.status,
      service_name: null
    })
  }

  handleSubmit(e) {
    e.preventDefault()
    const params = {
      service: {
        service_name: this.state.service && this.state.service.service_name,
      },
      authenticity_token: this.props.authenticityToken
    }
    console.log({params})
    axios
      .post("./services",params)
      .then(data => this.reInit(data))
      .catch(data => this.reInit(data))
  }

  renderNotifications() {
    const {status_code, message } = this.state
    return (status_code || message 
      ? <Notification 
        status_code={status_code}
        message={message}
        closeFunction={() => this.setState({status_code: null, message: null})}
      />
      : null)
  }

  render() {
    const {availableServices} = this.props
    const dropdownOptions = availableServices
      .map(service => {return {label: service.name, service_name: service.service_name}})
    console.log({state: this.state})
    console.log({props: this.props})
    const dropdownText = this.state.service && this.state.service.label || "Select"

    return (
      <IconSettings iconPath="/assets/icons">
          
        <div className='service-form'>
          <PageHeader title='Request Service'/>
          {this.renderNotifications()}
          <Dropdown
            className='service-dropdown'
            tabIndex='-1'
            options={dropdownOptions}
            onSelect={(service_name) => this.updateSelection(service_name)}
          >
            <DropdownTrigger className='service-dropdown'>
              <Button
                iconCategory='utility'
                iconName='down'
                iconPosition='right'
                label={dropdownText}
                value={this.state.service && this.state.service.label}
              />
            </DropdownTrigger>
          </Dropdown>
          <div className='service-submit'>
            <Button
              className='service-submit-button'
              label='Submit'
              variant='brand'
              onClick={(e) => this.handleSubmit(e)}
            />
          </div>
        </div>
      </IconSettings>
    )
  }
}


document.addEventListener("DOMContentLoaded", (e) => {
  e.preventDefault()
  const node = document.getElementById("services")
  if (node) {
    
    const authenticityToken = JSON.parse(node.getAttribute("authenticityToken"))
    const availableServices = JSON.parse(node.getAttribute("availableServices"))
    ReactDOM.render(
      <Services
        authenticityToken={authenticityToken}
        availableServices={availableServices}
      />,
      document.getElementById("app-content").appendChild(document.createElement("div"))
    )
  }
})



Services.propTypes = {
  authenticityToken: PropTypes.string.isRequired,
  availableServices: PropTypes.array.isRequired,
}

export default Services